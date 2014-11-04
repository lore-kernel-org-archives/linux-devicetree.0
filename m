From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Subject: Re: [PATCH] mfd: qcom-spmi-pmic: Add support for more chips versions
Date: Tue, 04 Nov 2014 17:22:47 +0200
Message-ID: <1415114567.29957.14.camel@mm-sol.com>
References: <1415108003-16387-1-git-send-email-iivanov@mm-sol.com>
	 <5458EB64.3030203@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <5458EB64.3030203@mm-sol.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Tue, 2014-11-04 at 17:06 +0200, Stanimir Varbanov wrote:
> Hi Ivan,
> 
> 
+
> > +       switch (subtype) {
> > +       case PM8941_SUBTYPE:
> > +       *name = "pm8941";
> > +       break;
> 
> The XXX_SUBTYPE seems are continuous why not make it an const array and
> get the name by index in this array?
> 

Yep, it _seems_ to be continuous. But, yes. probably using array will
more compact way to represent this.

<snip>

> > @@ -28,11 +144,27 @@ static int pmic_spmi_probe(struct spmi_device *sdev)
> >  {
> >         struct device_node *root = sdev->dev.of_node;
> >         struct regmap *regmap;
> > +       struct property *prop;
> > +       int major, minor, ret;
> > +       char *name, compatible[32];
> > 
> >         regmap = devm_regmap_init_spmi_ext(sdev, &spmi_regmap_config);
> >         if (IS_ERR(regmap))
> >         return PTR_ERR(regmap);
> > 
> > +       ret = pmic_spmi_read_revid(regmap, &name, &major, &minor);
> > +       if (!ret) {
> 
> Are you sure that we want to continue if we can't read the revision id
> and therefore will not be able to construct properly the compatible
> property?
> 

Yes. Driver is working fine even without exact chip version
appended to compatible string.

> > +       snprintf(compatible, ARRAY_SIZE(compatible), "qcom,%s-v%d.%d",
> > +       name, major, minor);
> > +       prop = kzalloc(sizeof(*prop), GFP_KERNEL);
> > +       if (prop) {
> > +       prop->name = kstrdup("compatible", GFP_KERNEL);
> > +       prop->value = kstrdup(compatible, GFP_KERNEL);
> > +       prop->length = strlen(prop->value);
> > +       of_update_property(root, prop);
> 
> of_update_property can fail, check the returned value.

Same thing as above, but probably allocated memory at least can be freed.

Thanks Ivan.

> 
> <snip>
> 
> 
