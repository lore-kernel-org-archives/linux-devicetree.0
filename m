From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v6 3/9] pinctrl: actions: Add Actions S900 pinctrl driver
Date: Fri, 6 Apr 2018 17:01:07 +0300
Message-ID: <CAHp75Vd3otEntMseY0pq7ZyUhk1irs9Xt02R5c061FSDT0jXDA@mail.gmail.com>
References: <20180328174703.19778-1-manivannan.sadhasivam@linaro.org>
 <20180328174703.19778-4-manivannan.sadhasivam@linaro.org> <CAHp75VeRh9hORs=4nPqc=rUOCRzAfp0z2_1_xpJUScAeE07yqw@mail.gmail.com>
 <20180403170016.w3scjt57ssvk6zyi@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180403170016.w3scjt57ssvk6zyi@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, =?UTF-8?B?5YiY54Kc?= <liuwei@actions-semi.com>, mp-cs@actions-semi.com, 96boards@ucrobotics.com, devicetree <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, amit.kucheria@linaro.org, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, hzhang@ucrobotics.com, bdong@ucrobotics.com, Mani Sadhasivam <manivannanece23@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 3, 2018 at 8:00 PM, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:

>> > +static const struct pinconf_ops owl_pinconf_ops = {
>> > +       .is_generic = true,
>> > +       .pin_config_get = owl_pin_config_get,
>> > +       .pin_config_set = owl_pin_config_set,
>> > +       .pin_config_group_get = owl_group_config_get,
>> > +       .pin_config_group_set = owl_group_config_set
>>
>> It's still good idea to leave comma here...

> I'm confused. What is the criteria for removing/keeping comma for last member
> of struct? I followed your gpio driver suggestion.

Just a common sense and experience are talking here: from time to time
some structures are being expanded and in some cases it requires to
update users. The comma just reduces a possible burden on this
expansion.
This is common pattern used in kernel.

>> > +};
>> > +
>> > +static struct pinctrl_desc owl_pinctrl_desc = {
>> > +       .pctlops = &owl_pinctrl_ops,
>> > +       .pmxops = &owl_pinmux_ops,
>> > +       .confops = &owl_pinconf_ops,
>> > +       .owner = THIS_MODULE
>>
>> ...and here, and in all similar places.
>>
>> > +};

-- 
With Best Regards,
Andy Shevchenko
