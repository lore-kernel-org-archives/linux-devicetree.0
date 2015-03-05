From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Subject: Re: [PATCH v2] mfd: Add specific compatible strings for Qualcomm's
 SPMI PMIC's
Date: Thu, 05 Mar 2015 10:16:03 +0200
Message-ID: <1425543363.5705.13.camel@mm-sol.com>
References: <1425464365-3291-1-git-send-email-iivanov@mm-sol.com>
	 <54F7576C.9060808@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54F7576C.9060808@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Stanimir Varbanov <svarbanov@mm-sol.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Wed, 2015-03-04 at 11:05 -0800, Stephen Boyd wrote:
> On 03/04/15 02:19, Ivan T. Ivanov wrote:
> > +
> > +static const struct of_device_id pmic_spmi_id_table[] = {
> > +       [COMMON_SUBTYPE]  = { .compatible = "qcom,spmi-pmic" },
> > +       [PM8941_SUBTYPE]  = { .compatible = "qcom,pm8941" },
> > +       [PM8841_SUBTYPE]  = { .compatible = "qcom,pm8841" },
> > +       [PM8019_SUBTYPE]  = { .compatible = "qcom,pm8019" },
> > +       [PM8226_SUBTYPE]  = { .compatible = "qcom,pm8226" },
> > +       [PM8110_SUBTYPE]  = { .compatible = "qcom,pm8110" },
> > +       [PMA8084_SUBTYPE] = { .compatible = "qcom,pma8084" },
> > +       [PMI8962_SUBTYPE] = { .compatible = "qcom,pmi8962" },
> > +       [PMD9635_SUBTYPE] = { .compatible = "qcom,pmd9635" },
> > +       [PM8994_SUBTYPE]  = { .compatible = "qcom,pm8994" },
> > +       [PMI8994_SUBTYPE] = { .compatible = "qcom,pmi8994" },
> > +       [PM8916_SUBTYPE]  = { .compatible = "qcom,pm8916" },
> > +       [PM8004_SUBTYPE]  = { .compatible = "qcom,pm8004" },
> > +       [PM8909_SUBTYPE]  = { .compatible = "qcom,pm8909" },
> > +       { }
> > +};
> 
> Also this seems error prone in the case where we may have skips between
> pmic model numbers and then the of_device_id table is going to have a
> sentinel in the middle of the table. It's probably better to store the
> subtype number in the data field and iterate over the array.

True. Will reorganize.

Thanks,
Ivan
