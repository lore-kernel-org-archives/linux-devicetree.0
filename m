From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: single: Allow indicating loss of pin states
 during low-power
Date: Mon, 25 Sep 2017 12:15:49 -0700
Message-ID: <2905a73d-2e73-e590-12a2-f7af7ac83b9e@gmail.com>
References: <20170921010421.7467-1-f.fainelli@gmail.com>
 <20170921010421.7467-3-f.fainelli@gmail.com>
 <CACRpkdbmrEottfArW-Hnv63M1k4zASfMg7W+SUNY6D1N2nxOVA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbmrEottfArW-Hnv63M1k4zASfMg7W+SUNY6D1N2nxOVA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, ext Tony Lindgren <tony@atomide.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Al Cooper <alcooperx@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>
List-Id: devicetree@vger.kernel.org

On 09/22/2017 06:03 AM, Linus Walleij wrote:
> On Thu, Sep 21, 2017 at 3:04 AM, Florian Fainelli <f.fainelli@gmail.com> wrote:
> 
>> Some platforms (e.g: Broadcom STB: BMIPS_GENERIC/ARCH_BRCMSTB) will lose
>> their register contents when entering their lower power state. In such a
>> case, the pinctrl-single driver that is used will not be able to restore
>> the power states without telling the core about it and having
>> pinctrl_select_state() check for that.
>>
>> This patch adds a new optional boolean property that Device Tree can
>> define in order to obtain exactly that and having the core pinctrl code
>> take that into account.
>>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> 
> If we use this per-controller approach rather than the per-state approach
> I discuss in reply to patch 1/2, we should probably make it a generic
> property for pin controllers and not just a pinctrl-single business.

I suppose it makes sense to make this a generic pinctrl property then.
drivers/pinctrl/core.c does not appear to be trying to fetch any
properties for a pinctrl device, but that is probably not too hard to add.

> 
> So patch pinctrl-bindings.txt and put the code somewhere in
> core.
> 
> But that is more of a detail, first we need to figure out how to
> handle this business in general.

Fair enough.
-- 
Florian
