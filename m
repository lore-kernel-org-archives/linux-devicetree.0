From: Nicolas Dufresne <nicolas-dDhyB4GVkw9AFePFGvp55w@public.gmane.org>
Subject: Re: [linux-sunxi] Cedrus driver
Date: Thu, 16 Nov 2017 14:59:55 -0500
Message-ID: <1510862395.8053.39.camel@ndufresne.ca>
References: <1510059543-7064-1-git-send-email-giulio.benetti@micronovasrl.com>
         <1b12fa21-bfe6-9ba7-ae1d-8131ac6f4668@micronovasrl.com>
         <6fcdc0d9-d0f8-785a-bb00-b1b41c684e59@imkreisrum.de>
         <693e8786-af83-9d77-0fd4-50fa1f6a135f@micronovasrl.com>
         <20171116110204.poakahqjz4sj7pmu@flea>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-pt46Lg9YAHMlu1JVn4N1"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171116110204.poakahqjz4sj7pmu@flea>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Giulio Benetti <giulio.benetti-W14uJ/fiAyBY2hyreNRi6g@public.gmane.org>
Cc: Andreas Baierl <list-IaPFKHZio8oZId6A0yLOdQ@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thomas-XCRq7eEM0/pmR6Xm/wNWPw@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--=-pt46Lg9YAHMlu1JVn4N1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 16 novembre 2017 =C3=A0 12:02 +0100, Maxime Ripard a =C3=A9crit :
> Assuming that the request API is in, we'd need to:
>   - Finish the MPEG4 support
>   - Work on more useful codecs (H264 comes to my mind)

For which we will have to review the tables and make sure they match
the spec (the easy part). But as an example, that branch uses a table
that merge Mpeg4 VOP and VOP Short Header. We need to make sure it does
not pause problems or split it up. On top of that, ST and Rockchip
teams should give some help and sync with these tables on their side.
We also need to consider decoder like Tegra 2. In H264, they don't need
frame parsing, but just the PPS/SPS data (might just be parsed in the
driver, like CODA ?). There is other mode of operation, specially in
H264/HEVC low latency, where the decoder will be similar, but will
accept and process slices right away, without waiting for the full
frame.

We also need some doc, to be able to tell the GStreamer and FFMPEG team
how to detect and handle these decoder. I doubt the libv4l2 proposed
approach will be used for these two projects since they already have
their own parser and would like to not parse twice. As an example, we
need to document that V4L2_PIX_FMT_MPEG2_FRAME implies using the
Request API and specific CID. We should probably also ping the Chrome
Devs, which probably have couple of pending branches around this.

regards,
Nicolas



--=-pt46Lg9YAHMlu1JVn4N1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCWg3uOwAKCRBxUwItrAao
HHECAJwOUnKhoJ9VFvV+vJrW0glC6f4t/wCfZP+7PkLnwxrO2BUgXXTJ3ZJdnCM=
=UWFg
-----END PGP SIGNATURE-----

--=-pt46Lg9YAHMlu1JVn4N1--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
