From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V5 1/6] SLIMbus: Device management on SLIMbus
Date: Thu, 28 Apr 2016 15:38:01 +0100
Message-ID: <20160428143801.GO3217@sirena.org.uk>
References: <1461801489-16254-1-git-send-email-sdharia@codeaurora.org>
 <2692115.H6acsZmTjn@wuerfel>
 <20160428115337.GN3217@sirena.org.uk>
 <7478716.z4vdp0mVTA@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CIaS999JRh1EGVx5"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7478716.z4vdp0mVTA@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sagar Dharia <sdharia@codeaurora.org>, gregkh@linuxfoundation.org, bp@suse.de, poeschel@lemonage.de, treding@nvidia.com, gong.chen@linux.intel.com, andreas.noever@gmail.com, alan@linux.intel.com, mathieu.poirier@linaro.org, daniel@ffwll.ch, jkosina@suse.cz, sharon.dvir1@mail.huji.ac.il, joe@perches.com, davem@davemloft.net, james.hogan@imgtec.com, michael.opdenacker@free-electrons.com, daniel.thompson@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kheitke@audience.com, mlocke@codeaurora.org, agross@codeaurora.org, sheetal.tigadoli@gmail.com, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--CIaS999JRh1EGVx5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 28, 2016 at 02:33:41PM +0200, Arnd Bergmann wrote:
> On Thursday 28 April 2016 12:53:37 Mark Brown wrote:
> > On Thu, Apr 28, 2016 at 12:00:26PM +0200, Arnd Bergmann wrote:

> > > This looks like an artifact of ancient pre-DT times. I'd say kill it off before
> > > someone starts using it.

> > Not every architecture uses DT, and even on architectures with DT
> > support it isn't always the only firmware.  In this specific case it's
> > questionable how many people are going to implement Slimbus at this
> > point but in general insisting that we go DT only doesn't seem great.

> Nothing wrong with adding support for manual board files later if
> we have a good reason for it, but at the moment, this seems completely
> ARM/ARM64 specific.

It's not in theory, but in practice nobody other that Qualcomm is ever
likely to release a controller.

> I don't foresee mobile phones with ACPI using this subsystem, but even
> if we got them, it would be a horrible idea to use hardcoded board
> specific tables in a platform file, and we should insist that whatever
> firmware is present has a way to describe the slimbus devices.

Right, in this particular case I don't think it makes a huge difference
but what you were talking about was "ancient pre-DT times" rather than
something specific to this particular case.  That's definitely a thing
that people keep thinking and it's good to push back on it since we do
have non-DT cases to worry about (some architectures, other firmwares,
things like PCI cards with other components on them and so on).

--CIaS999JRh1EGVx5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXIiBIAAoJECTWi3JdVIfQeJoH/3zXqbIT+UR/hgabRS5CoAH1
hqewVtNkBcDbY9EE/6OEcbiXQbj2hU7HYqgjG/1HIH0U17DC4gURqhslB/5PNl9r
Ejq1Z7eGI/7tYKy0VxtVrojzGDQ6u8CknvxsBHDuXwCtCGV2W17I+wAEBdw00J6A
i89eBpChQmgIlqNUKVhMBNNHZj7zIBvq1ywGWSjr5xmAlA2OXqe6hHdTfgsHhmuv
1ngQ7CXwCq1j3EnrdPQ1oML5uUsBbNaB9L7A/v2qDoza0PC0wyrDbx8ej0HJVyYP
CcYvMo3nylPSsf4cguKO1IvGqjOuft4T8OPMfH/1Dnh+G0vpwd3eMTAQoVzBAn4=
=oejk
-----END PGP SIGNATURE-----

--CIaS999JRh1EGVx5--
