From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: case sensitivity for devicetree node names
Date: Mon, 13 Jun 2016 07:56:30 +1000
Message-ID: <1465768590.3022.10.camel@kernel.crashing.org>
References: <575B1D84.2010703@gmail.com> <575C68A1.1020701@gmail.com>
 <1465682743.19533.18.camel@kernel.crashing.org>
	 <575DAC69.5010804@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <575DAC69.5010804-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, 2016-06-12 at 11:39 -0700, Frank Rowand wrote:
>=20
> Is there a kernel config option (or a small set of config options)
> that would identify the affected machines?=C2=A0 It would be ok if
> the option(s) also included some non-affected machines.=C2=A0 That
> way we could use the case insensitive compare for a small
> set of machines.

Why do we want this ? Are there people really wanting to rely on case
difference between nodes ? That sounds fishy...

If you really want to do that, then CONFIG_PPC_PMAC would be your
test I suppose.

Cheers,
Ben.
