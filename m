From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] pinctrl: zx: Add ZTE pinctrl dts document
Date: Tue, 6 Sep 2016 16:15:57 +0200
Message-ID: <CACRpkdZ5aHJs8EK29_y7wYZhyHAUdD99wy2RRGD-CZdoJo+NrA@mail.gmail.com>
References: <1472213965-4899-1-git-send-email-jun.nie@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472213965-4899-1-git-send-email-jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jun Nie <jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jason Liu <jason.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Please always include devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org on subsequent
postings of the bindings.

Also include Heiko St=C3=BCbner and Doug Andersson who are also
interested in hierarchical pin controllers on subsequent postings.

On Fri, Aug 26, 2016 at 2:19 PM, Jun Nie <jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> +The pins controlled by ZX pin controller are organized in banks,
> +number of pins in each bank may vary.  Each pin has different multiplexi=
ng
> +functions. There are two type of pins, normal ones and AON ones.

I understand so far. Spell out what the acronym AON means. Does
it mean "always-on?"

> + AON
> +pins control high level multiplex and normal pins may require multiplex
> +configuration of parent AON pins.

I don't understand this at all.

What is "high level multiplex"?

Since you mention parents I suspect that what you are referring to is
that the pins are hierarchical, and that they are controlled by two
levels of pin controllers, such that a physical pin is connected to pin
controller A which can multiplex pins to N functions, and then the line
from A is connected to another pin controller B that can again multiplex
to M other functions?

Please describe this hardware set-up with *lots* of detail so we have
a chance of understanding it fully. All necessary information shall go
into this DT binding document so we know where to look it up.

> + As the AON pins number is not as much as
> +normal pins, some normal pins are not routed through AON pin side and ar=
e
> +under direct control by itself.

I don't understand this. I suspect the English language may be a
problem here, I think "as much as" should be "as many as", also
subject and object is very hard to understand when the pin controller
is referred to as "itself". It's just very hard to parse, sorry. Please
elaborate and I will try to understand and help as much as I can.

> +Required properties:
> +- compatible:
> +  "zte,zx296718-pinctrl"
> +  "zte,zx296718-aonpmx"
> +
> +- reg: Should contain the register physical address and length for the
> +  pin controller.

OK

> +IO pull up/down etc configuration is supported with unified management o=
f
> +normal pins and AON pins. The configuration registers area is just after
> +AON pinmux reg area, while normal pins regs in different area. So two dt=
s
> +nodes are needed to provides the two reg regions.

Again hard to understand, but why do you need two nodes
and not just two register areas regs =3D <a b>, <c d>;?

I guess because one pin controller is using another one but
I'm not sure.

> +Below configuration are supported. Please refer to pinctrl-bindings.txt
> +in this directory for more details of the common pinctrl bindings used
> +by client devices.
> +
> +bias-pull-up            - pull up the pin
> +bias-pull-down          - pull down the pin
> +drive-strength          - sink or source at most 7 mA
> +input-enable            - enable input on pin (no effect on output)
> +power-source            - select power supplies. 1: 1.8V, 0: 3.3V
> +slew-rate               - set the slew rate

OK

> +Pin names are defined by bank sequence and pins number in the bank. For
> +example, B2 is the 3rd pin in the second bank. The AON pin has prefix
> +AON, like AONC2.

OK

> +Example dts nodes:
> +
> +pinctop: pinctrl@01462000 {
> +       compatible =3D "zte,zx296718-pinctrl";
> +       reg =3D <0x01462000 0x1000>;
> +
> +       i2c5_pins: i2c5pins {
> +               pins =3D "G6", "G7";
> +               function =3D "I2C5";
> +       }
> +};
> +
> +pmx_aon: pinctrl@00119000 {
> +       compatible =3D "zte,zx296718-aonpmx";
> +       reg =3D <0x00119000 0x1000>;
> +};

The problem with this devicetree is that it does not express the hierarchic=
al
nature that you describe above. And I have no idea how the driver
handles that relation. These look like two independent pin controller
but AFAICT they are not.

These are arrangements that make more sense:

pinctrla {
    compatible =3D "parent-device-compat";
    (...)
    pinctrlb {
        compatible =3D "child-device-compat";
        (...)
    };
};

This makes the child pin controller a proper child of the parent and
make the child probe instantiate from the parent (in
Linux of_platform_default_populate() inside the parent driver)
and thus it knows the parent is always available before the child.

Another arrangement is:

pa: pinctrla {
    compatible =3D "parent-device-compat";
    (...)
};

pb: pinctrlb {
    compatible =3D "child-device-compat";
    pinctrl-parent =3D &pinctrla;
    (...)
};

This is in case we need to have hierarchies defined this way.

I don't know the best way to define hierarchical pin controllers yet
so we definately need some discussion about it.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
