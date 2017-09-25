From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 2/2] dma: sprd: Add Spreadtrum DMA driver
Date: Mon, 25 Sep 2017 14:14:06 -0700
Message-ID: <20170925211406.r2zqips6vxv6fgjv@sirena.org.uk>
References: <69228f2ae8af7cff6b2a5e75503a08bd756a0d5e.1504777856.git.baolin.wang@spreadtrum.com>
 <6225db538d6f22c608da89520576669784a82e1e.1504777856.git.baolin.wang@spreadtrum.com>
 <20170925094759.GB30097@localhost>
 <CAMz4kuK-4Op0+zk4=V8h-8K+oKR+AnsyvV9mwJbP3xNUMpw9Fg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="coptyhu7paltrkym"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMz4kuK-4Op0+zk4=V8h-8K+oKR+AnsyvV9mwJbP3xNUMpw9Fg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Vinod Koul <vinod.koul@intel.com>, Baolin Wang <baolin.wang@spreadtrum.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--coptyhu7paltrkym
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 26, 2017 at 04:02:52AM +0800, Baolin Wang wrote:
> On 25 September 2017 at 17:47, Vinod Koul <vinod.koul@intel.com> wrote:
> > On Thu, Sep 07, 2017 at 06:00:04PM +0800, Baolin Wang wrote:
> >
> >> +static void sprd_dma_chn_update(struct sprd_dma_chn *schan, u32 reg,
> >> +                             u32 mask, u32 val)

> > right justfied pls

> I have made these to right justified, but I do not know why it looks
> like in this email. I checked the patch in patchwork[1], it already
> right justified. But I will check again to make sure they are right
> justified.

This happens as a result of indenting with tabs - when things get quoted
or the characters get added at the start of the line you can get an
extra couple of characters on the line with no blank space but that's
less than a tab so the lines indented by tabs suddenly aren't lined up.
It'll be fine once the patch is applied.

--coptyhu7paltrkym
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlnJcZ4ACgkQJNaLcl1U
h9AyXQf8DSLe0rK/TdGz6H0nymwxDRfyQxLNU/6n8BZ4R42Gw5KQGqNsDwueIoqc
VPKF9tKb9tDuHCfjoAydWGb7OKhljzTBWiRD0i8ZruuzPaZsoVrWytjzIIBeBITD
THquGmEHMZCe4yLRwSHEzRjQb0Hh7ZzdJ2UCV31hzCVYzEYHFgB6X2fABUG2MMT6
hiwNZXPKlSeJVBwZqbU/aff+upf/PeQ0qhjRLmPhO3pAwzSJaqqtYZXwKPfTGTQ+
RO9jyYRMLyLdnscg2nyf8xwcUdKBkOF2NA30yqetrKMppFUu9TTCuFib2c9LxlWP
F7e6mPjDvzE0Ney08n2wyJUdPPReeQ==
=b1h7
-----END PGP SIGNATURE-----

--coptyhu7paltrkym--
