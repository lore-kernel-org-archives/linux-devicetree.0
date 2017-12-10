From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: Allow indicating loss of pin states
 during low-power
Date: Sun, 10 Dec 2017 15:38:00 -0800
Message-ID: <908c66f9-f9bd-a4df-e241-75595a3a3e27@gmail.com>
References: <20171102231551.16220-1-f.fainelli@gmail.com>
 <20171102231551.16220-3-f.fainelli@gmail.com>
 <CACRpkdZtFRB_iy1bDPZ0wkK0jf7pkTGtbZG4gQUJVR+eiO+dhA@mail.gmail.com>
 <20171129170247.GI28152@atomide.com>
 <96cf5d74-3acf-07b9-9ad8-1011cd99a860@gmail.com>
 <CACRpkdbFHj9pM6R3azVPKgbQ-LMmitEdJHQ5BOEb7Vy=kpNk4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbFHj9pM6R3azVPKgbQ-LMmitEdJHQ5BOEb7Vy=kpNk4A@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tony Lindgren <tony@atomide.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Stephen Warren <swarren@nvidia.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Al Cooper <alcooperx@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>
List-Id: devicetree@vger.kernel.org



On 12/02/2017 04:48 AM, Linus Walleij wrote:
> On Wed, Nov 29, 2017 at 6:37 PM, Florian Fainelli <f.fainelli@gmail.com> wrote:
>> On 11/29/2017 09:02 AM, Tony Lindgren wrote:
> 
>>> Hmm well typically a device driver that loses it's context just does
>>> save and restore of the registers in runtime PM suspend/resume
>>> as needed. In this case it would mean duplicating the state for
>>> potentially for hundreds of registers.. So using the existing
>>> state in the pinctrl subsystem totally makes sense for the pins.
>>>
>>> Florian do you have other reasons why this should be done in the
>>> pinctrl framework instead of the driver? Might be worth describing
>>> the reasoning in the patch descriptions :)
>>
>> The pinctrl provider driver that I am using is pinctrl-single, which has
>> proper suspend/resume callbacks but those are not causing any HW
>> programming to happen because of the (p->state == state) check, hence
>> this patch series.
> 
> So we are talking about these callbacks, correct?
> 
> #ifdef CONFIG_PM
> static int pinctrl_single_suspend(struct platform_device *pdev,
>                                         pm_message_t state)
> {
>         struct pcs_device *pcs;
> 
>         pcs = platform_get_drvdata(pdev);
>         if (!pcs)
>                 return -EINVAL;
> 
>         return pinctrl_force_sleep(pcs->pctl);
> }
> 
> static int pinctrl_single_resume(struct platform_device *pdev)
> {
>         struct pcs_device *pcs;
> 
>         pcs = platform_get_drvdata(pdev);
>         if (!pcs)
>                 return -EINVAL;
> 
>         return pinctrl_force_default(pcs->pctl);
> }
> #endif
> 
> Which falls through to this:
> 
> /**
>  * pinctrl_force_sleep() - turn a given controller device into sleep state
>  * @pctldev: pin controller device
>  */
> int pinctrl_force_sleep(struct pinctrl_dev *pctldev)
> {
>         if (!IS_ERR(pctldev->p) && !IS_ERR(pctldev->hog_sleep))
>                 return pinctrl_select_state(pctldev->p, pctldev->hog_sleep);
>         return 0;
> }
> EXPORT_SYMBOL_GPL(pinctrl_force_sleep);
> 
> /**
>  * pinctrl_force_default() - turn a given controller device into default state
>  * @pctldev: pin controller device
>  */
> int pinctrl_force_default(struct pinctrl_dev *pctldev)
> {
>         if (!IS_ERR(pctldev->p) && !IS_ERR(pctldev->hog_default))
>                 return pinctrl_select_state(pctldev->p, pctldev->hog_default);
>         return 0;
> }
> EXPORT_SYMBOL_GPL(pinctrl_force_default);
> 
> So am I right in assuming it is actually the hogs that is your biggest
> problem, and those are the states that get lost over suspend/resume
> that are especially problematic?
> 
> I.e. you don't have any problem with any non-hogged pinctrl
> handles, those are handled just fine in the suspend/resume
> paths of the client drivers?
> 
> If this is the case, it changes the problem scope slightly.
> 
> It is fair that functions named *force* should actually enforce
> programming a state.
> 
> So then I would suggest somethin else: break pinctrl_select_state()
> into two:
> 
> pinctrl_select_state() that works just like before, checking if
> (p->state == state) but which calls a static function
> pinctrl_select_state_commit() that commits the change unconditonally.
> Then alter pinctrl_force_sleep() and pinctrl_force_sleep() to call
> that function.
> 
> This should solve your problem without having to alter the semantics
> of pinctrl_select_state() for everyone.

This was exactly what I proposed initially here:

http://patchwork.ozlabs.org/patch/734326/

I really want to get this fixed, but I can't do that if we keep losing
the context of the discussion (pun intended) :).
-- 
Florian
