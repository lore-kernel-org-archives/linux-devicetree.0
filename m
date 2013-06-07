From: "J, KEERTHY" <j-keerthy@ti.com>
Subject: RE: [PATCH v3] mfd: DT bindings for the palmas family MFD
Date: Fri, 7 Jun 2013 02:02:38 +0000
Message-ID: <DC88CAD03C0052499C1907B327FC63229EA3F3@DBDE04.ent.ti.com>
References: <1370496441-24620-1-git-send-email-j-keerthy@ti.com>
 <20130606070210.GR3370@gmail.com>,<20130606070610.GS3370@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20130606070610.GS3370@gmail.com>
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "swarren@nvidia.com" <swarren@nvidia.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "rob@landley.net" <rob@landley.net>, "sameo@linux.intel.com" <sameo@linux.intel.com>, "wim@iguana.be" <wim@iguana.be>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "gg@slimlogic.co.uk" <gg@slimlogic.co.uk>, "Kristo, Tero" <t-kristo@ti.com>
List-Id: devicetree@vger.kernel.org


________________________________________
=46rom: Lee Jones [lee.jones@linaro.org]
Sent: Thursday, June 06, 2013 12:36 PM
To: J, KEERTHY
Cc: linux-kernel@vger.kernel.org; grant.likely@secretlab.ca; linux-doc@=
vger.kernel.org; devicetree-discuss@lists.ozlabs.org; swarren@wwwdotorg=
=2Eorg; swarren@nvidia.com; rob.herring@calxeda.com; rob@landley.net; s=
ameo@linux.intel.com; wim@iguana.be; lgirdwood@gmail.com; gg@slimlogic.=
co.uk; Kristo, Tero; Ian Lartey
Subject: Re: [PATCH v3] mfd: DT bindings for the palmas family MFD

On Thu, 06 Jun 2013, Lee Jones wrote:

> On Thu, 06 Jun 2013, J Keerthy wrote:
>
> > Add the various binding files for the palmas family of chips. There=
 is a
> > top level MFD binding then a seperate binding for regulators IP blo=
cks on chips.
> >
> > Signed-off-by: Graeme Gregory <gg@slimlogic.co.uk>
> > Signed-off-by: J Keerthy <j-keerthy@ti.com>
> > Signed-off-by: Ian Lartey <ian@slimlogic.co.uk>
> > Reviewed-by: Stephen Warren <swarren@nvidia.com>
> > ---
> >  Documentation/devicetree/bindings/mfd/palmas.txt   |   49 ++++++++=
+++++
> >  .../devicetree/bindings/regulator/palmas-pmic.txt  |   72 ++++++++=
++++++++++++
> >  2 files changed, 121 insertions(+), 0 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/palmas.tx=
t
> >  create mode 100644
> > Documentation/devicetree/bindings/regulator/palmas-pmic.tx
>
> Applied, thanks.

Grant,

Could you pull this and drop the v2 of this patch please?

Regards,
Keerthy


Ah wait. It appears Grant wants to take this.

Unapplied, thanks. :)

--
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org =81 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
