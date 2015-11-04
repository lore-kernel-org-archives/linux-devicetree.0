From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/8] dt-bindings: consolidate display related bindings
Date: Wed, 4 Nov 2015 15:47:24 +0100
Message-ID: <20151104144724.GA2553@ulmo>
References: <1443737554-10352-1-git-send-email-robh@kernel.org>
 <1443737554-10352-2-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1443737554-10352-2-git-send-email-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 01, 2015 at 05:12:27PM -0500, Rob Herring wrote:
> This is a quite large renaming to consolidate display related bindings
> into a single "display" directory from various scattered locations of
> video, drm, gpu, fb, mipi, and panel. The prior location was somewhat
> based on the Linux driver location, but bindings should be independent
> of that.

Sorry for being so late to comment on this. I hadn't seen the patches
before and noticed only because various bindings that I chanced to look
at had moved in linux-next.

> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
[...]
> diff --git a/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
> rename to Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt

That's not quite correct in my opinion. host1x is a top-level module
that is the parent for a number of hardware blocks, only some of which
are display-related. host1x itself has nothing to do with display at
all, except perhaps for providing syncpoints for VBLANK counters. It's
not a GPU either, though the GPU hardware blocks are children (at least
on generations before Tegra124). Other children include hardware blocks
that do video encoding and decoding, so aren't really related to display
either.

I suppose Documentation/devicetree/bindings/bus might be a more adequate
location for the host1x bindings, but then we'd need to split out the
display related pieces, and possibly refer to the host1x document from
them. The gr2d and gr3d could then be kept in the gpu subdirectory.

Also the MIPI block is a calibration block that's used for both DSI and
CSI lanes, so it's used for both video display and capture. I can't
think of a good location for those.

Also I notice that this patch doesn't update the MAINTAINERS entries
pointing at these documents, so maintainers will now no longer get Cc'ed
on patches that modify the bindings. Do you plan on fixing that up your-
self or do you expect maintainers to send patches, possibly after
further cleanup of the bindings?

Thierry

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWOhp5AAoJEN0jrNd/PrOha2AQAIfg79VTUVXuX1fE0m+NCbMN
1lRmem1s2S6TPJbKF2+eRoHldMSBZZuTSMSXcts2j1+Fl1b+5t4KeusHxqhQD0mm
1kiy7Dxrcqmdpxmc/QVvYkxUtiNiq4VdnmG3h/DIa71MDi/7aEF89Y3CUPEIFpZj
55Rg5U2CZBVrGuZqa0866g7iOU393OD0rOgZK1oF6LwDmx0kw5iCUmJLwLSJvRND
KXP7y5wDcGa0RGdlfZLeiK1ZfFNOx9A9rJdHlv8j2XzGkOFUps5IqVTipIElDQ+A
PmSRWaQdrqn4lTDhpSxEnaQg/RorLuc0J8ugfHmTUBJv7sHYBU9t8OQ2DlfouTPl
k4NJhGlg4moop52RMKjI9P/7jYFWLWhHrRNaJeqNZ1KjwWuLmnNQguWQSwwtxkg/
PRjQNuGrnwaWjClcmRzustLjXo9N/dXyCnSaIWkEudybNk1zz4vjneFzifSLZV0W
lUsRZnuAUbg3GVFuuelURNQ69kBBdDia/raS3Ev4VwehyEb5mSDDqNaP42swy2+5
f0R24LtI+z6gqqZfRZ+Y2sUF99UJXk7COehdrtfGmj1x6SBQMmNOnZmVXgHi/Mwe
kCVLu10Q247VFiB8sNsMZqJmkLH5dFqeiur0HdWi0Y98qKNWtZcUN+LyK4X4MFt3
tfRWD0WPvVB2Bucrf5Hk
=p4yI
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
