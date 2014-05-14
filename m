From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 5/9] dt: deps: register drivers based on the
 initialization order based on DT
Date: Wed, 14 May 2014 20:32:50 +0100
Message-ID: <CACxGe6tThM_0+Kvo62_AEN5D_5E0GDpwowMZC4Nq=oqAZ57RxA@mail.gmail.com>
References: <1399913280-6915-1-git-send-email-holler@ahsoftware.de>
 <1399913280-6915-6-git-send-email-holler@ahsoftware.de> <20140514141300.67206C4153D@trevor.secretlab.ca>
 <53738496.2070800@ahsoftware.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53738496.2070800-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
Cc: Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 14, 2014 at 3:58 PM, Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org> wrote:
> Am 14.05.2014 16:13, schrieb Grant Likely:
>
>> On Mon, 12 May 2014 18:47:56 +0200, Alexander Holler
>> <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org> wrote:
>>>
>>> The init system currently calls unknown functions with almost unknown
>>> functionality in an almost random order.
>>
>>
>> Correct, we've got a module system. Some would say that is a strength!
>> :-) That said, I don't object to optimizing to the optimal order when
>> possible.
>
>
> Modules do work after init happened, that isn't what this feature is about.

Oops, I meant modular. I wasn't talking about modules either. The
driver model is designed to match devices with drivers regardless of
the order that either of them get registered to the system. I think
that is a strong aspect of the drivercore. What it doesn't have is any
way of optimizing the probe order, which is at the heart of your
proposal.

>
>
>>
>>> Fixing this is on a short-term basis is a bit tricky.
>>>
>>> In order to register drivers with a deterministic order, a list of all
>>> available in-kernel drivers is needed. Unfortunately such a list doesn't
>>> exist, just a list of initcalls does exist.
>>>
>>> The trick now is to first call special annotated initcalls (I call those
>>> "well done") for platform drivers, but not actualy starting those drivers
>>> by calling their probe function, but just collectiong their meta datas
>>> (struct platform_driver). After all those informations were collected,
>>> available the drivers will be started according to the previously
>>> determined order.
>>
>>
>> Why does the initcall level matter? Why not just let the initcalls
>> happen, capture the calls that register a driver, and then use that list
>> later?
>
>
> Some initcalls assume that stuff is present when they called probe or
> register and do further action based on the rc code.

What I mean is that manipulating the initcall level isn't the best way
to handle it. We've got enough initcalls and there isn't a need to add
more. Other ways to handle the problem would be to either have a
variant of the platform_driver_register() that triggers your desired
behavour, or add a flag to the struct device_driver that tells the
driver core that it should try to resolve ordering. In both cases the
module_platform_driver() macro can do the magic bit. Other drivers
will have to do it manually.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
