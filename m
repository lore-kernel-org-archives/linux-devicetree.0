From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v6 3/9] pinctrl: actions: Add Actions S900 pinctrl driver
Date: Tue, 3 Apr 2018 19:03:46 +0200
Message-ID: <d86b21a7-e269-6c27-c0e7-d46bee8e5c1d@suse.de>
References: <20180328174703.19778-1-manivannan.sadhasivam@linaro.org>
 <20180328174703.19778-4-manivannan.sadhasivam@linaro.org>
 <CAHp75VeRh9hORs=4nPqc=rUOCRzAfp0z2_1_xpJUScAeE07yqw@mail.gmail.com>
 <20180403170016.w3scjt57ssvk6zyi@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180403170016.w3scjt57ssvk6zyi@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?B?5YiY54Kc?= <liuwei@actions-semi.com>, mp-cs@actions-semi.com, 96boards@ucrobotics.com, devicetree <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, amit.kucheria@linaro.org, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, hzhang@ucrobotics.com, bdong@ucrobotics.com, Mani Sadhasivam <manivannanece23@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Mani,

Am 03.04.2018 um 19:00 schrieb Manivannan Sadhasivam:
> On Sat, Mar 31, 2018 at 12:16:49AM +0300, Andy Shevchenko wrote:
>> On Wed, Mar 28, 2018 at 8:46 PM, Manivannan Sadhasivam
>> <manivannan.sadhasivam@linaro.org> wrote:
>>> +static const struct pinconf_ops owl_pinconf_ops = {
>>> +       .is_generic = true,
>>> +       .pin_config_get = owl_pin_config_get,
>>> +       .pin_config_set = owl_pin_config_set,
>>> +       .pin_config_group_get = owl_group_config_get,
>>> +       .pin_config_group_set = owl_group_config_set
>>
>> It's still good idea to leave comma here...
>>
> 
> I'm confused. What is the criteria for removing/keeping comma for last member
> of struct? I followed your gpio driver suggestion.

No comma for list terminator ("{}") because nothing goes after it; comma
whenever it allows adding a new line without touching the old one, i.e.
keeping future diff small.

Cheers,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
