From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v5 1/2] regulator: max14577: Add regulator driver for
 Maxim 14577
Date: Wed, 27 Nov 2013 16:13:23 +0000
Message-ID: <20131127161323.GS3296@lee--X1>
References: <1385559982-32039-1-git-send-email-k.kozlowski@samsung.com>
 <20131127152042.GY14725@sirena.org.uk>
 <20131127152358.GP3296@lee--X1>
 <20131127154221.GZ14725@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20131127154221.GZ14725@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

On Wed, 27 Nov 2013, Mark Brown wrote:

> On Wed, Nov 27, 2013 at 03:23:58PM +0000, Lee Jones wrote:
> > On Wed, 27 Nov 2013, Mark Brown wrote:
> > > > +	{
> > > > +		.name =3D "max14577-regulator",
> > > > +		.of_compatible =3D "maxim,max14577-regulator",
> > > > +	},
>=20
> > > Why is there a compatible for this at all, would this ever appear=
 as
> > > part of a different device?
>=20
> > For automatic assigning of it's of_node.
>=20
> > In previous incarnations of this set it was done manually for some =
reason.
>=20
> The usual thing to do is of_get_child_by_name() on the parent to get =
the
> container to search in.

What do you mean when you say 'usual thing'? Only the max8998 does
this currently. IMHO the better way to do it for MFD devices is
provide a compatible string and let the framework does the rest for
you.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
