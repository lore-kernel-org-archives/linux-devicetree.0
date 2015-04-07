From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/5] MFD/OF: document MFD devices and handle simple-mfd
Date: Tue, 7 Apr 2015 08:16:18 +0100
Message-ID: <20150407071618.GE3461@x1>
References: <1425375148-4369-1-git-send-email-linus.walleij@linaro.org>
 <1425375148-4369-2-git-send-email-linus.walleij@linaro.org>
 <CAOesGMhz6WPweQFXfPhTO6Pz5L4Z1Si6YGiCRCiFD9B5qB9tVw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMhz6WPweQFXfPhTO6Pz5L4Z1Si6YGiCRCiFD9B5qB9tVw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 03 Apr 2015, Olof Johansson wrote:

> Hi,
>=20
> I understand this is bikeshedding to some extent, but I'd also like t=
o
> avoid needless variation in binding formats:
>=20
> On Tue, Mar 3, 2015 at 1:32 AM, Linus Walleij <linus.walleij@linaro.o=
rg> wrote:
>=20
> > +
> > +foo@1000 {
> > +               compatible =3D "syscon", "simple-mfd";
> > +               reg =3D <0x010000 0x1000>;
> > +
> > +               led@08.0 {
>=20
> This doesn't seem to be a typo, you're using a period in the unit
> address. I've never seen that done before, usually commas are used
> instead.
>=20
> Was there a reason for going with period?

LEDs have always done it [1].  I guess Bryan would be the best person
to answer the 'why'.

git grep "led.*@[0-9]*[.,][0-9]*" -- Documentation/devicetree/ arch/arm=
/boot/dts/

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
