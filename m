From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] mfd: qcom-spmi-pmic: Add support for pm8005,pm8998,pmi8998
Date: Wed, 02 May 2018 09:29:36 -0700
Message-ID: <152527857679.138124.10889204252669437850@swboyd.mtv.corp.google.com>
References: <20180419230032.13611-1-swboyd@chromium.org>
 <CAD=FV=VoGpRLsPXcfPaiaJh18u+79DcN9PUGScDKUu+COgj7Gw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD=FV=VoGpRLsPXcfPaiaJh18u+79DcN9PUGScDKUu+COgj7Gw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Doug Anderson (2018-04-23 22:26:29)
> =

> >  static const struct of_device_id pmic_spmi_id_table[] =3D {
> >         { .compatible =3D "qcom,spmi-pmic", .data =3D (void *)COMMON_SU=
BTYPE },
> > @@ -54,7 +57,10 @@ static const struct of_device_id pmic_spmi_id_table[=
] =3D {
> >         { .compatible =3D "qcom,pmi8994",   .data =3D (void *)PMI8994_S=
UBTYPE },
> >         { .compatible =3D "qcom,pm8916",    .data =3D (void *)PM8916_SU=
BTYPE },
> >         { .compatible =3D "qcom,pm8004",    .data =3D (void *)PM8004_SU=
BTYPE },
> > +       { .compatible =3D "qcom,pmi8998",   .data =3D (void *)PMI8998_S=
UBTYPE },
> > +       { .compatible =3D "qcom,pm8005",    .data =3D (void *)PM8005_SU=
BTYPE },
> >         { .compatible =3D "qcom,pm8909",    .data =3D (void *)PM8909_SU=
BTYPE },
> > +       { .compatible =3D "qcom,pm8998",    .data =3D (void *)PM8998_SU=
BTYPE },
> =

> nit: It appears that the above table was previously sorted by SUBTYPE
> ID.  Could you perhaps move your 3 new PMICs to the bottom to maintain
> this?  Other than that, you can add my Reviewed-by if you would like
> (not that I have _any_ real expertise on SPMI, so might not be worth
> it).

Ok. I'll change the order and resend the patch with the reviewed-by
tags.
