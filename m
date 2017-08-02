From: Luis Araneda <luaraneda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun8i: h3: Enable EMAC with external PHY on
 NanoPi M1 Plus
Date: Tue, 1 Aug 2017 22:39:41 -0400
Message-ID: <CAHbBuxon0L-TPOYpzYEVtFf4pEGsLLFxNPSGgh6t3mooWFXgDg@mail.gmail.com>
References: <20170801050115.21497-1-luaraneda@gmail.com> <CAGb2v66r1kpbzKN8uE5pb9mqzWMwTjn-N2ufZGdUU2LJ7FvbeA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGb2v66r1kpbzKN8uE5pb9mqzWMwTjn-N2ufZGdUU2LJ7FvbeA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Aug 1, 2017 at 3:55 AM, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
> On Tue, Aug 1, 2017 at 1:01 PM, Luis Araneda <luaraneda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> +&emac {
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&emac_rgmii_pins>;
>> +       phy-supply = <&reg_gmac_3v3>;
>> +       phy-handle = <&ext_rgmii_phy>;
>> +       phy-mode = "rgmii";
>> +       allwinner,leds-active-low;
>
> This property is for the internal PHY. You should not be using it
> with an external PHY.

You're right. When reading the file "dwmac-sun8i.txt" I thought EPHY meant
External PHY, but it means Ethernet PHY (integrated).
I've tested the board without the property and the LEDs are working fine.

>
>> +       status = "okay";
>> +};
>> +
>> +&mdio {
>> +       ext_rgmii_phy: ethernet-phy@1 {
>> +               compatible = "ethernet-phy-ieee802.3-c22";
>> +               reg = <0>;
>
> Value in reg should match the address part of the node name.

Ok.

I'll be sending a v2 with the suggested changes.

Cheers,

Luis Araneda.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
