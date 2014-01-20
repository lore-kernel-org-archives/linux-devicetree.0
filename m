From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v3 16/24] drm/i2c: tda998x: add DT documentation
Date: Mon, 20 Jan 2014 10:54:10 +0100
Message-ID: <20140120105410.15705f32@armhf>
References: <cover.1390153344.git.moinejf@free.fr>
	<20140119195844.0c975b90@armhf>
	<CAOesGMi96wkHM8jfHNVnM7RJyW2vVoP6FT4YyYzKp-kfc0jTuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMi96wkHM8jfHNVnM7RJyW2vVoP6FT4YyYzKp-kfc0jTuQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, 19 Jan 2014 20:06:09 -0800
Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:

> Hi,
>=20
> On Sun, Jan 19, 2014 at 10:58 AM, Jean-Francois Moine <moinejf@free.f=
r> wrote:
> > Signed-off-by: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
> > ---
> >  .../devicetree/bindings/drm/i2c/tda998x.txt        | 24 ++++++++++=
++++++++++++
> >  1 file changed, 24 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/drm/i2c/tda99=
8x.txt
>=20
> Please cc bindings for review to devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (cc:d her=
e now)
>=20
> > diff --git a/Documentation/devicetree/bindings/drm/i2c/tda998x.txt =
b/Documentation/devicetree/bindings/drm/i2c/tda998x.txt
> > new file mode 100644
> > index 0000000..72da71d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/drm/i2c/tda998x.txt
> > @@ -0,0 +1,24 @@
> > +Device-Tree bindings for the NXP TDA998x HDMI transmitter
> > +
> > +Required properties;
> > +  - compatible: must be "nxp,tda998x"
> > +
> > +Optional properties:
> > +  - interrupts: interrupt number for HDMI exchanges - default: by =
polling
>=20
> What are HDMI exchanges, and how do they differ from other interrupts=
?

The used HDMI interrupt events are screen plug/unplug and EDID read.
There are also CEC read/write which are not yet implemented in the
tda998x driver.

There is no difference from normal interrupts, except that the events
may be get by polling, so, the interrupt number is optional.

> > +
> > +  - pinctrl-0: pin control group to be used for this controller (I=
RQ).
> > +
> > +  - pinctrl-names: must contain a "default" entry.
> > +
> > +  - video-ports: 24 bits value - default: <0x230145>
>=20
> What is this?

The video-ports value defines how the video controller is connected to
the tda998x chip. Each 4 bits value tells from which input pins comes
the video data and if there is any bit inversion. Each byte of this
video-ports is used to load the VIP_CNTRL_{0,1,2} registers. These ones
are described in the TDA9983B documentation which is the closer
available document about the TDA998x family.

The default value is the one defined for TI boards.
A known other value is <0x234501> which is used for Russell's Armada
DRM driver in the Cubox (Marvell A510), but this driver has no DT
support.

--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
