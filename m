From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V4] regulator: palmas: add support for external control
 of rails
Date: Thu, 5 Sep 2013 15:46:11 +0100
Message-ID: <20130905144611.GA32654@lee--X1>
References: <1377082096-22296-1-git-send-email-ldewangan@nvidia.com>
 <20130823095841.GG25263@sirena.org.uk>
 <522897FD.2030509@nvidia.com>
 <20130905143431.GI8980@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130905143431.GI8980@lee--X1>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: "sameo@linux.intel.com" <sameo@linux.intel.com>, Mark Brown <broonie@kernel.org>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "rob@landley.net" <rob@landley.net>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "gg@slimlogic.co.uk" <gg@slimlogic.co.uk>, "kishon@ti.com" <kishon@ti.com>, "j-keerthy@ti.com" <j-keerthy@ti.com>, "ian.campbell@citrix.com" <ian.campbell@citrix.com>
List-Id: devicetree@vger.kernel.org

On Thu, 05 Sep 2013, Lee Jones wrote:

> On Thu, 05 Sep 2013, Laxman Dewangan wrote:
> > On Friday 23 August 2013 03:28 PM, Mark Brown wrote:
> > >* PGP Signed by an unknown key
> > >
> > >On Wed, Aug 21, 2013 at 04:18:16PM +0530, Laxman Dewangan wrote:
> > >>Palmas rails like LDOs, SMPSs, REGENs, SYSENs can be enable and d=
isable
> > >>by register programming through I2C communication as well as it c=
an be
> > >>enable/disable with the external control input ENABLE1, ENABLE2 a=
nd NSLEEP.
> > >Acked-by: Mark Brown <broonie@linaro.org>
> > >
> >=20
> > Can you please take this in your tree as dependent patch is already
> > in your tree?
>=20
> It won't go in until v3.12 now, but I have applied the patch.

Slight change of plan, as the patch won't apply.

Can you rebase on v3.11 please?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
