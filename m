From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [Patch v7 2/7] clock: keystone-pllctrl: add bindings for keystone pll
 controller
Date: Fri, 23 May 2014 11:32:18 -0700
Message-ID: <20140523183218.23136.51518@quantum>
References: <1400859812-5761-1-git-send-email-ivan.khoronzhuk@ti.com>
 <1400859812-5761-3-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1400859812-5761-3-git-send-email-ivan.khoronzhuk@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: dbaryshkov@gmail.com, dwmw2@infradead.org, lee.jones@linaro.org, santosh.shilimkar@ti.com, arnd@arndb.de, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, grant.likely@linaro.org
Cc: rdunlap@infradead.org, linux@arm.linux.org.uk, grygorii.strashko@ti.com, olof@lixom.net, w-kwok2@ti.com, sboyd@codeaurora.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, m-karicheri2@ti.com, sergei.shtylyov@cogentembedded.com, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
List-Id: devicetree@vger.kernel.org

Quoting Ivan Khoronzhuk (2014-05-23 08:43:27)
> The main pll controller used to drive theC66x CorePacs, the switch fabric,
> and a majority of the peripheral clocks (all but the ARM CorePacs, DDR3 and
> the NETCP modules) requires a PLL Controller to manage the various clock
> divisions, gating, and synchronization.
> 
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>

Acked-by: Mike Turquette <mturquette@linaro.org>

Regards,
Mike

> ---
>  .../bindings/clock/ti-keystone-pllctrl.txt           | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/ti-keystone-pllctrl.txt
> 
> diff --git a/Documentation/devicetree/bindings/clock/ti-keystone-pllctrl.txt b/Documentation/devicetree/bindings/clock/ti-keystone-pllctrl.txt
> new file mode 100644
> index 0000000..3e6a81e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ti-keystone-pllctrl.txt
> @@ -0,0 +1,20 @@
> +* Device tree bindings for Texas Instruments keystone pll controller
> +
> +The main pll controller used to drive theC66x CorePacs, the switch fabric,
> +and a majority of the peripheral clocks (all but the ARM CorePacs, DDR3 and
> +the NETCP modules) requires a PLL Controller to manage the various clock
> +divisions, gating, and synchronization.
> +
> +Required properties:
> +
> +- compatible:          "ti,keystone-pllctrl", "syscon"
> +
> +- reg:                 contains offset/length value for pll controller
> +                       registers space.
> +
> +Example:
> +
> +pllctrl: pll-controller@0x02310000 {
> +       compatible = "ti,keystone-pllctrl", "syscon";
> +       reg = <0x02310000 0x200>;
> +};
> -- 
> 1.8.3.2
> 
