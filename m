From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Subject: Re: [PATCH] mfd: qcom-spmi-pmic: Add support for more chips versions
Date: Wed, 05 Nov 2014 15:50:29 +0200
Message-ID: <1415195429.3660.2.camel@mm-sol.com>
References: <1415108003-16387-1-git-send-email-iivanov@mm-sol.com>
	 <545A1CD2.4030407@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <545A1CD2.4030407@suse.de>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Stanimir Varbanov <svarbanov@mm-sol.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Wed, 2014-11-05 at 13:49 +0100, Andreas F=C3=A4rber wrote:
> Hi,
>=20
> Am 04.11.2014 um 14:33 schrieb Ivan T. Ivanov:
> > Update compatible string with runtime detected chip revision
> > information, for example qcom,pm8941 will become qcom,pm8941-v1.0.
>=20
> That's not what the patch does though?

Patch add support for more chips and make compatible property more spec=
ific.
Will correct description.

>=20
> > Signed-off-by: Ivan T. Ivanov <iivanov@mm-sol.com>
> > ---
> >  .../devicetree/bindings/mfd/qcom,spmi-pmic.txt     |  18 ++-
> >  drivers/mfd/qcom-spmi-pmic.c                       | 142 +++++++++=
++++++++++++
> >  2 files changed, 156 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.t=
xt=20
> > b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
> > index 7182b88..bbe7db8 100644
> > --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
> > +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
> > @@ -15,10 +15,20 @@ each. A function can consume one or more of the=
se fixed-size register=20
> > regions.
> >=20
> >  Required properties:
> >  - compatible:      Should contain one of:
> > -                     "qcom,pm8941"
> > -                     "qcom,pm8841"
> > -                     "qcom,pma8084"
> > -                     or generalized "qcom,spmi-pmic".
> > +                   qcom,pm8941,
> > +                   qcom,pm8841,
> > +                   qcom,pm8019,
> > +                   qcom,pm8226,
> > +                   qcom,pm8110,
> > +                   qcom,pma8084,
> > +                   qcom,pmi8962,
> > +                   qcom,pmd9635,
> > +                   qcom,pm8994,
> > +                   qcom,pmi8994,
> > +                   qcom,pm8916,
> > +                   qcom,pm8004,
> > +                   qcom,pm8909,
>=20
> Please either keep the strings consistently quoted, or drop the trail=
ing
> comma to avoid any confusion of where it terminates.

Sure, will fix it.

Thank you,
Ivan
