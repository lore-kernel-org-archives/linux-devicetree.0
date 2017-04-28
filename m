From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 01/10] pinctrl: generic: Add bi-directional and output-enable
Date: Fri, 28 Apr 2017 17:53:00 +0300
Message-ID: <CAHp75VeLtOuty=iaxuCaH43rnBZDTT03iH7JyjDJBQhTD-EjzA@mail.gmail.com>
References: <1493281194-5200-1-git-send-email-jacopo+renesas@jmondi.org>
 <1493281194-5200-2-git-send-email-jacopo+renesas@jmondi.org>
 <CAHp75Vcy1OE+9htFx9k3kQhGARQPT1C0gg3SEKZd7ULu_vkUMA@mail.gmail.com>
 <CACRpkdayW0qPXDcc_JofkwtX5UHhDPxiY_8deZZ7+hPNJkjgeQ@mail.gmail.com>
 <SG2PR06MB1165E7E651BE96CD7B7738B08A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAHp75Vcp_eMWrjZRX-x3=Tt3JRXcL_wWG43MymF=oyLLP4EJwg@mail.gmail.com> <SG2PR06MB11658EC3A3A80C57E6F539AC8A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <SG2PR06MB11658EC3A3A80C57E6F539AC8A130-ESzmfEwOt/xoAsOJh7vwSm0DtJ1/0DrXvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Brandt <Chris.Brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 28, 2017 at 4:18 PM, Chris Brandt <Chris.Brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org> wr=
ote:
> On Friday, April 28, 2017, Andy Shevchenko wrote:
>> > In the RZ/A1 HW manual you can kind of see that in 54.18 Port Control
>> Logical Diagram (but that wasn't obvious to me at first).
>>
>> Please, post a link to it or copy essential parts.

> The schematic is included in the "User's manual"
> https://www.renesas.com/en-us/doc/products/tool/doc/003/r20ut2596ej_r7s72=
100evum.pdf

Not that one I would like to see...

> The RZ/A1H Hardware manual is here:
> https://www.renesas.com/en-us/document/hw-manual?hwLayerShowFlg=3Dtrue&pr=
dLayerId=3D186374&layerName=3DRZ%252FA1H&coronrService=3Ddocument-prd-searc=
h&hwDocUrl=3D%2Fen-us%2Fdoc%2Fproducts%2Fmpumcu%2Fdoc%2Frz%2Fr01uh0403ej030=
0_rz_a1h.pdf&hashKey=3D54f335753742b5add524d4725b7242e6
>
> Chapter 54 is the port/pin controller.
>
> "54.18 Port Control Logical Diagram" is the diagram I was talking about. =
Note that is says "Note: This figure shows the logic for reference, not the=
 circuit."
>
> "54.3.13 Port Bidirection Control Register (PBDCn)" is the magic register=
 needed to get some pins to work.

This is useful. Thanks.

>> I'm quite skeptical  that cheap hardware can implement something more
>> costable than simplest open-source / open-drain + bias
>
> I don't think this is an open-source / open-drain + bias issue. It's a "t=
he internal signal paths are not getting hooked up correctly" issue.

Had you read the following, esp. Note there?

* @PIN_CONFIG_INPUT_ENABLE: enable the pin's input.  Note that this does no=
t
*      affect the pin's ability to drive output.  1 enables input, 0 disabl=
es
*      input.

For me manual is clearly tells about this settings:
"This register enables or disables the input buffer while the output
buffer is enabled."

> Regardless, on this part, we needed a way to flag that some pins when put=
 in some function modes needed 'an extra register setting'. At first we tri=
ed to sneak that info in with a simple #define in the pin/pinmux DT node pr=
operties. But, Linus didn't want it there so we had to make up a new generi=
c property called "bi-directional".
>
> What is your end goal here? Get "bi-directional" changed to something els=
e?

My goal is to reduce amount of (useless) entities. See Occam's razor
for details.

Linus, for me it looks like better to revert that change, until we
will have clear picture why existing configuration parameters can't
work.

--=20
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
