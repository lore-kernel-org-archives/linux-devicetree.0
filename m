From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH v3 2/9] ARM64: dts: meson-gxbb-p200: add the ethernet
 PHY's reset GPIO
Date: Fri, 20 Jan 2017 18:07:20 +0100
Message-ID: <CAFBinCA47Nng_jjxKrWrV_YBHr0bg+7xPaJrVswt_WnZ6wtyjA@mail.gmail.com>
References: <20170120132650.9784-1-martin.blumenstingl@googlemail.com>
 <20170120152232.13943-1-martin.blumenstingl@googlemail.com>
 <20170120152232.13943-3-martin.blumenstingl@googlemail.com> <20170120162138.GE25907@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170120162138.GE25907-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Andrew,

On Fri, Jan 20, 2017 at 5:21 PM, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org> wrote:
> On Fri, Jan 20, 2017 at 04:22:25PM +0100, Martin Blumenstingl wrote:
>> This resets the ethernet PHY during boot to get the PHY into a "clean"
>> state.
>> While here also specify the phy-handle of the ethmac node to make the
>> PHY configuration similar to the one we have on GXL devices. This will
>> allow us to specify OF-properties for the PHY itself.
>>
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
>> ---
>>  arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts | 24 ++++++++++++++++++++++++
>>  1 file changed, 24 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
>> index 03e3d76626dd..fa0f84cfeaa9 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
>> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
>> @@ -51,6 +51,30 @@
>>       model = "Amlogic Meson GXBB P200 Development Board";
>>  };
>>
>> +&ethmac {
>> +     status = "okay";
>> +     pinctrl-0 = <&eth_rgmii_pins>;
>> +     pinctrl-names = "default";
>> +     phy-handle = <&eth_phy0>;
>> +     phy-mode = "rgmii";
>> +
>> +     snps,reset-gpio = <&gpio GPIOZ_14 0>;
>> +     snps,reset-delays-us = <0 10000 1000000>;
>> +     snps,reset-active-low;
>> +
>> +     mdio {
>> +             compatible = "snps,dwmac-mdio";
>> +             #address-cells = <1>;
>> +             #size-cells = <0>;
>> +
>> +             eth_phy0: ethernet-phy@0 {
>> +                     compatible = "ethernet-phy-id0022.1620",
>
> Hi Martin
>
> You don't need to specify the PHY ID. You really only need this when
> the PHY is reporting no ID, or a wrong ID. In fact, if a new revision
> of the board is made, with a different PHY, you might have a problem,
> the wrong PHY driver is loaded.
>
>    Andrew
I though that this is good practice - the documentation doesn't say
that it should only be added in specific cases: [0]
my intention behind adding the PHY ID was to make it easier to see
which devices uses which PHY. this is especially useful for devices
with RTL8211F PHY (basically all devices with RGMII PHY except the
P200) as these may need similar fixes than [1]

regarding your other mail: you're absolutely right that ethernet-phy@0
should be ethernet-phy@3.


[0] http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/net/phy.txt
[1] https://patchwork.kernel.org/patch/9528915/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
