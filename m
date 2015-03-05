From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Subject: Re: [PATCH v2] mfd: Add specific compatible strings for Qualcomm's
 SPMI PMIC's
Date: Thu, 05 Mar 2015 10:14:38 +0200
Message-ID: <1425543278.5705.11.camel@mm-sol.com>
References: <1425464365-3291-1-git-send-email-iivanov@mm-sol.com>
	 <54F75690.3010406@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <54F75690.3010406@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Stanimir Varbanov <svarbanov@mm-sol.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Wed, 2015-03-04 at 11:01 -0800, Stephen Boyd wrote:
> On 03/04/15 02:19, Ivan T. Ivanov wrote:
> > diff --git a/drivers/mfd/qcom-spmi-pmic.c b/drivers/mfd/qcom-spmi-pmic.c
> > index 4b8beb2..a1af4e5 100644
> > --- a/drivers/mfd/qcom-spmi-pmic.c
> > +++ b/drivers/mfd/qcom-spmi-pmic.c
> > 
> > +
> > +static void pmic_spmi_show_revid(struct regmap *map, struct device *dev)
> > +{
> > +       unsigned int rev2, minor, major, type, subtype;
> > +       int ret;
> > +
> > +       ret = regmap_read(map, PMIC_TYPE, &type);
> > +       if (ret < 0)
> > +               return;
> > +
> > +       if (type != PMIC_TYPE_VALUE)
> > +               return;
> > +
> > +       ret = regmap_read(map, PMIC_SUBTYPE, &subtype);
> > +       if (ret < 0)
> > +               return;
> > +
> > +       if (subtype > ARRAY_SIZE(pmic_spmi_id_table))
> > +               return;
> > +
> > +       rev2 = regmap_read(map, PMIC_REV2, &rev2);
> 
> ret = ?

Ouch. will fix.

> 
> > 
> > +
> > +       dev_info(dev, "%s-v%d.%d detected\n",
> > +                       pmic_spmi_id_table[subtype].compatible, major, minor);
> > +}
> > 
> 
> I wonder if this should be dev_dbg.

It is not so much verbose, right? I could cut "detected". I will like to keep it.

Thanks, 
Ivan
