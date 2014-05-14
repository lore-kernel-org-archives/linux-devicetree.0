From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 0/9] dt: dependencies (for deterministic driver
 initialization order based on the DT)
Date: Wed, 14 May 2014 17:05:26 +0100
Message-ID: <CACxGe6s4px_9CNk3bkc1OF1KGZGYdyh4gE_VufCKU5dLFBG48g@mail.gmail.com>
References: <1399913280-6915-1-git-send-email-holler@ahsoftware.de>
 <20140514141914.446F7C4153D@trevor.secretlab.ca> <53738580.7000902@ahsoftware.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53738580.7000902-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
Cc: Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 14, 2014 at 4:02 PM, Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org> wrote:
> Am 14.05.2014 16:19, schrieb Grant Likely:
>
>
>> Rather than a dtb schema change, for the most common properties (irqs,
>> clocks, gpios), we could extract dependencies at boot time. I don't like
>> the idea of adding a separate depends-on property because it is very
>> easy to get it out of sync with the actual binding data (dtc is not the
>> only tool that manipulates .dtbs. Firmware will fiddle with it too).
>
>
> Then that stuff has to fiddle correct. Sorry, but trying to solve all
> problems right from the beginning just leads to endless talks with no end
> and nothing will happen at all because nobody aggrees how to start.

I appreciate the problem that you're trying to solve and why you're
using the dtc approach. My job is to poke at the solution and make
sure it is going to be reliable. Making sure all users know how to
fiddle with the new property correctly is not a trivial problem,
especially when it is firmware that will not necessarily be updated.

I'm not saying flat out 'no' here, but before I merge anything, I have
to be reasonably certain that the feature is not going to represent a
maintenance nightmare over the long term.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
