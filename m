From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v10 3/7] ARM: dts: enable hi4511 with device tree
Date: Tue, 15 Oct 2013 20:18:10 +0200
Message-ID: <201310152018.10908.arnd@arndb.de>
References: <1381828577-27998-1-git-send-email-haojian.zhuang@linaro.org> <1381828577-27998-4-git-send-email-haojian.zhuang@linaro.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381828577-27998-4-git-send-email-haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, shaojie.sun-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 15 October 2013, Haojian Zhuang wrote:
> Enable Hisilicon Hi4511 development platform with device tree support.
> 
> Signed-off-by: Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Based on my other mail, some more comments here:

> +/ {
> +	clocks {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;

Since all clocks are in the fc802000 page, I would prefer using a non-empty
ranges to map the clocks into their own address space, like

		ranges = <0 0xfc802000 0x1000>;


> +		timer4_mux: timer4_mux@fc802018 {
> +			compatible = "hisilicon,clk-mux";
> +			#clock-cells = <0>;
> +			clocks = <&osc32k &timerclk45>;
> +			clock-output-names = "timer4_mux";
> +			reg = <0xfc802018 0x4>;
> +			clkmux-mask = <0x3>;
> +			clkmux-table = <0 0x1>;
> +		};

which would turn this into 

		timer4_mux: timer4_mux@18 {
			...
			reg = <0x18 0x4>;
			...
		};

The code would not be impacted by this.

On a related note, I find it strange that you have multiple devices with the
same register. Normally, we try to have device node names be generic,
e.g. 'clock@18' rather than 'timer4_mux@18', but that won't work if the
register is the same for all of them. Maybe some DT expert can comment
on this.

> +
> +	amba {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "arm,amba-bus";
> +		interrupt-parent = <&gic>;
> +		ranges;
> +
> +		L2: l2-cache {
> +			compatible = "arm,pl310-cache";
> +			reg = <0xfc10000 0x100000>;
> +			interrupts = <0 15 4>;
> +			cache-unified;
> +			cache-level = <2>;
> +		};

For this node, we could use the same trick with the non-empty ranges, since
all amba devices seem to be in the 0xfc000000 range.

If you do that, it probably makes sense to move the clock controller under here
as well.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
