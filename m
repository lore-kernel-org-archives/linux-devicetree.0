From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 14/19] ARM: mmp: add support for MMP3 SoC
Date: Fri, 16 Aug 2019 11:06:00 -0700
Message-ID: <20190816180601.427BC20665@mail.kernel.org>
References: <20190809093158.7969-1-lkundrak@v3.sk>
 <20190809093158.7969-15-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190809093158.7969-15-lkundrak@v3.sk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Russell King <linux@armlinux.org.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Lubomir Rintel (2019-08-09 02:31:53)
> diff --git a/drivers/clk/mmp/Makefile b/drivers/clk/mmp/Makefile
> index 7bc7ac69391e3..deb069a4e4215 100644
> --- a/drivers/clk/mmp/Makefile
> +++ b/drivers/clk/mmp/Makefile
> @@ -9,6 +9,7 @@ obj-$(CONFIG_RESET_CONTROLLER) += reset.o
>  
>  obj-$(CONFIG_MACH_MMP_DT) += clk-of-pxa168.o clk-of-pxa910.o
>  obj-$(CONFIG_MACH_MMP2_DT) += clk-of-mmp2.o
> +obj-$(CONFIG_MACH_MMP3_DT) += clk-of-mmp2.o
>  

Maybe make a Kconfig variable in drivers/clk/mmp/Kconfig that builds
clk-of-mmp2.c and is selected by MACH_MMP*_DT?

>  obj-$(CONFIG_CPU_PXA168) += clk-pxa168.o
>  obj-$(CONFIG_CPU_PXA910) += clk-pxa910.o
