From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mfd: core: introduce of_node_name for mfd sub devices
Date: Tue, 24 Sep 2013 14:55:22 +0100
Message-ID: <20130924135522.GA16407@lee--X1>
References: <1379579392-1794-1-git-send-email-ldewangan@nvidia.com>
 <20130919083050.GH16984@lee--X1>
 <20130919115501.GM21013@sirena.org.uk>
 <20130919120051.GG22389@lee--X1>
 <523AEE07.9090405@nvidia.com>
 <20130919122240.GI22389@lee--X1>
 <5240A88D.8030309@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5240A88D.8030309@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Mark Brown <broonie@kernel.org>, "sameo@linux.intel.com" <sameo@linux.intel.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "rob@landley.net" <rob@landley.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> >> And regulator driver should get the regulator node by their
> >> pdev->dev.of_node.
> >> Currently, in most of driver, we are having the code on regulator
> >> driver to get "regulators" node from parent node which I want to
> >> avoid.
> >=20
> > Ah, I see. Yes, I believe the regulators should have their own node=
,
>=20
> The use of a "regulators" node to keep all the regulator configuratio=
n
> in one place seems fine...
>=20
> > complete with a compatible string.
>=20
> ... but I see not reason why that node has to have a separate compati=
ble
> property, or /has/ to have a separate driver.
>=20
> I think having a compatible value in this node would only be required=
 if
> the HW block that implements those registers is actually expected to =
be
> shared between n different chips, and hence it's likely that you'd ge=
t
> re-use out of a separate binding, driver, etc.
>=20
> It's perfectly reasonable for the regulator MFD driver to know that t=
he
> binding for the top-level PMIC node has a regulators child node, and =
go
> find it by name, and read whatever properties/nodes it needs directly
> out of it. Writing code that way in no ways implies a need for a
> compatible value.

Sounds fine.

> > To have each regulator listed
> > separately in the parent node seems a little messy. Just out of
> > interest, how many regulators are we talking about here?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
