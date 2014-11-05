From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Subject: Re: [PATCH] mfd: qcom-spmi-pmic: Add support for more chips versions
Date: Wed, 05 Nov 2014 20:31:11 +0200
Message-ID: <1415212271.14949.1.camel@mm-sol.com>
References: <1415108003-16387-1-git-send-email-iivanov@mm-sol.com>
	 <CAJAp7OgU64=KCuDhYEZTYppVeBz6wKvTDsof5vDRznfdZgAfZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CAJAp7OgU64=KCuDhYEZTYppVeBz6wKvTDsof5vDRznfdZgAfZw@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn@kryo.se>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Stanimir Varbanov <svarbanov@mm-sol.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


On Wed, 2014-11-05 at 10:11 -0800, Bjorn Andersson wrote:
> On Tue, Nov 4, 2014 at 5:33 AM, Ivan T. Ivanov <iivanov@mm-sol.com> 
> wrote:
> [..]
> > @@ -28,11 +144,27 @@ static int pmic_spmi_probe(struct spmi_device 
> > *sdev)
> >  {
> >         struct device_node *root = sdev->dev.of_node;
> >         struct regmap *regmap;
> > +       struct property *prop;
> > +       int major, minor, ret;
> > +       char *name, compatible[32];
> > 
> >         regmap = devm_regmap_init_spmi_ext(sdev, 
> > &spmi_regmap_config);
> >         if (IS_ERR(regmap))
> >                 return PTR_ERR(regmap);
> > 
> > +       ret = pmic_spmi_read_revid(regmap, &name, &major, &minor);
> > +       if (!ret) {
> > +               snprintf(compatible, ARRAY_SIZE(compatible), 
> > "qcom,%s-v%d.%d",
> > +                        name, major, minor);
> > +               prop = kzalloc(sizeof(*prop), GFP_KERNEL);
> > +               if (prop) {
> > +                       prop->name = kstrdup("compatible", 
> > GFP_KERNEL);
> > +                       prop->value = kstrdup(compatible, 
> > GFP_KERNEL);
> > +                       prop->length = strlen(prop->value);
> > +                       of_update_property(root, prop);
> > +               }
> > +       }
> > +
> 
> Why would you do this?
> What benefit does it give to patch the of_node to have a more 
> specific
> compatible?

Some of the child device drivers have to know PMIC chip revision.

Regards,
Ivan
