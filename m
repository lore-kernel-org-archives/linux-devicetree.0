From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 3/4] arm64: Juno: Add HDLCD support to the Juno boards.
Date: Wed, 5 Aug 2015 20:03:12 +0100
Message-ID: <20150805190312.GA31066@e106497-lin.cambridge.arm.com>
References: <1438784892-27888-1-git-send-email-Liviu.Dudau@arm.com>
 <1438784892-27888-4-git-send-email-Liviu.Dudau@arm.com>
 <20150805175303.GB7557@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150805175303.GB7557-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <Sudeep.Holla-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 05, 2015 at 06:53:03PM +0100, Russell King - ARM Linux wrot=
e:
> On Wed, Aug 05, 2015 at 03:28:11PM +0100, Liviu Dudau wrote:
> > +		hdmi-transmitter@71 {
> >  			compatible =3D "nxp,tda998x";
> >  			reg =3D <0x71>;
> > +			port {
> > +				tda998x_1_input: endpoint@0 {
> > +					remote-endpoint =3D <&hdlcd1_output>;
> > +				};
> > +
> > +				tda998x_1_output: endpoint@1 {
> > +					remote-endpoint =3D <&hdmi1_connector_output>;
> > +				};
> > +			};

Hi Russell,

Thanks for reviewing this, I will integrate your comments in the
next revision.

>=20
> This isn't compliant with the TDA998x binding, and is very likely to
> screw Jean's work on adding audio support.  See emails on lakml and
> Documentation/devicetree/bindings/drm/i2c/tda998x.txt (which looks
> like it needs updating to include the ports stuff.)

I have to confess that I am not entirely up to speed with the TDA19988
situation at the moment. Andrew Jackson was dealing with that and
working with Jean to get that in the upstream, but his contract has
ended and he has moved to other things. While I did get through a
(limited) set of patches that Jean has sent around, I'm a bit confused
about the latest state of play. Is there an authoritative source from
where I can grab the patches that are going to be in 4.3? Otherwise,
as far as the current patchset base (4.2-rc2) is concerned, I am
compliant with the bindings if you ignore the port subnode (see further
below). I am happy to update the patchset to match what is going into
mainline, but just reading the emails in the mailing list I'm not
exactly sure on the sequencing of things here.

>=20
> Also, the whole question of representing connectors in a DRM model is
> yet to be established.  Yes, DT should describe the hardware, but we
> don't yet know _how_ to describe physical connectors with stuff
> implemented on top of DRM yet, and we have nothing that makes use of
> this.

Please help me understand the current situation: you have added
support for components that the video drivers can use and the bindings
for that are described in Documentation/devicetree/bindings/media/video=
-interfaces.txt.
According to that document my patch should be compliant once I add the
reg=3D property. Is that something that cannot be used with tda998x dri=
ver
or is there any other reason why you think the patch is not compliant?

If you are referring to connecting an encoder with a HDMI connector, I
have tested that and it seems to work, although my situation is simple
because there are no options in my setup: one HDLCD connects to one TDA=
19988
which connects to one HDMI output.

>=20
> Also note that ePAPR requires a reg=3D property if you specify a
> unit-address (the bit after the @ sign) so the above is non-compliant
> with ePAPR as well.

Thanks, I will add the reg property.

Best regards,
Liviu

>=20
> --=20
> FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps u=
p
> according to speedtest.net.
>=20

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
