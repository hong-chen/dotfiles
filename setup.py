import os
import re

class SETUP(object):

    def __init__(self):

        self.MATPLOTLIB()

    def MATPLOTLIB(self):

        try:
            import matplotlib as mpl
            fdir_mpl_data  = mpl.get_data_path()
            fdir_mpl_cfg   = mpl.get_configdir()
            fdir_mpl_cache = mpl.get_cachedir()

            # check if matplotlibrc exists under configure directory
            fname_cfg        = '%s/matplotlibrc'        % fdir_mpl_cfg
            fname_cfg_backup = '%s/matplotlibrc_backup' % fdir_mpl_cfg
            if not os.path.isfile(fname_cfg):
                os.system('cp %s/matplotlibrc %s' % (fdir_mpl_data, fname_cfg_backup))
            else:
                os.system('mv %s %s' % (fname_cfg, fname_cfg_backup))
            exit()

            my_rcParams = {
                    'lines.linewidth' : '1.5',
                    'patch.edgecolor' : 'none',
                    'font.size'       : '16.0',
                    'font.serif'      : 'Times New Roman',
                    'font.sans-serif' : 'Times New Roman',
                    'mathtext.fontset': 'stix',
                    'axes.prop_cycle' : 'cycler(''color'', ''krbgcmy'')',
                    'xtick.major.size'  : '4.0',
                    'xtick.minor.size'  : '2.0',
                    'xtick.major.width' : '1.0',
                    'xtick.minor.width' : '1.0',
                    'xtick.direction' : 'in',
                    'ytick.major.size'  : '4.0',
                    'ytick.minor.size'  : '2.0',
                    'ytick.major.width' : '1.0',
                    'ytick.minor.width' : '1.0',
                    'ytick.direction' : 'in',
                    'grid.color'      : 'grey',
                    'grid.linewidth'  : '0.5',
                    'figure.figsize'  : '6.0, 4.0',
                    'figure.dpi'      : '100',
                    'figure.max_open_warning': '1000',
                    'savefig.dpi'     : '220',
                    'savefig.format'  : 'svg',
                    'savefig.bbox'    : 'tight',
                    'savefig.transparent' : 'True'
                    }


            pattern  = re.compile('.*\..*')
            f_backup = open(fname_cfg_backup, 'r')

            for line in f_backup:
                if ':' in line:
                    vname0     = line.split(':')[0].replace('#', '').replace(' ', '')
                    if pattern.match(vname0) and vname0 in my_rcParams.keys():
                        print(line, line[1:].find('#'))
                    else:
                        newline = line

                else:
                    newline = line

            f_backup.close()

            #  os.system('rm -rf %s' % fdir_mpl_cache)

            print(fdir_mpl_data)

        except ImportError:
            exit('Warning [SETUP.MATPLOTLIB]: matplotlib is not available.')

if __name__ == "__main__":

    init = SETUP()
