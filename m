From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/4] documentation: Add compatibles for Amlogic Meson
 GXBB pin controllers
Date: Wed, 11 May 2016 14:17:11 +0200
Message-ID: <CACRpkdZyLZREU28bXtHwLkbXJ2Y8QVTe-5P-RT24o3Bp-c-71w@mail.gmail.com>
References: <1462176138-29433-1-git-send-email-carlo@caione.org>
	<1462176138-29433-3-git-send-email-carlo@caione.org>
	<CACRpkdZQHX2YFh7CFpaagrY+BBtyAejdUs4F7ow+3+9+F6mU-A@mail.gmail.com>
	<CAOQ7t2ZesQPPXTXEPRhF8TqzK-0c7VjH-_2ZKuxAOcd3-Z0uQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOQ7t2ZesQPPXTXEPRhF8TqzK-0c7VjH-_2ZKuxAOcd3-Z0uQQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-meson <linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 11, 2016 at 1:25 PM, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org> wrote:
> On Wed, May 11, 2016 at 10:52 AM, Linus Walleij
> <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> On Mon, May 2, 2016 at 10:02 AM, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org> wrote:
>>
>>> From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
>>>
>>> Add the two new compatibles for the Amlogic Meson GXBB pin controllers.
>>>
>>> Signed-off-by: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
>>> ---
>>>  Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
>>> index 32f4a2d..fe7fe0b 100644
>>> --- a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
>>> +++ b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
>>> @@ -5,6 +5,8 @@ Required properties for the root node:
>>>                       "amlogic,meson8b-cbus-pinctrl"
>>>                       "amlogic,meson8-aobus-pinctrl"
>>>                       "amlogic,meson8b-aobus-pinctrl"
>>> +                     "amlogic,meson-gxbb-periphs-pinctrl"
>>> +                     "amlogic,meson-gxbb-aobus-pinctrl"
>>>   - reg: address and size of registers controlling irq functionality
>>
>> This does NOT apply to the pin control tree because upstream does
>> NOT look like this. It looks like that in linux-next however.
>
> Linus master looks like that
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt

Aha so it was merged by some other tree during the release cycle.
OK sorry, I was confused.

> If you want I can merge it through my tree with the DTS changes.

Sure that makes things easier for me, else I need to backmerge the
-rc6 or something.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
