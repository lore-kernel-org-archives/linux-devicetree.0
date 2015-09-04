From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: st_fdma: Firmware filename in DT?
Date: Fri, 4 Sep 2015 07:59:16 +0100
Message-ID: <20150904065916.GZ4796@x1>
References: <20150903144944.GC7093@griffinp-ThinkPad-X1-Carbon-2nd>
 <CAL_JsqKQqbAQCPR6xuR2Ke5gEdX4kQYb29-W3qNaZqjM_JBoYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKQqbAQCPR6xuR2Ke5gEdX4kQYb29-W3qNaZqjM_JBoYg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

[...]

> > If yes, is it worth having a generic binding?
>=20
> If we decide it is a good idea, then yes. It doesn't look that hard t=
o
> arrive at something common.
>=20
> Strictly speaking, the firmware name is just an agreed upon name
> between the kernel and userspace. So why tie that into DT? Would othe=
r
> OS's use it or want something different? What if we started including
> paths in the names like <soc>/<firmware file>? Now we are imposing a
> directory structure on the OS filesystem.

In Linux we have a standard place for firmwares, so the path should
not be required.  I certainly agree that DT is no place for absolute
paths or OS'isums.

[...]

> > Presumably the alternative would be to add a whole bunch of compati=
bles
> > in the driver for each SoC, where the only difference from a
> > functional point of view would be to help build the correct string =
for
> > the firmware filename. However I'm also then wondering what the bes=
t way
> > would be to find out the instance name of the IP.
>=20
> If the name/path is Linux specific, then that is probably what we sho=
uld do.
>=20
> You could perhaps make a policy that firmware files be named by
> compatible string. So rather than translating from matching compatibl=
e
> to an arbitrary file name, you enforce file name is "<vendor>,<ip
> block>.fw" or something. I know we don't have policy in the kernel,
> but we already have it with hardcoded file names and search paths.

Absolutely not.  Firmwares have no direct link to DT or platforms that
run DT specifically.  They are carried by most platforms these days.
Insisting on firmwares using a DT compatible string format is way off.

If we flip it the other way round, some subsystems derive the firmware
name from the 'node name'.  For instance, our zeroth General Purpose
Co-Processor RemoteProc driver has a corresponding node called
'st231-gp0@40000000'.  RemoteProc adds an 'rproc-' prefix and a '-fw'
suffix and et voil=C3=A0, we load file:

  lib/firmware/rproc-st231-gp0-fw

> > We could do it by parsing the node name e.g. fdma0-audio, or by add=
ing
> > a "instance" DT property to the node?
>=20
> Generally we try to avoid caring about node names. Having some index
> or numbering also comes up which we also try to avoid. Generally, if
> you care about which instance you use for something, then there is
> some property you care about and should add.

Right, the alternative is a property like the ones already used.
However, as these are becoming more prevalent I suggested
standardising the property to avoid all these vendor specific firmware
properties cluttering up the place.

  firmware =3D "firmwarename.fw";
OR
  firmware-name =3D "firmwarename.fw";

=2E.. seems appropriate.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
