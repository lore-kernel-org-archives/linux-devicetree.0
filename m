From: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] clk: meson: gxbb: remove the "cpu_clk" from the
 GXBB and GXL driver
Date: Mon, 15 May 2017 17:56:19 +0200
Message-ID: <1494863779.13948.2.camel@baylibre.com>
References: <20170401125519.7339-1-martin.blumenstingl@googlemail.com>
         <20170504181920.21880-1-martin.blumenstingl@googlemail.com>
         <20170504181920.21880-3-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170504181920.21880-3-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2017-05-04 at 20:19 +0200, Martin Blumenstingl wrote:
> It seems that the "cpu_clk" was carried over from the meson8b clock
> controller driver. On Meson GX (GXBB/GXL/GXM) the registers which are
> used by the cpu_clk have a different purpose (in other words: they don't
> control the CPU clock anymore). HHI_SYS_CPU_CLK_CNTL1 bits 31:24 are
> reserved according to the public S905 datasheet, while bit 23 is the
> "A53_trace_clk_DIS" gate (which according to the datasheet should only
> be used in case a silicon bug is discovered) and bits 22:20 are a
> divider (A53_trace_clk). The meson clk-cpu code however expects that
> bits 28:20 are reserved for a divider (according to the public S805
> datasheet this "SCALE_DIV: This value represents an N+1 divider of the
> input clock.").
> 
> The CPU clock on Meson GX SoCs is provided by the SCPI DVFS clock
> driver instead. Two examples from a Meson GXL S905X SoC:
> - vcpu (SCPI DVFS clock 0) rate: 1000000000 / cpu_clk rate: 708000000
> - vcpu (SCPI DVFS clock 0) rate: 1512000000 / cpu_clk rate: 708000000
> 
> Unfortunately the CLKID_CPUCLK was already exported (but is currently
> not used) to DT. Due to the removal of this clock definition there is
> now a hole in the clk_hw_onecell_data (which is not a problem because
> this case is already handled in gxbb_clkc_probe).
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>

Applied, Thanks
Jerome
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
