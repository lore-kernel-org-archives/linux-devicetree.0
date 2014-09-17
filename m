From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v6 1/3] mfd: devicetree: bindings: Add Qualcomm RPM DT
 binding
Date: Wed, 17 Sep 2014 09:15:54 -0700
Message-ID: <20140917161554.GJ30918@lee--X1>
References: <1409029109-28769-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1409029109-28769-2-git-send-email-bjorn.andersson@sonymobile.com>
 <20140826072727.GB9574@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140826072727.GB9574@lee--X1>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Andy Gross <agross@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@linaro.org>, Kumar Gala <galak@codeaurora.org>, Josh Cartwright <joshc@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 26 Aug 2014, Lee Jones wrote:

> On Mon, 25 Aug 2014, Bjorn Andersson wrote:
>=20
> > Add binding for the Qualcomm Resource Power Manager (RPM) found in =
8660,
> > 8960 and 8064 based devices. The binding currently describes the rp=
m
> > itself and the regulator subnodes.
> >=20
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> > ---
> >  Documentation/devicetree/bindings/mfd/qcom,rpm.txt |  246 ++++++++=
++++++++++++
> >  include/dt-bindings/mfd/qcom,rpm.h                 |  154 ++++++++=
++++
> >  2 files changed, 400 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/qcom,rpm.=
txt
> >  create mode 100644 include/dt-bindings/mfd/qcom,rpm.h
>=20
> Please use the same filename formatting as the existing files.

Are you going to resubmit this (and answer my question on the
regulator patch)?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
