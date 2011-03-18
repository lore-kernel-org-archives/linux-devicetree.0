From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 0/6] add full platform dt clock support for mx51 babbage
Date: Sat, 19 Mar 2011 02:24:26 +0800
Message-ID: <1300472672-13392-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch set is to add full platform dt clock support for mx51
babbage, based on Grant's devicetree/test tree.  All mx51 non-dt
clocks in clock-mx51-mx53.c are translated to dt ones.

Regards,
Shawn

Changes since v1:
 * unify the references to clocks that could be created statically
   and dynamically, so that we do not have to duplicate functions
 * use for_each_matching_node suggested by Grant to match clock
   creating functions
 * reserve 'data' of device_node structure and use new one 'clk'
 * change macro ALLOC_CLK_LOOKUP and ADD_CLK_LOOKUP to functions
 * fix codes that will break existing board support
 * use clock provider 'src-clock' and 'dep-clock'
 * fix up aips and spba node name to remove address info (suggestion
   given by Grant on Jason's patch)

Shawn Guo (6):
      arm/dts: babbage: add all available clock nodes
      arm/mxc: add clk member 'rate' to ease dt fixed-clock support
      dt: add new member 'clk' into device_node
      arm/dt: mx51: dynamically add clocks per dt nodes
      arm/dt: mx5: change timer init function to dt clock way
      of/clock: eliminate function __of_clk_get_from_provider

 arch/arm/boot/dts/babbage.dts          |  501 +++++++++++-
 arch/arm/mach-mx5/Makefile             |    2 +-
 arch/arm/mach-mx5/board-dt.c           |    9 +-
 arch/arm/mach-mx5/clock-dt.c           |   52 --
 arch/arm/mach-mx5/clock-mx51-mx53.c    | 1433 +++++++++++++++++++++++++++++++-
 arch/arm/plat-mxc/include/mach/clock.h |    4 +
 drivers/of/clock.c                     |   23 +-
 include/linux/of.h                     |    1 +
 8 files changed, 1913 insertions(+), 112 deletions(-)
