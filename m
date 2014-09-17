From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC PATCH] dt:numa: adding numa node mapping for memory nodes.
Date: Wed, 17 Sep 2014 20:34:52 +0100
Message-ID: <20140917193452.GD7983@leverpostej>
References: <1410944189-3608-1-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
 <A4205FCA-D4DE-48A4-B19F-58400A3FBF5C@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <A4205FCA-D4DE-48A4-B19F-58400A3FBF5C-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Ganapatrao Kulkarni <ganapatrao.kulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 17, 2014 at 04:37:30PM +0100, Kumar Gala wrote:
>=20
> On Sep 17, 2014, at 1:56 AM, Ganapatrao Kulkarni <ganapatrao.kulkarni=
@caviumnetworks.com> wrote:
>=20
> > From: Ganapatrao Kulkarni <ganapatrao.kulkarni-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> >=20
> > This patch adds property "nid" to memory node to provide the memory=
 range to
> > numa node id mapping.
> >=20
> > Signed-off-by: Ganapatrao Kulkarni <ganapatrao.kulkarni-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> >=20
> > =E2=80=94
>=20
> Adding the PPC guys as they=E2=80=99ve been doing NUMA on IBM Power S=
ervers
> for years with OF/DT.  So we should really try and follow what they=E2=
=80=99ve
> done.

Agreed.

> > Documentation/devicetree/bindings/numa.txt | 58 +++++++++++++++++++=
+++++++++++
> > 1 file changed, 58 insertions(+)
> > create mode 100644 Documentation/devicetree/bindings/numa.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/numa.txt b/Documenta=
tion/devicetree/bindings/numa.txt
> > new file mode 100644
> > index 0000000..c4a94f2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/numa.txt
> > @@ -0,0 +1,58 @@
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > +numa id binding description
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > +1 - Introduction
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > +The device node  property "nid(numa node id)" can be added to memo=
ry

Why the quotes?

> > +device node to map the range of memory addresses as defined in pro=
perty "reg".
> > +The property "nid" maps the memory range to the numa node id, whic=
h is used to
> > +find the local and remory pages on numa aware systems.

What is a "numa node id", exactly, and how is the OS intended to use it=
?

I don't see how this can be of any use as-is.

Mark.

> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > +2 - nid property
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > +Numa node id, "nid" is required property of memory device node for=
=20
> > +numa enabled platforms.
> > +
> > +|------------------------------------------------------|
> > +|Property Type  | Usage | Value Type | Definition      |
> > +|------------------------------------------------------|
> > +|  nid          |  R    |    <u32>   | Numa Node id    |
> > +|               |       |            | for this memory |
> > +|------------------------------------------------------|
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +4 - Example memory nodes with numa node id mapping
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Example 1 (2 memory nodes, each mapped to a numa node.):
> > +
> > +	memory@00000000 {
> > +		device_type =3D "memory";
> > +		reg =3D <0x0 0x00000000 0x0 0x80000000>;
> > +		nid =3D <0x0>;
> > +	};
> > +
> > +	memory@10000000000 {
> > +		device_type =3D "memory";
> > +		reg =3D <0x100 0x00000000 0x0 0x80000000>;
> > +		nid =3D <0x1>;
> > +	};
> > +
> > +Example 2 (multiple memory ranges in each memory node and mapped t=
o numa node):
> > +
> > +	memory@00000000 {
> > +		device_type =3D "memory";
> > +		reg =3D <0x0 0x00000000 0x0 0x80000000>,
> > +		      <0x0 0x80000000 0x0 0x80000000>;
> > +		nid =3D <0x0>;
> > +	};
> > +
> > +	memory@10000000000 {
> > +		device_type =3D "memory";
> > +		reg =3D <0x100 0x00000000 0x0 0x80000000>,
> > +		      <0x100 0x80000000 0x0 0x80000000>;
> > +		nid =3D <0x1>;
> > +	};
> > --=20
> > 1.8.1.4
> >=20
>=20
> --=20
> Employee of Qualcomm Innovation Center, Inc.
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, ho=
sted by The Linux Foundation
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree"=
 in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
