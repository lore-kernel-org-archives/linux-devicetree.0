From: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>
Subject: Re: [PATCH] mfd: qcom-spmi-pmic: Add support for more chips versions
Date: Wed, 5 Nov 2014 17:36:59 -0800
Message-ID: <CAJAp7OgXHGWQj7MWh51LTUdmZpgZc=6m=o-Az=z8QxR7yfrw7g@mail.gmail.com>
References: <1415108003-16387-1-git-send-email-iivanov@mm-sol.com>
	<CAJAp7OgU64=KCuDhYEZTYppVeBz6wKvTDsof5vDRznfdZgAfZw@mail.gmail.com>
	<1415212271.14949.1.camel@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415212271.14949.1.camel-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 5, 2014 at 10:31 AM, Ivan T. Ivanov <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org> wrote:
>
> On Wed, 2014-11-05 at 10:11 -0800, Bjorn Andersson wrote:
>> On Tue, Nov 4, 2014 at 5:33 AM, Ivan T. Ivanov <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
>> wrote:
>> [..]
>> > @@ -28,11 +144,27 @@ static int pmic_spmi_probe(struct spmi_device
>> > *sdev)
>> >  {
>> >         struct device_node *root = sdev->dev.of_node;
>> >         struct regmap *regmap;
>> > +       struct property *prop;
>> > +       int major, minor, ret;
>> > +       char *name, compatible[32];
>> >
>> >         regmap = devm_regmap_init_spmi_ext(sdev,
>> > &spmi_regmap_config);
>> >         if (IS_ERR(regmap))
>> >                 return PTR_ERR(regmap);
>> >
>> > +       ret = pmic_spmi_read_revid(regmap, &name, &major, &minor);
>> > +       if (!ret) {
>> > +               snprintf(compatible, ARRAY_SIZE(compatible),
>> > "qcom,%s-v%d.%d",
>> > +                        name, major, minor);
>> > +               prop = kzalloc(sizeof(*prop), GFP_KERNEL);
>> > +               if (prop) {
>> > +                       prop->name = kstrdup("compatible",
>> > GFP_KERNEL);
>> > +                       prop->value = kstrdup(compatible,
>> > GFP_KERNEL);
>> > +                       prop->length = strlen(prop->value);
>> > +                       of_update_property(root, prop);
>> > +               }
>> > +       }
>> > +
>>
>> Why would you do this?
>> What benefit does it give to patch the of_node to have a more
>> specific
>> compatible?
>
> Some of the child device drivers have to know PMIC chip revision.
>

So your plan is to have a strstr(parent->compatible, "-v2") there?

Could you be a little bit more elaborate on what you're trying to do
and which child devices that might be?

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
