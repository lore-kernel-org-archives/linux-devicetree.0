From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH] Documentation: devicetree: add description for
 generic bus properties
Date: Fri, 29 Nov 2013 11:43:15 +0100
Message-ID: <20131129104313.GG22771@ulmo.nvidia.com>
References: <20131127172806.GC2291@e103592.cambridge.arm.com>
 <20131128203322.GB14689@mithrandir>
 <20131128211009.GA26447@obsidianresearch.com>
 <20131128222232.GF14689@mithrandir>
 <20131128233147.GA19387@obsidianresearch.com>
 <20131129023554.GA14239@kroah.com>
 <20131129093713.GC22771@ulmo.nvidia.com>
 <20131129095703.GV16735@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ahP6B03r4gLOj5uD"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131129095703.GV16735-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--ahP6B03r4gLOj5uD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 29, 2013 at 09:57:03AM +0000, Russell King - ARM Linux wrote:
> On Fri, Nov 29, 2013 at 10:37:14AM +0100, Thierry Reding wrote:
> > There's a large gap between how fast new SoCs are supposed to tape out
> > and the rate at which new code can be merged upstream. Perhaps some of
> > that could be mitigated by putting more of the complexity into firmware
> > and that's already happening to some degree for ARMv8. But I suspect
> > there's a limit to what you can hide away in firmware while at the same
> > time giving the kernel enough information to do the right thing.
>=20
> One of the bigger issues which stands in the way of companies caring
> about mainstream support is closed source IPs like VPUs and GPUs.
>=20
> If you have one of those on your chip, even if the kernel side code
> is already under the GPL, normally that code is not "mainline worthy".
> Also, as the userspace code may not be open source, some people object
> to having the open source part in the kernel.
>=20
> So for customers to be able to get the performance out of the chip,
> they have to stick with having non-mainline kernel.
>=20
> At that point, why bother spending too much time getting mainline
> support for the device.  It's never going to be fully functional in
> mainline.  It doesn't make sense for these SoC companies.

Well, there are advantages to having large parts, even if not all, of an
SoC supported in the mainline kernel. The closer you are to mainline,
the easier it becomes for customers and users to use a mainline kernel.

The better an SoC is supported upstream the fewer vendor-specific
patches are required to get feature parity, which in turn makes it
easier for customers to forward-port (and back-port for that matter)
those patches to whatever kernel they want. It also allows vendors to
concentrate on the more contentious patches and spend time on making
them worthy of mainline.

Customers aren't only end-users but also embedded partners that want to
use the SoC in their products. It's no secret that many vendor trees lag
behind upstream and that causes all kinds of pain such as having to port
drivers for new hardware that's not supported in whatever vendor tree
you happen to get. Tracking upstream is invaluable because it makes it
almost trivial to support new hardware and it helps in turn with getting
your own changes merged.

So upstreaming SoC support isn't only for the benefit of SoC vendors. It
also is very convenient for all users of the SoC. It's true that ideally
an SoC would be fully functional in mainline. That's not the case today,
but that doesn't mean it will always be true.

Thierry

--ahP6B03r4gLOj5uD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSmG/BAAoJEN0jrNd/PrOhfd8QAKr4Ae9T/gpXA07etSWsYU42
0iw3an8xCOcruRz2abvm3Bo0YH5O5wRWsDFfHk74ZQlfGJqcJMp8DX38aOqe04eN
6H58X6dOQ3SasB6wXeEW0pq7d/+t7ExGpeGKdd93XhsZSp0LvGlmtDFeg8s++Nge
cUyMmeRp532uyAi1Lg6Orekd3gPSucJEF78yExcDv/IY3l9FPX06/qMy5dVEQ+WP
pBHIbcgI8WF1aY3JXc92WIsycKWfL4qdlztW7klwLrm0VpS+22lTGbtsn3YNKlVS
zG7Jvu5/c9YHfUu7M7y/UmfCnDkfYn67nw5AbDPMvLWRfi0xzEbZoSA36qkqDArX
39tE2AjSdXN7N+O8sooq+Hcog6kuS/vFORVgsCc3yzFlOOaQ1ms3V/SDSYytSVJi
n/5yv4sUlgtVIA36LwCnL4V4y6U8hlfVvK7z7nr2TddcFMf+Fuxj1rxQ0gVbvfgm
uZXHyKcDU5TWyKGNN0NxcoarFWYRg3w7919qQmsa3g7IYbK4/NWiZyENbJOSudWt
xXN6vLLLhMpH2FGV+SDJhwGaz1H4LOoqiRjV+UAPSWJVqWPwWDK5u7zd4+9d0//l
JQzoQBV16t14sLfX/tco14LpHapdeJHLHWQ1DUW0iCZqPtqYwyKVZzPDDcB2QuqG
vRPNsMzRgqHUY2nI9xPJ
=AQ/k
-----END PGP SIGNATURE-----

--ahP6B03r4gLOj5uD--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
