From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3] arm64: dts: qcom: Add Dragonboard 845c
Date: Tue, 18 Jun 2019 17:07:01 -0700
Message-ID: <20190619000701.GI4814@minitux>
References: <20190618211945.27431-1-bjorn.andersson@linaro.org>
 <CAOCk7Nq7X=3LdzQF83J1QDRnrQtWmjRcySyLZ-3M321HtHxHfg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOCk7Nq7X=3LdzQF83J1QDRnrQtWmjRcySyLZ-3M321HtHxHfg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, MSM <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue 18 Jun 14:27 PDT 2019, Jeffrey Hugo wrote:

> On Tue, Jun 18, 2019 at 3:21 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
[..]
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> > new file mode 100644
> > index 000000000000..71bd717a4251
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> > @@ -0,0 +1,557 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2019, Linaro Ltd.
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> > +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> > +#include "sdm845.dtsi"
> > +#include "pm8998.dtsi"
> > +#include "pmi8998.dtsi"
> > +
> > +/ {
> > +       model = "Thundercomm Dragonboard 845c";
> > +       compatible = "thundercomm,db845c", "qcom,sdm845";
> 
> Is "thundercomm" a legal vendor prefix?
> 

Following the other board vendors, yes. But you're right in that it
should be added to vendor-prefixes.yaml as well.

Given the review feedback on v2 I've merged this revision for v5.3.

Regards,
Bjorn
