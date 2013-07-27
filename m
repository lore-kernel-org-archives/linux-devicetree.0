From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 2/2] pinctrl: palmas: add pincontrol driver
Date: Sat, 27 Jul 2013 17:41:35 +0530
Message-ID: <51F3B8F7.4000809@nvidia.com>
References: <1374833754-19659-1-git-send-email-ldewangan@nvidia.com> <1374833754-19659-3-git-send-email-ldewangan@nvidia.com> <51F2C970.7000200@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <51F2C970.7000200@wwwdotorg.org>
Sender: linux-doc-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: "grant.likely@linaro.org" <grant.likely@linaro.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "rob@landley.net" <rob@landley.net>, "sameo@linux.intel.com" <sameo@linux.intel.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "gg@slimlogic.co.uk" <gg@slimlogic.co.uk>, "kishon@ti.com" <kishon@ti.com>, Stephen Warren <swarren@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <Mark.Rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>
List-Id: devicetree@vger.kernel.org

Hi Stephen,
Thanks for detail review.
Agree on most of review. Some info/answer on some of query.

On Saturday 27 July 2013 12:39 AM, Stephen Warren wrote:
> (Also CC'ing in the DT bindings maintainers, hence quoting all of the
> binding.)
>
> On 07/26/2013 04:15 AM, Laxman Dewangan wrote:
>
> That field looks odd. From what I can tell in the code, the location of
> the pull-up/down/... registers/bits varies depending on which mux
> function is selected for a particular pin? That's a very strange HW
> design. Are you sure the set of pins/functions this driver exposes is
> the correct way to represent the HW?


Yes, the pull up/down register is different for different mux/function. 
It is not for pin specific.

>> +     unsigned mux_reg_base;
>> +     unsigned mux_reg_add;
> This isn't an issue with this patch, but more with the way palmas_read()
> works. Here, the MFD component is telling the MFD top-level object where
> the MFD component exists within the top-level address space. That's
> backwards. The top-level MFD is what know how the components are put
> together to create the whole particular chip, and it's entirely possible
> this could vary chip-to-chip. :-(

I think this was original Idea when Graeme thought of the Palmas DT. But 
unfortunately this was not written.
The base address or the address space should be provided from the DT and 
the address of particular register should be in offset to that base. But 
not fully hardware support this neither the framework is written like 
this for the palmas.

>> +     for (i = 0; i < ARRAY_SIZE(g->opt); i++) {
>> +             if (g->opt[i]->mux_opt == function)
>> +                     break;
>> +     }
> So, when I create the Tegra bindings, I created the list of mux
> functions by looking at the logical meaning of each register value
> (0..3) for each pin, and then made the list of functions have a value
> for each logical meaning. This requires a mapping table between the
> pinctrl subsystem's mux function values and the HW mux function values,
> which is what the loop above implements. Instead, if might be simpler to
> just have functions named "0", "1", "2", ... and have all pins support
> those functions. This simplifies the driver, and the DT bindings.
> Whether doing so would make the DT bindings better probably depends on
> exactly how the HW's documentation is written...

I am not sure I got it completely or not. Let me try out this and get 
reviewed by you.


>
>> +static int palmas_pinconf_get(struct pinctrl_dev *pctldev,
>> +                     unsigned pin, unsigned long *config)
>> +{
>> +     dev_err(pctldev->dev, "pin_config_get op not supported\n");
>> +     return -ENOTSUPP;
>> +}
> Are the pin configuration values applied per pin in HW? If so, you
> should probably implement palmas_pinconf_get/set() rather than
> palmas_pinconf_group_get/set(). You'd also need to change the DT->map
> conversion function to use PIN_MAP_TYPE_CONFIGS_PIN rather than
> PIN_MAP_TYPE_CONFIGS_GROUP.

Yes, this is applied per pin in HW.

