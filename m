From: Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Re: PATH[1/3] ARM: axp20x_usb_power.c add device
 tree configuration options for REG 30H: VBUS-IPSOUT
Date: Wed, 18 May 2016 09:21:03 +1000
Message-ID: <CAGRGNgX7A3bx9Dam2j1ovdf4s8L9GTi3DM4zMeyu0x3b0wwCgA@mail.gmail.com>
References: <0f58d2b3-f3d3-45a3-a307-e54df26c1ab1@googlegroups.com>
 <671c7471-b63a-40cc-989f-6b20f00571ee@googlegroups.com> <35a39bdc-1304-403d-b56a-a45bb8debf5e@googlegroups.com>
Reply-To: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDQIP76OUQLBB46O524QKGQETU3E5LI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <35a39bdc-1304-403d-b56a-a45bb8debf5e-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: ene.alexandru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Dmitry Baryshkov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Mailing List, Arm" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Ene,

On Wed, May 18, 2016 at 3:50 AM, Ene Alexandru <ene.alexandru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> the documentation is updated to describe how to convert actual values to the
> provided parameters
>
> ---
> diff -uprN -X linux-sunxi-original/Documentation/dontdiff
> linux-sunxi-original/Documentation/devicetree/bindings/power_supply/axp20x_usb_power.txt
> linux-sunxi/Documentation/devicetree/bindings/power_supply/axp20x_usb_power.txt
> ---
> linux-sunxi-original/Documentation/devicetree/bindings/power_supply/axp20x_usb_power.txt
> 2016-05-09 16:48:46.000000000 +0200
> +++
> linux-sunxi/Documentation/devicetree/bindings/power_supply/axp20x_usb_power.txt
> 2016-05-11 13:05:58.995873267 +0200
> @@ -5,6 +5,26 @@ Required Properties:
>  This node is a subnode of the axp20x PMIC.
> +The following 3 parameters are configurable from the device-tree:
> +          - vhold-enable
> +                      - bit 6 of register REG 30H: VBUS-IPSOUT Power Path
> Management

I don't think it's necessary to go into this much detail here.

> +                      - available values are:
> +                                  - 0x00 : VBUS VHOLD voltage limiting
> control disabled
> +                                  - 0x01 : VBUS VHOLD voltage limiting
> control enabled

If these are the only options available, why not make this property a boolean?

> +          - vhold-set
> +                      - bits <5-3> of register REG 30H: VBUS-IPSOUT Power
> Path Management
> +                      - available values are from 0x00 to 0x07
> +                      - VHOLD = [4000000 + ( vhold-set & 0x07 ) * 100000]
> in uV

What does this actually do? Is this the lower limit on the voltage? Is
this the voltage it'll try to maintain?

> +          - ibus-limit
> +                      - bits <1-0> of register REG 30H: VBUS-IPSOUT Power
> Path Management
> +                      - available values are :
> +                                  - 0x00 : 900000uA
> +                                  - 0x01 : 500000uA
> +                                  - 0x02 : 100000uA
> +                                  - 0x03 : unlimited

Again, what does this actually do? It looks like the current limit?

> +
> +

Extra blank line.

> Example:
>  axp209: pmic@34 {
> @@ -30,5 +50,8 @@ axp209: pmic@34 {
>             usb-power-supply: usb-power-supply {
>                        compatible = "x-powers,axp202-usb-power-supply";
> +                      vhold-enable = <0x01>;
> +                      vhold-set = <0x04>;
> +                      ibus-limit = <0x01>;
>            };
> };

Thanks,

-- 
Julian Calaby

Email: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Profile: http://www.google.com/profiles/julian.calaby/
