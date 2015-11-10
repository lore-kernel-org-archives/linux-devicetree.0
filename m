From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 4/5] regulator: tps65912: Add regulator driver for the
 TPS65912 PMIC
Date: Tue, 10 Nov 2015 09:57:19 +0000
Message-ID: <20151110095719.GC12392@sirena.org.uk>
References: <1443731874-21362-1-git-send-email-afd@ti.com>
 <1443731874-21362-5-git-send-email-afd@ti.com>
 <20151022164724.GZ8232@sirena.org.uk>
 <563A25BE.90609@ti.com>
 <20151105101417.GM1717@sirena.org.uk>
 <563B9A10.4020907@ti.com>
 <20151106104322.GA18409@sirena.org.uk>
 <563CED25.6020405@ti.com>
 <20151106211651.GJ18409@sirena.org.uk>
 <5640DAC0.9080008@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9Ek0hoCL9XbhcSqy"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5640DAC0.9080008@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--9Ek0hoCL9XbhcSqy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 09, 2015 at 11:41:20AM -0600, Andrew F. Davis wrote:
> On 11/06/2015 03:16 PM, Mark Brown wrote:

> >There are cases where it's useful where we're abstracting something and
> >gaining some meaningful reuse.  This really does not appear to be one of
> >those cases, there are no parameters in the DT and the compatible string
> >is the full device name.

> As before I see no reason to make that call now and limit ourselves.

To repeat *yet* *again* the point is that putting the current Linux
driver model into the DT is limiting our future selves.

> >You do not need to populate it.  There is no value in populating it and
> >as previously discussed putting the Linux driver model into DT can be
> >actively harmful if we change our idea of how we should model things.

> The dev passed to regulator_register needs to have of_node populated for
> your OF init_data helper to work. Devices with OF tables can just pass
> their own dev. Others have to use their parents' nodes, this is a
> workaround, OF devices should be probed with their of_node pre-populated.

This is not a workaroud, the only reason you think it is a workaround is
the desire to directly represent the Linux device model in the DT.

> >>>Please stop this.  I don't understand why you are pushing so hard to put
> >>>the Linux device model representation of the device into DT but it's
> >>>getting very repetitive.

> >>I'm not pushing anything, this is how other sub-nodes of MFD devices are

> >Every time we go through this we finish the discussion and then you come
> >back with yet another excuse for trying to push the current Linux device
> >model into the DT or another version of the patch with the same problem.

> I keep finding different problems, do you expect me to ignore them?

You are making minor restatements of the same thing over and over again
which ignore the main feedback.

> >The fact that other people have merged imperfect code into the kernel is
> >not a good reason to merge even more of it when we have better tools.
> >Looking at that binding I'm seeing no reason why any of the subfunctions
> >should have compatible strings (and if we're going down the route you're
> >trying to go down we really ought to have something in the binding for
> >at least an interrupt controller in there as well...).

> These are not "subfunctions" they are full drivers, they only need
> register accessors passed in, they do not call the core and the core
> does not call them.

To repeat *yet* *again* they are groupings of functionality which happen
to represent the way Linux models devices right now.  There's no
generality in there, it's just a dump of the current Linux model of the
functions into the DT.

> If your problem is with the DT binding for this or other MFDs, then
> nack *them* and explain to everyone why what they are doing is wrong
> and why regulators should be special cases. Blocking the regulator
> drivers to force a change in DT is not going to fix this issue.

Of course this is a negative review of the binding!  What on earth did
you think my feedback meant?  The driver and the binding go together.

--9Ek0hoCL9XbhcSqy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWQb9+AAoJECTWi3JdVIfQ1v4H/2qi8rVXqU7lB6FVDHDWJEYj
z5JCCuqx0G8pLRGSRiP/65EY4hO8May5Za8wU4krAV83JU1siY368ogi2s1i2wmR
HA4eLITYrw/BuMwwQQh5AsOolg5dqNrwNurqVoacsDw8zY+iaHxycvO+xqqJTrTo
cwg4c7H9a/3G7kfQ+f97s1hJYLHxzbAmkG4imkDNxzm88kVGJzzzpTpinAFbTMvi
1ZDl8wjkoPCxhDUHLsxFZDc/3ZiZZXU++4ifAFbJPy6q4o+l9KfG84yck2j4/qKZ
28QX+MO4wvm4WFdCa2SxJutcE0bsqQUxwYPAa0orKHCNn8puMY1VX0vllGPxZEo=
=cWgk
-----END PGP SIGNATURE-----

--9Ek0hoCL9XbhcSqy--
