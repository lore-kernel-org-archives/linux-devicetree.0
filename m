From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/5] add full platform dt clock support for mx51 babbage
Date: Mon, 14 Mar 2011 21:18:37 +0800
Message-ID: <1300108722-3254-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Cc: patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch set is to add full platform dt clock support for mx51
babbage, based on Jason's basic-mx51-dt patch.  All mx51 non-dt clocks
in clock-mx51-mx53.c are translated to dt ones.

Shawn Guo (5):
      arm/dts: babbage: add all available clock nodes
      arm/mxc: add clk member 'rate' to ease dt fixed-clock support
      arm/dt: mx51: dynamically add clocks per dt nodes
      arm/dt: mx5: change timer init function to dt clock way
      of/clock: eliminate function __of_clk_get_from_provider

 arch/arm/boot/dts/babbage.dts          |  495 +++++++++++-
 arch/arm/mach-mx5/board-dt.c           |    9 +-
 arch/arm/mach-mx5/clock-mx51-mx53.c    | 1401 +++++++++++++++++++++++++++++++-
 arch/arm/plat-mxc/include/mach/clock.h |    4 +
 drivers/of/clock.c                     |   23 +-
 5 files changed, 1886 insertions(+), 46 deletions(-)

Regards,
Shawn
