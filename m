From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 0/3] Add basic support for RTC on Allwinner
 H6 SoC
Date: Thu, 8 Aug 2019 13:48:55 +0800
Message-ID: <CAGb2v64y+iUknG=h6NC_16JsiBXATim4PpX6g3OVg3G0vDjBwA@mail.gmail.com>
References: <20190412120730.473-1-megous@megous.com> <CAGb2v66cbpsoHJoiFJkBwhZ5SbO+uO+Kf6gtnA3kPFQZq0329Q@mail.gmail.com>
 <20190806183045.edhm3qzpegscf2z7@core.my.home> <20190807105502.GK3600@piout.net>
Reply-To: wens-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBBVXPV3VAKGQE23XYBOI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190807105502.GK3600-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Alexandre Belloni <alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 7, 2019 at 6:55 PM Alexandre Belloni
<alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
>
> Hi,
>
> On 06/08/2019 20:30:45+0200, Ond=C5=99ej Jirman wrote:
> > Maybe whether XO or DCXO is used also matters if you want to do some fi=
ne
> > tunning of DCXO (control register has pletny of options), but that's pr=
obably
> > better done in u-boot. And there's still no need to read HOSC source fr=
om DT.
> > The driver can just check compatible, and if it is H6 and OSC_CLK_SRC_S=
EL is 1,
> > it can do it's DCXO tunning, or whatever. But neither OS nor bootloader=
 will
> > be using this info to gate/disable the osciallator.
> >
>
> It is actually useful to be able to tweak the crystal tuning at
> runtime to be able to reduce clock drift and compare with a reliable
> source (e.g. NTP).
> I'm curious, what kind of options does this RTC have?

It has options to set the current, trim cap value, band gap voltage, and al=
so
change the mode to just accept an external clock signal, instead of driving
a crystal. The settings for the former parameters are not explained though.

See page 364 of
http://linux-sunxi.org/File:Allwinner_H6_V200_User_Manual_V1.1.pdf

ChenYu

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
To view this discussion on the web, visit https://groups.google.com/d/msgid=
/linux-sunxi/CAGb2v64y%2BiUknG%3Dh6NC_16JsiBXATim4PpX6g3OVg3G0vDjBwA%40mail=
.gmail.com.
