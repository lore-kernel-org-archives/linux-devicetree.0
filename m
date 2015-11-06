From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 4/5] regulator: tps65912: Add regulator driver for the
 TPS65912 PMIC
Date: Fri, 6 Nov 2015 21:16:51 +0000
Message-ID: <20151106211651.GJ18409@sirena.org.uk>
References: <1443731874-21362-1-git-send-email-afd@ti.com>
 <1443731874-21362-5-git-send-email-afd@ti.com>
 <20151022164724.GZ8232@sirena.org.uk>
 <563A25BE.90609@ti.com>
 <20151105101417.GM1717@sirena.org.uk>
 <563B9A10.4020907@ti.com>
 <20151106104322.GA18409@sirena.org.uk>
 <563CED25.6020405@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WdPYQQQ4lIWZ4ZWi"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <563CED25.6020405@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--WdPYQQQ4lIWZ4ZWi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 06, 2015 at 12:10:45PM -0600, Andrew F. Davis wrote:
> On 11/06/2015 04:43 AM, Mark Brown wrote:

> >No, you need to fix the bug that is causing dev->of_node to be populated
> >for the MFD function device.  Probably the issue is that you have put
> >this pointless compatible string in your DT.

> If it is pointless what is the reason we have .of_compatible in mfd_cell?

There are cases where it's useful where we're abstracting something and
gaining some meaningful reuse.  This really does not appear to be one of
those cases, there are no parameters in the DT and the compatible string
is the full device name.

> How else do you want us to populate the sub-device dev->of_node? Looking

You do not need to populate it.  There is no value in populating it and
as previously discussed putting the Linux driver model into DT can be
actively harmful if we change our idea of how we should model things.

> >Please stop this.  I don't understand why you are pushing so hard to put
> >the Linux device model representation of the device into DT but it's
> >getting very repetitive.

> I'm not pushing anything, this is how other sub-nodes of MFD devices are

Every time we go through this we finish the discussion and then you come
back with yet another excuse for trying to push the current Linux device
model into the DT or another version of the patch with the same problem.

> represented, I'm not sure what you think I'm doing that is so wrong here.

I am providing the same review feedback repeatedly, this is not good.

> No one else seems to have an issue with the DT for this device, I see no
> reason the regulator node has to be different than the other sub-device
> nodes.

I would prefer it if other areas where there's no reuse gained by
breaking things down and where we're just encoding the Linux driver
model into DT weren't done like that either.  Perhaps other people care
less here, perhaps they haven't been bitten by the problems that can
arise.  If I read such patches I'd probably comment on the issue but
I've got enough to do already without trying to review every single DT
binding.

> It looks rather out of place to have regulators be singled out like this,
> for instance look at the mfd_cells for drivers/mfd/rt5033.c

The fact that other people have merged imperfect code into the kernel is
not a good reason to merge even more of it when we have better tools.
Looking at that binding I'm seeing no reason why any of the subfunctions
should have compatible strings (and if we're going down the route you're
trying to go down we really ought to have something in the binding for
at least an interrupt controller in there as well...).

Seriously, please stop this - having to go through the same things
repeatedly is not helpful.

--WdPYQQQ4lIWZ4ZWi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWPRi/AAoJECTWi3JdVIfQJY8H/2Jq9dTp5T9q63o8vF9Jcc9z
0LJFMhgS07PYOlgwAeZ8H8XkbMHAQN9i5GK43Kj+4eyUe5/TvcpqgnPUDrPBaLxS
Z22l+phANsnaw1rGj4+wpHWH5ZLrTPHHn/coU3o5xPhAQf4hqVDLPj6DeO77j51u
yAWvJ9herqa98OLoKtTiwNcWMvLnyGjUxUfoOsvaiAvNLOUlS3ogejaDlZkjsKhK
GvN9eBuYmr1d4/f3VJazbgstpx+/t/0lT9oeX0y4nNpRXwmCfzZqzES4XdRTc/Nw
PkDil0ASnM/bERWbSPZWdot/1Cqj20x7EGuNhc0BpQpsUJvRoOtwXPF0B0IBkJg=
=nZbw
-----END PGP SIGNATURE-----

--WdPYQQQ4lIWZ4ZWi--
