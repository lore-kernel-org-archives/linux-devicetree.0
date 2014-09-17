From: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [RFC PATCH] dt:numa: adding numa node mapping for memory nodes.
Date: Wed, 17 Sep 2014 08:37:30 -0700
Message-ID: <A4205FCA-D4DE-48A4-B19F-58400A3FBF5C@codeaurora.org>
References: <1410944189-3608-1-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410944189-3608-1-git-send-email-ganapatrao.kulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ganapatrao Kulkarni <ganapatrao.kulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Sep 17, 2014, at 1:56 AM, Ganapatrao Kulkarni <ganapatrao.kulkarni@c=
aviumnetworks.com> wrote:

> From: Ganapatrao Kulkarni <ganapatrao.kulkarni-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>=20
> This patch adds property "nid" to memory node to provide the memory r=
ange to
> numa node id mapping.
>=20
> Signed-off-by: Ganapatrao Kulkarni <ganapatrao.kulkarni-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>=20
> =97

Adding the PPC guys as they=92ve been doing NUMA on IBM Power Servers f=
or years with OF/DT.  So we should really try and follow what they=92ve=
 done.

> Documentation/devicetree/bindings/numa.txt | 58 +++++++++++++++++++++=
+++++++++
> 1 file changed, 58 insertions(+)
> create mode 100644 Documentation/devicetree/bindings/numa.txt
>=20
> diff --git a/Documentation/devicetree/bindings/numa.txt b/Documentati=
on/devicetree/bindings/numa.txt
> new file mode 100644
> index 0000000..c4a94f2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/numa.txt
> @@ -0,0 +1,58 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> +numa id binding description
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> +1 - Introduction
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> +The device node  property "nid(numa node id)" can be added to memory
> +device node to map the range of memory addresses as defined in prope=
rty "reg".
> +The property "nid" maps the memory range to the numa node id, which =
is used to
> +find the local and remory pages on numa aware systems.
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> +2 - nid property
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> +Numa node id, "nid" is required property of memory device node for=20
> +numa enabled platforms.
> +
> +|------------------------------------------------------|
> +|Property Type  | Usage | Value Type | Definition      |
> +|------------------------------------------------------|
> +|  nid          |  R    |    <u32>   | Numa Node id    |
> +|               |       |            | for this memory |
> +|------------------------------------------------------|
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +4 - Example memory nodes with numa node id mapping
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Example 1 (2 memory nodes, each mapped to a numa node.):
> +
> +	memory@00000000 {
> +		device_type =3D "memory";
> +		reg =3D <0x0 0x00000000 0x0 0x80000000>;
> +		nid =3D <0x0>;
> +	};
> +
> +	memory@10000000000 {
> +		device_type =3D "memory";
> +		reg =3D <0x100 0x00000000 0x0 0x80000000>;
> +		nid =3D <0x1>;
> +	};
> +
> +Example 2 (multiple memory ranges in each memory node and mapped to =
numa node):
> +
> +	memory@00000000 {
> +		device_type =3D "memory";
> +		reg =3D <0x0 0x00000000 0x0 0x80000000>,
> +		      <0x0 0x80000000 0x0 0x80000000>;
> +		nid =3D <0x0>;
> +	};
> +
> +	memory@10000000000 {
> +		device_type =3D "memory";
> +		reg =3D <0x100 0x00000000 0x0 0x80000000>,
> +		      <0x100 0x80000000 0x0 0x80000000>;
> +		nid =3D <0x1>;
> +	};
> --=20
> 1.8.1.4
>=20

--=20
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, host=
ed by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
