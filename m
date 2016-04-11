From: Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [RESEND PATCH v4] clk/axs10x: Add I2S PLL clock driver
Date: Mon, 11 Apr 2016 16:47:51 +0000
Message-ID: <1460393270.5119.20.camel@synopsys.com>
References: <50c75be8ecab225a1dd49628a173d211a02755b2.1459791946.git.joabreu@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-7"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50c75be8ecab225a1dd49628a173d211a02755b2.1459791946.git.joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Content-ID: <326FDFAA055727429000EC50BBEA85FF-z7JfP6tgrtVBCHUSTMH8dZqQE7yCjDx5@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jose Abreu <Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org" <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Carlos Palminha <CARLOS.PALMINHA-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jose,

On Mon, 2016-04-11 at 11:41 +-0100, Jose Abreu wrote:
+AD4- The ARC SDP I2S clock can be programmed using a
+AD4- specific PLL.
+AD4- 
+AD4- This patch has the goal of adding a clock driver
+AD4- that programs this PLL.
+AD4- 
+AD4- At this moment the rate values are hardcoded in
+AD4- a table but in the future it would be ideal to
+AD4- use a function which determines the PLL values
+AD4- given the desired rate.
+AD4- 
+AD4- Signed-off-by: Jose Abreu +ADw-joabreu+AEA-synopsys.com+AD4-
+AD4- ---
+AD4- 
+AD4- Changes v3 -+AD4- v4:
+AD4- +ACo- Added binding document (as suggested by Stephen Boyd)
+AD4- +ACo- Minor code style fixes (as suggested by Stephen Boyd)
+AD4- +ACo- Use ioremap (as suggested by Stephen Boyd)
+AD4- +ACo- Implement round+AF8-rate (as suggested by Stephen Boyd)
+AD4- +ACo- Change to platform driver (as suggested by Stephen Boyd)
+AD4- +ACo- Use +AHs-readl/writel+AH0AXw-relaxed (as suggested by Vineet Gupta)
+AD4- 
+AD4- Changes v2 -+AD4- v3:
+AD4- +ACo- Implemented recalc+AF8-rate
+AD4- 
+AD4- Changes v1 -+AD4- v2:
+AD4- +ACo- Renamed folder to axs10x (as suggested by Alexey Brodkin)
+AD4- +ACo- Added more supported rates

+AFs-snip+AF0-

+AD4- diff --git a/Documentation/devicetree/bindings/clock/i2s-pll-clock.txt b/Documentation/devicetree/bindings/clock/i2s-
+AD4- pll-clock.txt
+AD4- new file mode 100644
+AD4- index 0000000..ff86a41
+AD4- --- /dev/null
+AD4- +-+-+- b/Documentation/devicetree/bindings/clock/i2s-pll-clock.txt
+AD4- +AEAAQA- -0,0 +-1,17 +AEAAQA-
+AD4- +-Binding for the AXS10X I2S PLL clock
+AD4- +-
+AD4- +-This binding uses the common clock binding+AFs-1+AF0-.
+AD4- +-
+AD4- +-+AFs-1+AF0- Documentation/devicetree/bindings/clock/clock-bindings.txt
+AD4- +-
+AD4- +-Required properties:
+AD4- +-- compatible: shall be +ACI-snps,i2s-pll-clock+ACI-
+AD4- +-- +ACM-clock-cells: from common clock binding+ADs- Should always be set to 0.
+AD4- +-- reg : Address and length of the I2S PLL register set.
+AD4- +-
+AD4- +-Example:
+AD4- +-	clock+AEA-0x100a0 +AHs-

Please remove +ACI-0x+ACI- from node name.

