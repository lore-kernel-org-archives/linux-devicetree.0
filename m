From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: Re: [PATCH v5 20/44] dt-bindings: clock: Add bindings for TI DA8XX
 USB PHY clocks
Date: Thu, 18 Jan 2018 13:00:22 -0600
Message-ID: <1acdc3cf-f08b-3476-e656-5dc25103e86d@lechnology.com>
References: <1515377863-20358-1-git-send-email-david@lechnology.com>
 <1515377863-20358-21-git-send-email-david@lechnology.com>
 <33f0feba-adee-e365-54d5-16fe3d49302d@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <33f0feba-adee-e365-54d5-16fe3d49302d-l0cyMroinI0@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Adam Ford <aford173-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/18/2018 06:10 AM, Sekhar Nori wrote:
> On Monday 08 January 2018 07:47 AM, David Lechner wrote:
>> This adds a new binding for TI DA8XX USB PHY clocks. These clocks are part
>> of a syscon register called CFGCHIP3.
> 
> CFGCHIP2
> 
>>
>> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
> 
>> +Examples:
>> +
>> +	cfgchip: syscon@1417c {
>> +		compatible = "ti,da830-cfgchip", "syscon", "simple-mfd";
>> +		reg = <0x1417c 0x14>;
>> +
>> +		usb0_phy_clk: usb0-phy-clock {
>> +			compatible = "ti,da830-usb0-phy-clock";
>> +			#clock-cells = <0>;
>> +			clocks = <&usb_refclkin>, <&pll0_aux_clk>, <&psc1 1>;
>> +			clock-names = "usb_refclkin", "auxclk", "usb0_lpsc";
>> +			clock-output-names = "usb0_phy_clk";
> 
> Probably call this "usb0_phy" to match with the input name used for
> usb1_phy_clk?

I was planning on just dropping clock-output-names altogether actually
since they don't really do anything useful.

Also, I was considering sending a series to change the con_id for the
PHY clocks.

My current revision of the device tree bindings is looking like this:

	usb_phy: usb-phy {
		compatible = "ti,da830-usb-phy";
		#phy-cells = <1>;
		clocks = <&usb_phy_clk 0>, <&usb_phy_clk 1>;
		clock-names = "usb20_phy", "usb11_phy";
		status = "disabled";
	};
	usb_phy_clk: usb-phy-clocks {
		compatible = "ti,da830-usb-phy-clocks";
		#clock-cells = <1>;
		clocks = <&psc1 1>, <&usb_refclkin>, <&pll0_auxclk>;
		clock-names = "fck", "usb_refclkin", "auxclk";
	};

The clock-names = "usb20_phy", "usb11_phy" comes from the existing con_ids
in the PHY driver's clk_get()s.

However, in device tree, we are usually referring to the USB devices as
usb0 and usb1 instead of usb20 and usb11, respectively. Figure 6-2 "USB
Clocking Diagram" in spruh82c.pdf (AM1808 TRM) calls these clocks "CLK48"
and "CLK48MHz from USB 2.0 PHY", so I was thinking of changing the con_ids
(and therefore also clock-names) to "usb0_clk48" and "usb1_clk48".


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
