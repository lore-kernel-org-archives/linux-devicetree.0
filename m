From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH v2] rtc: pcf8563: add CLKOUT to common clock framework
Date: Fri, 16 Oct 2015 12:54:46 +0200
Message-ID: <20151016105446.GK3421@piout.net>
References: <1444982369-26046-1-git-send-email-hs@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1444982369-26046-1-git-send-email-hs@denx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Schocher <hs@denx.de>
Cc: linux-kernel@vger.kernel.org, Georg.Soffel@bosch-si.com, rtc-linux@googlegroups.com, Alessandro Zummo <a.zummo@towertech.it>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On 16/10/2015 at 09:59:29 +0200, Heiko Schocher wrote :
> Add the clkout output clk to the common clock framework.
> Disable the CLKOUT of the RTC after power-up.
> After power-up/reset of the RTC, CLKOUT is enabled by default,
> with CLKOUT enabled the RTC chip has 2-3 times higher power
> consumption.
> 
> Signed-off-by: Heiko Schocher <hs@denx.de>
> ---
> 
> Changes in v2:
> - add comments from Alexandre Belloni
>   - remove the DT property, instead
>     register for the CLKOUT a clk in the common
>     clk framework. The clk is disabled by default.
> 
>  Documentation/devicetree/bindings/rtc/pcf8563.txt |  28 ++++
>  drivers/rtc/rtc-pcf8563.c                         | 164 +++++++++++++++++++++-
>  2 files changed, 191 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/rtc/pcf8563.txt
> 
> diff --git a/Documentation/devicetree/bindings/rtc/pcf8563.txt b/Documentation/devicetree/bindings/rtc/pcf8563.txt
> new file mode 100644
> index 0000000..cdb81ef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/pcf8563.txt
> @@ -0,0 +1,28 @@
> +* Philips PCF8563/Epson RTC8564 Real Time Clock
> +
> +Philips PCF8563/Epson RTC8564 Real Time Clock
> +
> +Required properties:
> +see: Documentation/devicetree/bindings/i2c/trivial-devices.txt
> +
> +Optional property:
> +- #clock-cells: Should be 1.
> +- clocks: Reference to the clock entry.
> +- clock-output-names:
> +  overwrite the default clock name "pcf8563-clkout"
> +
> +Example:
> +
> +rtcclk: rtcclk {
> +	compatible = "fixed-clock";
> +	#clock-cells = <1>;
> +	clock-frequency = <1>;
> +	clock-output-names = "rtcclk";
> +};
> +
> +pcf8563@51 {
> +	compatible = "nxp,pcf8563";
> +	reg = <0x51>;
> +	#clock-cells = <1>;
> +	clocks = <&rtcclk 0>;
> +};

You don't seem to be using rtcclk, I would remove it from the example.

> +static struct clk *pcf8563_clkout_register_clk(struct pcf8563 *pcf8563)
> +{
> +	struct i2c_client *client = pcf8563->client;
> +	struct device_node *node = client->dev.of_node;
> +	struct clk *clk;
> +	struct clk_init_data init;
> +	int ret;
> +	unsigned char buf;
> +
> +	/* disable the clkout output */
> +	buf = 0;
> +	ret = pcf8563_write_block_data(client, PCF8563_REG_CLKO, 1, &buf);
> +	if (ret < 0)
> +		return ERR_PTR(ret);
> +

Isn't that done automatically for an unused clock? However, I would do
that in the probe as you will have to sprinkle some #ifdef
CONFIG_COMMON_CLK after seeing the kbuild report.

>  
> +	/* register clk in common clk framework */
> +	pcf8563_clkout_register_clk(pcf8563);
> +
>  	/* the pcf8563 alarm only supports a minute accuracy */
>  	pcf8563->rtc->uie_unsupported = 1;
>  

You probably need to unregister the clock at some point. Maybe using
devm_clk_register() is the best thing to do.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
