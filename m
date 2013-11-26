From: Tim Kryger <tim.kryger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/5] Documentation: dt: Add kona-pwm binding
Date: Mon, 25 Nov 2013 17:50:38 -0800
Message-ID: <CAAYSxho=vJ0svnsg4KkD7tU9JMekEwef3if2jJD=d5pwWwndMw@mail.gmail.com>
References: <1384800901-21711-1-git-send-email-tim.kryger@linaro.org>
	<1384800901-21711-2-git-send-email-tim.kryger@linaro.org>
	<20131125111709.GJ22043@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131125111709.GJ22043-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux PWM List <linux-pwm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Device Tree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Doc List <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Broadcom Kernel Feedback List <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Linux ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linaro Patches List <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 25, 2013 at 3:17 AM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Mon, Nov 18, 2013 at 10:54:57AM -0800, Tim Kryger wrote:

>> +++ b/Documentation/devicetree/bindings/pwm/bcm-kona-pwm.txt
>> @@ -0,0 +1,24 @@
>> +Broadcom's PWM Controller Device Tree bindings
>
> This sounds somewhat strange, like Broadcom owns the bindings... perhaps
> just:
>
>         Broadcom PWM controller device tree bindings
>
> Or for consistency:
>
>         Broadcom Kona PWM controller device tree bindings

Yes that sounds better.

>> +Broadcom's Kona PWM Controller has 6 channels
>
> "controller" and end the sentence with a full stop.

Sure.

>> +- clocks: clock specifier for the kona pwm external clock
>
> Please use the correct spelling "PWM" in prose here and elsewhere. Also
> you should pick one of "kona", "Kona" or "KONA" and stick with it
> consistently. Might also be useful to mention what Kona is. Doesn't
> necessarily have to be in the document, but if for nothing else, then
> just for my curiosity.

Agreed.  It should be "Kona" here.

Kona roughly defines the set of common IP used on multiple mobile SoCs.

>> +- #pwm-cells: should be 2.  The first cell specifies the per-chip index
>> +  of the PWM to use and the second cell is the period in nanoseconds.
>> +
>> +Refer to pwm/pwm.txt for generic pwm controller node properties.
>> +
>> +Refer to clocks/clock-bindings.txt for generic clock consumer
>> +properties
>
> This sentence should also end with a full stop.

Sure thing.  Thanks again.

-Tim
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