+AD4- +-		compatible +AD0- +ACI-snps,i2s-pll-clock+ACIAOw-
+AD4- +-		reg +AD0- +ADw-0x100a0 0x10+AD4AOw-
+AD4- +-		+ACM-clock-cells +AD0- +ADw-0+AD4AOw-
+AD4- +-	+AH0AOw-
+AD4- diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
+AD4- index 46869d6..2ca62dc6 100644
+AD4- --- a/drivers/clk/Makefile
+AD4- +-+-+- b/drivers/clk/Makefile
+AD4- +AEAAQA- -84,3 +-84,4 +AEAAQA- obj-+ACQ-(CONFIG+AF8-X86)			+-+AD0- x86/
+AD4- +AKA-obj-+ACQ-(CONFIG+AF8-ARCH+AF8-ZX)			+-+AD0- zte/
+AD4- +AKA-obj-+ACQ-(CONFIG+AF8-ARCH+AF8-ZYNQ)			+-+AD0- zynq/
+AD4- +AKA-obj-+ACQ-(CONFIG+AF8-H8300)		+-+AD0- h8300/
+AD4- +-obj-+ACQ-(CONFIG+AF8-ARC+AF8-PLAT+AF8-AXS10X)		+-+AD0- axs10x/
+AD4- diff --git a/drivers/clk/axs10x/Makefile b/drivers/clk/axs10x/Makefile
+AD4- new file mode 100644
+AD4- index 0000000..01996b8
+AD4- --- /dev/null
+AD4- +-+-+- b/drivers/clk/axs10x/Makefile
+AD4- +AEAAQA- -0,0 +-1 +AEAAQA-
+AD4- +-obj-y +-+AD0- i2s+AF8-pll+AF8-clock.o
+AD4- diff --git a/drivers/clk/axs10x/i2s+AF8-pll+AF8-clock.c b/drivers/clk/axs10x/i2s+AF8-pll+AF8-clock.c
+AD4- new file mode 100644
+AD4- index 0000000..3ba4e2f
+AD4- --- /dev/null
+AD4- +-+-+- b/drivers/clk/axs10x/i2s+AF8-pll+AF8-clock.c
+AD4- +AEAAQA- -0,0 +-1,217 +AEAAQA-
+AD4- +-/+ACo-
+AD4- +- +ACo- Synopsys AXS10X SDP I2S PLL clock driver
+AD4- +- +ACo-
+AD4- +- +ACo- Copyright (C) 2016 Synopsys
+AD4- +- +ACo-
+AD4- +- +ACo- This file is licensed under the terms of the GNU General Public
+AD4- +- +ACo- License version 2. This program is licensed +ACI-as is+ACI- without any
+AD4- +- +ACo- warranty of any kind, whether express or implied.
+AD4- +- +ACo-/
+AD4- +-
+AD4- +-+ACM-include +ADw-linux/platform+AF8-device.h+AD4-
+AD4- +-+ACM-include +ADw-linux/module.h+AD4-
+AD4- +-+ACM-include +ADw-linux/clk-provider.h+AD4-
+AD4- +-+ACM-include +ADw-linux/err.h+AD4-
+AD4- +-+ACM-include +ADw-linux/device.h+AD4-

+ACI-linux/platform+AF8-device.h+ACI- includes +ACI-linux/device.h+ACI- so you may make this list of headers
a little bit shorter.

+AD4- +-+ACM-include +ADw-linux/of+AF8-address.h+AD4-
+AD4- +-+ACM-include +ADw-linux/slab.h+AD4-
+AD4- +-+ACM-include +ADw-linux/of.h+AD4-

+ACI-linux/of+AF8-address.h+ACI- already includes +ACI-linux/of.h+ACI-.

+AFs-snip+AF0-

+AD4- +-
+AD4- +-static const struct of+AF8-device+AF8-id i2s+AF8-pll+AF8-clk+AF8-id+AFsAXQ- +AD0- +AHs-
+AD4- +-	+AHs- .compatible +AD0- +ACI-snps,i2s-pll-clock+ACI-, +AH0-,

I would think that it makes sense to add the board name in
this compatible string. So something like+AKAAIg-snps,axs10x-i2s-pll-clock+ACI-
IMHO looks much more informative.

Also adding Rob Herring and DT mailing list in Cc.
Please make sure Rod acks your bindings and corresponding docs.

-Alexey--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
