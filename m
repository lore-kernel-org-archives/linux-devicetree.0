From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH] clk: stm32h7: Add stm32h743 clock driver
Date: Fri, 7 Apr 2017 12:51:52 -0700
Message-ID: <20170407195152.GH7065@codeaurora.org>
References: <1489569810-24350-1-git-send-email-gabriel.fernandez@st.com>
 <20170405223233.GJ7065@codeaurora.org>
 <bd680d0a-0b2f-91fc-a940-b2fef4300ca3@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <bd680d0a-0b2f-91fc-a940-b2fef4300ca3-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andrea.merello-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, radoslaw.pietrzyk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ludovic.barre-qxv4g6HH51o@public.gmane.org, olivier.bideau-qxv4g6HH51o@public.gmane.org, amelie.delaunay-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/06, Gabriel Fernandez wrote:
> On 04/06/2017 12:32 AM, Stephen Boyd wrote:
> >On 03/15, gabriel.fernandez-qxv4g6HH51o@public.gmane.org wrote:
> >>diff --git a/Documentation/devicetree/bindings/clock/st,stm32h7-rcc.txt b/Documentation/devicetree/bindings/clock/st,stm32h7-rcc.txt
> >>new file mode 100644
> >>index 0000000..9d4b587
> >>--- /dev/null
> >>+++ b/Documentation/devicetree/bindings/clock/st,stm32h7-rcc.txt
> >>@@ -0,0 +1,152 @@
> >>+
> >>+	rcc: rcc@58024400 {
> >>+		#reset-cells = <1>;
> >>+		#clock-cells = <2>
> >>+		compatible = "st,stm32h743-rcc", "st,stm32-rcc";
> >>+		reg = <0x58024400 0x400>;
> >>+		clocks = <&clk_hse>, <&clk_lse>, <&clk_i2s_ckin>;
> >>+
> >>+		st,syscfg = <&pwrcfg>;
> >>+
> >>+		#address-cells = <1>;
> >>+		#size-cells = <0>;
> >>+
> >>+		vco1@58024430 {
> >>+			#clock-cells = <0>;
> >>+			compatible = "stm32,pll";
> >>+			reg = <0>;
> >reg is super confusing and doesn't match unit address.
> ok i fixed it in the v2
> 
> >
> >>+		};
> >Why? Shouldn't we know this from the compatible string how many
> >PLLs there are and where they're located? Export the PLLs through
> >rcc node's clock-cells?
> >
> Because i need to offer the possibility to change the PLL VCO
> frequencies at the start-up of this driver clock.
> The VCO algorithm needs a division factor, a multiplication factor
> and a fractional factor.
> Lot's of solution are possible for one frequency and it's nightmare
> to satisfy the 3 output dividers of the PLL.

Sure, but do we need to configure that on a per-board basis or a
per-SoC basis? If it's just some configuration, I wonder why we
don't put that into the driver and base it off some compatible
string that includes the SoC the device is for. 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
