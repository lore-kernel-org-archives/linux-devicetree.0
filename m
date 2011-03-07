From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH RFC 0/5] Dynamically add clk to clkdev per dt clock nodes
Date: Tue,  8 Mar 2011 00:22:07 +0800
Message-ID: <1299514932-13558-1-git-send-email-shawn.guo@linaro.org>
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
To: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Before translating all mx5 clocks from static adding way to dynamic
way, I would send this out for review and comment, so that I can turn
around in case that I'm on a wrong direction.

It's based on Jason's mx51-basic-dt-support patch set, and only adds
gpt and uart related clocks, but it's enough to get the system at
where Jason's patch can get.

 [PATCH 1/5] arm/dts: babbage: add gpt and uart related clock nodes
 [PATCH 2/5] arm/mxc: add clk members to ease dt clock support
 [PATCH 3/5] arm/dt: mx51: dynamically add gpt and uart related clocks per dt nodes
 [PATCH 4/5] arm/dt: mx5: change timer init function to dt clock way
 [PATCH 5/5] of/clock: eliminate function __of_clk_get_from_provider

 arch/arm/boot/dts/babbage.dts          |  162 ++++++++++++-
 arch/arm/mach-mx5/board-dt.c           |    9 +-
 arch/arm/mach-mx5/clock-mx51-mx53.c    |  436 +++++++++++++++++++++++++++++++-
 arch/arm/plat-mxc/include/mach/clock.h |    4 +
 drivers/of/clock.c                     |   23 +--
 drivers/tty/serial/imx.c               |   79 +++++-
 6 files changed, 661 insertions(+), 52 deletions(-)

Regards,
Shawn
