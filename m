From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] pinctrl: Allow indicating loss of pin states
 during low-power
Date: Wed, 29 Nov 2017 09:37:26 -0800
Message-ID: <96cf5d74-3acf-07b9-9ad8-1011cd99a860@gmail.com>
References: <20171102231551.16220-1-f.fainelli@gmail.com>
 <20171102231551.16220-3-f.fainelli@gmail.com>
 <CACRpkdZtFRB_iy1bDPZ0wkK0jf7pkTGtbZG4gQUJVR+eiO+dhA@mail.gmail.com>
 <20171129170247.GI28152@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171129170247.GI28152-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Charles Keepax <ckeepax-yzvPICuk2AA4QjBA90+/kJqQE7yCjDx5@public.gmane.org>, Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/29/2017 09:02 AM, Tony Lindgren wrote:
> * Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> [171129 13:03]:
>> On Fri, Nov 3, 2017 at 12:15 AM, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>
>>> Some platforms (e.g: Broadcom STB: BMIPS_GENERIC/ARCH_BRCMSTB) will lose
>>> their register contents when entering their lower power state. In such a
>>> case, the pinctrl-single driver that is used will not be able to restore
>>> the power states without telling the core about it and having
>>> pinctrl_select_state() check for that.
>>>
>>> This patch adds a new optional boolean property that Device Tree can
>>> define in order to obtain exactly that and having the core pinctrl code
>>> take that into account.
>>>
>>> Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> Florian, I'm really sorry for losing track of this patch set, it's
>> important stuff and I see why systems are dependent on something
>> like this.
>>
>> Tony: can you look at this from a pinctrl-single point of view?
>> This is the intended consumer: pinctrl-single users that lose the
>> hardware state over suspend/resume.
>>
>> How do you see this working with other pinctrl-single users?
> 
> Hmm well typically a device driver that loses it's context just does
> save and restore of the registers in runtime PM suspend/resume
> as needed. In this case it would mean duplicating the state for
> potentially for hundreds of registers.. So using the existing
> state in the pinctrl subsystem totally makes sense for the pins.
> 
> Florian do you have other reasons why this should be done in the
> pinctrl framework instead of the driver? Might be worth describing
> the reasoning in the patch descriptions :)

The pinctrl provider driver that I am using is pinctrl-single, which has
proper suspend/resume callbacks but those are not causing any HW
programming to happen because of the (p->state == state) check, hence
this patch series.

> 
> So as long as the pinctrl framework state is used to restore the
> state by the pinctrl driver instead of the pinctrl consumer drivers,
> I don't have issues with this patchset. So probably just improving
> the patch messages a bit should do it.
> 
> FYI, on omaps, the PRCM hardware saves and restores the pinctrl
> state so this has not been so far an issue.
> 
> Regards,
> 
> Tony
> 
> 


-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
