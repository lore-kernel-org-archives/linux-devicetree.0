From: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 1/5] gpio: Cygnus: define Broadcom Cygnus GPIO binding
Date: Mon, 8 Dec 2014 08:55:20 -0800
Message-ID: <5485D7F8.6090305@broadcom.com>
References: <1418006316-324-2-git-send-email-rjui@broadcom.com> <2594176.SCRFa6Sb3O@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2594176.SCRFa6Sb3O@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 12/8/2014 3:22 AM, Arnd Bergmann wrote:
> On Sunday 07 December 2014 18:38:32 Ray Jui wrote:
>> +Required properties:
>> +
>> +- compatible:
>> +    Currently supported Cygnus GPIO controllers include:
>> +    "brcm,cygnus-ccm-gpio": ChipcommonG GPIO controller
>> +    "brcm,cygnus-asiu-gpio": ASIU GPIO controller
>> +    "brcm,cygnus-crmu-gpio": CRMU GPIO controller
>
> How different are these? If they are almost the same, would it
> be better to use the same compatible string for all of them and
> describe the differences in extra properties?
>
> If they are rather different, maybe you should have a separate
> binding and driver for each?
>
> 	Arnd
>
They are quite similar with the following minor differences:
1) ChipcommonG GPIO controller uses a separate register block 
(0x0301d164) to control drive stregnth
2) Cannot control drive strength for the CMRU GPIO
3) CRMU GPIO controller's interrupt is not connected to GIC of A9. 
Currently that's taken care of by using a "no-interrupt" device tree 
property

I can change to use the common compatible string "brcm,cygnus-gpio". 
With an introduction of property "no-drv-stregnth" which should be set 
for CRMU GPIO controller. For ChipcommonG GPIO, it will have a second 
register block defined, so we'll know to use that second register block 
for drive strength configuration. For the rest, we assume normal drive 
strength configuration (i.e., ASIU in our case).

Looking at this again, it looks like the "no-interrupt" property is 
really redundant. For GPIO controller without interrupt connected to A9, 
we can simply leave its interrupt properties not defined. I'll get rid 
of it along with the above changes.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
