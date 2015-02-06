From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: mvebu: add ethernet to the cm-a510 board
Date: Fri, 6 Feb 2015 08:58:55 +0100
Message-ID: <20150206085855.7b8d494b@armhf>
References: <E1YH5bU-0005mG-3L@bombadil.infradead.org>
	<54CB5267.5060004@gmail.com>
	<20150130113118.5523ed68@armhf>
	<54CB6440.1010002@gmail.com>
	<20150130124144.501cf81d@armhf>
	<54CB732F.7010409@gmail.com>
	<20150130133913.083d1ade@armhf>
	<54CB7E33.3080909@gmail.com>
	<54CE354F.5090106@gmail.com>
	<54D3EB26.9020909@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54D3EB26.9020909-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Gabriel Dobato <dobatog-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 05 Feb 2015 23:13:58 +0100
Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> > At this moment, I am trying to configure the framebuffer, but as Mo=
ine
> > told me,it seems there is not video driver support for this board i=
n
> > DT... :( . =20
>=20
> Not quite true. Video is made up of at least 4 different devices:
> Framebuffer, GPU, Decode engine, and usually DVI/HDMI transmitter or
> VGA.
>=20
> We do have a driver for the framebuffer (armada_drm) and there is gre=
at
> work from Russell King and others on the GPU and Decode engine (IIRC)=
=2E

Yes, but it has no DT support. Mine has.

> If you are using the sb-a510, I can see from the manual, that DVI
> transmitter is SIL164.. AFAIS there is a driver for it, that maybe
> needs some polishing. Nobody ever tested VGA, but it shouldn't be too
> hard to add support for it as it is directly supported by the
> framebuffer HW.

This asks for some VGA encoder/connector module.

Actually, as Gabriel told me that his screen is directly connected to
the RGB LCD output, I wrote a simple panel for him. This module just
gets the display timings from the DT.

> One quite important driver at least for Dove is a clock source for
> video. Internal clock generators for video are way to limited with
> respect to frequencies to allow any useful resolution.

=46rom my previous tests with the si5351 in the Cubox, most video modes
should work without external clocks.

> I'll see if I can have a look at the dts stuff this weekend.. that
> way we'll have at least the basic done before moving to the other
> devices.

--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
