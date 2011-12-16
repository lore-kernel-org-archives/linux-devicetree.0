From: Mark Langsdorf <mark.langsdorf-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH V2 3/4] arm/imx6q: register arm_clk as cpu to clkdev
Date: Fri, 16 Dec 2011 11:35:39 -0500
Message-ID: <21672683C5A3814BB4DB938EBE482DE40A1AE8EF74@IAD2MBX09.mex02.mlsrvr.com>
References: <1324031462-24961-1-git-send-email-richard.zhao@linaro.org>,
	<1324031462-24961-4-git-send-email-richard.zhao@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <1324031462-24961-4-git-send-email-richard.zhao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Richard Zhao <richard.zhao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "cpufreq-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <cpufreq-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: "linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org" <linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, "patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "eric.miao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <eric.miao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "davej-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <davej-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Is there a portable/generic approach for other drivers that may
want to use arm-cpufreq.c? arm_clk is not normally defined for
my SoC and I don't see an easy way to pull it in.

--Mark Langsdorf
Calxeda, Inc.

________________________________________
From: Richard Zhao [richard.zhao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org]
Sent: Friday, December 16, 2011 4:31 AM
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; cpufreq-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org; davej-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org; kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org; shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org; eric.miao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org; Mark Langsdorf; linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org; patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org; Richard Zhao
Subject: [PATCH V2 3/4] arm/imx6q: register arm_clk as cpu to clkdev

cpufreq needs cpu clock to change frequency.

Signed-off-by: Richard Zhao <richard.zhao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/mach-imx/clock-imx6q.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-imx/clock-imx6q.c b/arch/arm/mach-imx/clock-imx6q.c
index 039a7ab..72acbc2 100644
--- a/arch/arm/mach-imx/clock-imx6q.c
+++ b/arch/arm/mach-imx/clock-imx6q.c
@@ -1911,6 +1911,7 @@ static struct clk_lookup lookups[] = {
        _REGISTER_CLOCK(NULL, "gpmi_io_clk", gpmi_io_clk),
        _REGISTER_CLOCK(NULL, "usboh3_clk", usboh3_clk),
        _REGISTER_CLOCK(NULL, "sata_clk", sata_clk),
+       _REGISTER_CLOCK(NULL, "cpu", arm_clk),
 };

 int imx6q_set_lpm(enum mxc_cpu_pwr_mode mode)
--
1.7.5.4
