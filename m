From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: Allow indicating loss of pin states
 during low-power
Date: Sat, 30 Dec 2017 11:31:19 -0800
Message-ID: <8890917a-67e2-6ec6-690f-0121d5de4103@gmail.com>
References: <20171102231551.16220-1-f.fainelli@gmail.com>
 <20171102231551.16220-3-f.fainelli@gmail.com>
 <CACRpkdZtFRB_iy1bDPZ0wkK0jf7pkTGtbZG4gQUJVR+eiO+dhA@mail.gmail.com>
 <20171129170247.GI28152@atomide.com>
 <96cf5d74-3acf-07b9-9ad8-1011cd99a860@gmail.com>
 <CACRpkdbFHj9pM6R3azVPKgbQ-LMmitEdJHQ5BOEb7Vy=kpNk4A@mail.gmail.com>
 <908c66f9-f9bd-a4df-e241-75595a3a3e27@gmail.com>
 <CACRpkdaXrG0rMChf-SVngsPJrsHbAVbUNfH=4m+RX73NHz3iwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaXrG0rMChf-SVngsPJrsHbAVbUNfH=4m+RX73NHz3iwg@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tony Lindgren <tony@atomide.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Stephen Warren <swarren@nvidia.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Al Cooper <alcooperx@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>
List-Id: devicetree@vger.kernel.org

Le 12/19/17 à 23:24, Linus Walleij a écrit :
> On Mon, Dec 11, 2017 at 12:38 AM, Florian Fainelli <f.fainelli@gmail.com> wrote:
>> On 12/02/2017 04:48 AM, Linus Walleij wrote:
> 
>>> This should solve your problem without having to alter the semantics
>>> of pinctrl_select_state() for everyone.
>>
>> This was exactly what I proposed initially here:
>>
>> http://patchwork.ozlabs.org/patch/734326/
>>
>> I really want to get this fixed, but I can't do that if we keep losing
>> the context of the discussion (pun intended) :).
> 
> Oh sorry man. I am clearly too stupid for this job...

No need to slap yourself!

> 
> In accordance with things needing to be intuitive, something named
> *force_* should of course force the setting into the hardware.
> 
> The original patch didn't mention the fact that it was hogs
> and hogs only that was causing the trouble and that is why I
> got lost. (I guess.) I have been going about this as if it was
> something generic that affect all states in all devices, and to
> me hogs is just an abscure corner of pin controlling...
> 
> I applied the patchwork patch from above, and elaborated
> a bit on that it pertains to hogs, let's see what
> happens.
> 
> For the case where a driver (not hog) needs to handle
> suspend/resume transitions, proper states can hopefully
> be used.

Your commit message makes that clear now, thanks for applying the patch
and gott nytt år!
-- 
Florian
