From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Cedrus driver
Date: Fri, 17 Nov 2017 09:01:27 +0100
Message-ID: <20171117080127.mtfkehxbofk56alv@flea>
References: <1510059543-7064-1-git-send-email-giulio.benetti@micronovasrl.com>
 <1b12fa21-bfe6-9ba7-ae1d-8131ac6f4668@micronovasrl.com>
 <6fcdc0d9-d0f8-785a-bb00-b1b41c684e59@imkreisrum.de>
 <693e8786-af83-9d77-0fd4-50fa1f6a135f@micronovasrl.com>
 <20171116110204.poakahqjz4sj7pmu@flea>
 <1510862395.8053.39.camel@ndufresne.ca>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="getz74tx42g6yqfo"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBWFOXLIAKGQE3WSU4HY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1510862395.8053.39.camel-dDhyB4GVkw9AFePFGvp55w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Nicolas Dufresne <nicolas-dDhyB4GVkw9AFePFGvp55w@public.gmane.org>
Cc: Giulio Benetti <giulio.benetti-W14uJ/fiAyBY2hyreNRi6g@public.gmane.org>, Andreas Baierl <list-IaPFKHZio8oZId6A0yLOdQ@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thomas-XCRq7eEM0/pmR6Xm/wNWPw@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--getz74tx42g6yqfo
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

On Thu, Nov 16, 2017 at 02:59:55PM -0500, Nicolas Dufresne wrote:
> Le jeudi 16 novembre 2017 =C3=A0 12:02 +0100, Maxime Ripard a =C3=A9crit =
:
> > Assuming that the request API is in, we'd need to:
> >   - Finish the MPEG4 support
> >   - Work on more useful codecs (H264 comes to my mind)
>=20
> For which we will have to review the tables and make sure they match
> the spec (the easy part). But as an example, that branch uses a table
> that merge Mpeg4 VOP and VOP Short Header. We need to make sure it does
> not pause problems or split it up. On top of that, ST and Rockchip
> teams should give some help and sync with these tables on their side.
> We also need to consider decoder like Tegra 2. In H264, they don't need
> frame parsing, but just the PPS/SPS data (might just be parsed in the
> driver, like CODA ?). There is other mode of operation, specially in
> H264/HEVC low latency, where the decoder will be similar, but will
> accept and process slices right away, without waiting for the full
> frame.

Sorry if it's a dumb question, but what branches and tables are you
talking about here?

> We also need some doc, to be able to tell the GStreamer and FFMPEG team
> how to detect and handle these decoder. I doubt the libv4l2 proposed
> approach will be used for these two projects since they already have
> their own parser and would like to not parse twice. As an example, we
> need to document that V4L2_PIX_FMT_MPEG2_FRAME implies using the
> Request API and specific CID. We should probably also ping the Chrome
> Devs, which probably have couple of pending branches around this.

We've had a prototype that wasn't based on libv4l but was based on the
VA-API, and it's been working great for us so far.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--getz74tx42g6yqfo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJaDpdXAAoJEBx+YmzsjxAgGUYQAJ2qKRzrbZEzq+6eodVQsi9z
DTMXwpmeslmoVNYGQZ2+rvdsy5QnceJyPEBABjRdwfOU42ukmyy/A9eowbo17+K8
mSntSNb1ySt5TFulKW7jAdNJzUDKamtP3jZ2G9n86Dz7X59CJRtUkaph8QX1r4Jh
anCaC3PQaa2S27JhjE4uudn2xLbLD/gwDh2TyrNtFyI2ZKS59780nOidAO8tBjco
J+mAb/GI45WmWghK1uYOPd8DoEss0fqRmA8wnGoMTGgufYPhIHXxw4HX/TgeXT3I
p/jPc1hQWL+Rri95BiOVmCGA5vhiE3SkDSJAEh8mQcfIMDKmLiucbpPu+y9+LhF1
+KIWkAzPSmzUZgPp4aVx3jIeDYueR3lyqix7mE19eVp0zSH+bHaK4lBz8lb/Rcs2
gnYS2pxs0WXlu03B5YSp4vk7FDUKYQFMgtj8o4FYNreR25TQX+8JBVK0GAuVTOKW
870QtgTf23N06g/XldmHusN7xWohSnG2aXbM1qQleOkUOIyYQ8s1wJqAgXYQPP7X
k3MiyhtLwBNjrJ9ljlGS+yRmMIuJzdn0imBW3Ib7Cbo/uIPPUGfRGuSSRR317yld
4KlycDNAKLBGWSH8rKX25E1KObmADJHK5zzCnMsf8WjXPLzJ3w2lS7uik8XwkaoF
iLhbKcF5OVd/5GNerKdI
=H2LR
-----END PGP SIGNATURE-----

--getz74tx42g6yqfo--
