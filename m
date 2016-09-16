From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH 4/7] phy: meson: add USB2 PHY support for Meson8b and GXBB
Date: Fri, 16 Sep 2016 13:49:59 +0530
Message-ID: <57DBAB2F.3040905@ti.com>
References: <20160904213152.25837-1-martin.blumenstingl@googlemail.com>
 <20160904213152.25837-5-martin.blumenstingl@googlemail.com>
 <m260q6jibf.fsf@baylibre.com>
 <CAFBinCA4Yvw5pbOFmJ8SqyOASADavyEPmHywSdOiUazcqe_Zmg@mail.gmail.com>
 <e3b1f611-d6f6-c98b-a53b-98e94ef5bd96@codethink.co.uk>
 <m2eg4ui0nl.fsf@baylibre.com>
 <ffdd0188-72bc-4575-f997-e8547f4c31d2@codethink.co.uk>
 <CAFBinCC4gkMrJtertYevg_hXDLJEZ0PqfKKLL5UKXo8B=SXsPw@mail.gmail.com>
 <m2sht9gkau.fsf@baylibre.com>
 <CAFBinCCDDwydB+RP0CZKoAW5Suxotn224ZFVWvt2OGW3gNJR1g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <CAFBinCCDDwydB+RP0CZKoAW5Suxotn224ZFVWvt2OGW3gNJR1g@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, mark.rutland@arm.com, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, johnyoun@synopsys.com, will.deacon@arm.com, mturquette@baylibre.com, linux-usb@vger.kernel.org, sboyd@codeaurora.org, robh+dt@kernel.org, catalin.marinas@arm.com, carlo@caione.org, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
List-Id: devicetree@vger.kernel.org

Hi,

On Friday 09 September 2016 09:44 PM, Martin Blumenstingl wrote:
> On Fri, Sep 9, 2016 at 5:33 PM, Kevin Hilman <khilman@baylibre.com> wrote:
>> However, the problem with all of the solutions proposed (runtime PM ones
>> included) is that we're forcing a board-specific design issue (2 devices
>> sharing a reset line) into a driver that should not have any
>> board-specific assumptions in it.
>>
>> For example, if this driver is used on another platform where different
>> PHYs have different reset lines, then one of them (the unlucky one who
>> is not probed first) will never get reset.  So any form of per-device
>> ref-counting is not a portable solution.
> maybe we should also consider Ben's solution: he played with the USB
> PHY on his Meson8b board. His approach was to have only one USB PHY
> driver instance which exposes two PHYs.
> The downside of this: the driver would have to know the offset of the
> PHYs (0x0 for the first PHY, 0x20 for the second), but we could handle
> the reset using runtime PM without any hacks.

I think the offset information can come from the devicetree too. The phy can be
modeled something like below.

		usb-phys@c0000000 {
			compatible = "amlogic,meson-gxbb-usb2-phy";
			reg = <0x0 0xc0000000 0x0 0x40>;
			#address-cells = <2>;
			#size-cells = <2>;
			ranges = <0x0 0x0 0x0 0xc0000000 0x0 0x40>;
			resets = <&reset 34>;

			usb0_phy: usb_phy@0 {
				#phy-cells = <0>;
				reg = <0x0 0x0 0x0 0x20>;
				clocks = <&clkc CLKID_USB &clkc CLKID_USB0>;
				clock-names = "usb_general", "usb";
				status = "disabled";
			};

			usb1_phy: usb_phy@20 {
				#phy-cells = <0>;
				reg = <0x0 0x20 0x0 0x20>;
				clocks = <&clkc CLKID_USB &clkc CLKID_USB1>;
				clock-names = "usb_general", "usb";
				status = "disabled";
			};
		};

This way the driver will be probed only once (the reset can be done during
probe). The phy driver should scan the dt node and for every sub-node it
invokes phy_create?

Thanks
Kishon
