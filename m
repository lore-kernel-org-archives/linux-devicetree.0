From: Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH linux-next (v2) 1/2] clk: Add brcm,
 bcm6345-gate-clk device tree binding
Date: Thu, 31 Dec 2015 23:16:19 -0800
Message-ID: <20160101071619.7140.40854@quark.deferred.io>
References: <5669F361.60405@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <5669F361.60405@simon.arlott.org.uk>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Simon Arlott <simon@fire.lp0.eu>, Stephen Boyd <sboyd@codeaurora.org>, Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org, linux-mips@linux-mips.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonas Gorski <jogo@openwrt.org>
List-Id: devicetree@vger.kernel.org

Hi Simon,

Quoting Simon Arlott (2015-12-10 13:49:21)
> +periph_clk: periph_clk {
> +       compatible = "brcm,bcm63168-gate-clk", "brcm,bcm6345-gate-clk";
> +       regmap = <&periph_cntl>;
> +       offset = <0x4>;
> +
> +       #clock-cells = <1>;
> +       clock-indices =
> +               <1>,          <2>,        <3>,       <4>,     <5>,
> +               <6>,          <7>,        <8>,       <9>,     <10>,
> +               <11>,         <12>,       <13>,      <14>,    <15>,
> +               <16>,         <17>,       <18>,      <19>,    <20>,
> +               <27>,         <31>;
> +       clock-output-names =
> +               "vdsl_qproc", "vdsl_afe", "vdsl",    "mips",  "wlan_ocp",
> +               "dect",       "fap0",     "fap1",    "sar",   "robosw",
> +               "pcm",        "usbd",     "usbh",    "ipsec", "spi",
> +               "hsspi",      "pcie",     "phymips", "gmac",  "nand",
> +               "tbus",       "robosw250";

Why is clock-output-names required? Because you don't have any clock
data in your driver? Or is there another reason?

FYI, I'm not a fan of clock-output-names, and prefer for the clk
consumer devices to specify the clock-names property.

Another question, is it correct that this binding requires a DT node for
every register that contains clock control bits? If so, I'm skeptical of
that approach. What if you have a clock controller IP block on a future
soc that has several registers worth of clock controls?

Regards,
Mike

> +};
> +
> +timer_clk: timer_clk {
> +       compatible = "brcm,bcm63168-gate-clk", "brcm,bcm6345-gate-clk";
> +       regmap = <&timer_cntl>;
> +       offset = <0x4>;
> +
> +       #clock-cells = <1>;
> +       clock-indices = <17>, <18>;
> +       clock-output-names = "uto_extin", "usb_ref";
> +};
> +
> +ehci0: usb@10002500 {
> +       compatible = "brcm,bcm63168-ehci", "brcm,bcm6345-ehci", "generic-ehci";
> +       reg = <0x10002500 0x100>;
> +       big-endian;
> +       interrupt-parent = <&periph_intc>;
> +       interrupts = <10>;
> +       clocks = <&periph_clk 13>, <&timer_clk 18>;
> +       phys = <&usbh>;
> +};
> -- 
> 2.1.4
> 
> -- 
> Simon Arlott
