From: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Devicetree Workshop Follow Up: Adding hierarchy to arch/arm/boot/dts
Date: Mon, 30 Oct 2017 09:46:26 -0700
Message-ID: <20171030164626.GA14993@tyrael.ni.corp.natinst.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DocE+STaALJfprDB"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--DocE+STaALJfprDB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

as discussed in Prague last week, here's my follow up.
A bit of background again as refresher: Some time ago I submitted a
patchset adding dts for some of upcoming boards ([1]).
Arguments brought up against merging it were that we have too many Zynq
based boards already in tree.

During the Devicetree Workshop we had a brief discussion and most people
in the room seemed to be ok with adding the boards, someone suggested
(Arnd?) to add vendor subdirectories like in arm64, i.e. something
like:

arch/arm/boot/dts/xilinx/ni/<board>

where Xilinx would be the SoC vendor and NI the integrator.

or:

arch/arm/boot/dts/xilinx/<board>
arch/arm/boot/dts/ni/<board>

where right now we have:

arch/arm/boot/dts/<board>

The conclusion was I'd follow up on the mailing list and we discuss
here.

So open questions:

1) Is anyone fundamentally opposed to having sub-directories there?

2) Does anyone see any reason why this wouldn't work, i.e. what do we
break?

3) If we do this, should we do it for all boards (I can send a patch for
that) in that case

If we decide to move forward with this, I'll add a bit to documentation,
so next time around it's clear for people what they have to do.

Thanks,

Moritz

[1] https://lkml.org/lkml/2017/9/11/459

--DocE+STaALJfprDB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEowQ4eJSlIZpNWnl2UVwKRFcJcNgFAln3V14ACgkQUVwKRFcJ
cNjJUQgAzyDgATXopRqDoOtp6WyZP48EwdEF+d1XQh+AYoZe75KEjfzyNoOk0UAr
g1v/rY6/X11uYxm+QkKZXBkGJDfaa4FCPTeAhzu/Mx5WhEYIcH30gxJxvaqK0+Mr
0Xd78U0lG3ouLqkfg7sF+O+mAGnV1Bs/GHoTu3TTjCkuzC2krhWcUOcyAYLcr0zz
bzJ7/vWe9kyEqqQ8uPEPtk8wXMN5G39A1zSLY5kBtMsOXT1OdcZ+NOwpJAgl6+QW
K3tl2R3mw8bGzgD5e0A1rcC8OlJ6mlJegfk7g/wm497ic0C53B65BZmsj7tF7YZ6
A4447Gg67Zm6UwdpT13/IskjC+hJBQ==
=Qxv7
-----END PGP SIGNATURE-----

--DocE+STaALJfprDB--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
