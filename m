From: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/3] Documentation: devicetree: add binding doc for Broadcom
 NAND controller
Date: Mon, 16 Mar 2015 16:52:01 -0700
Message-ID: <55076CA1.60007@broadcom.com>
References: <1425691129-1150-1-git-send-email-computersforpeace@gmail.com> <1425691129-1150-3-git-send-email-computersforpeace@gmail.com> <55076247.4070104@broadcom.com> <20150316233706.GL32500@ld-irv-0074> <550769DD.2020208@broadcom.com> <20150316234634.GN32500@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150316234634.GN32500@ld-irv-0074>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazao <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Corneliu Doban <cdoban-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Brian,


On 15-03-16 04:46 PM, Brian Norris wrote:
> On Mon, Mar 16, 2015 at 04:40:13PM -0700, Scott Branden wrote:
>>
>> On 15-03-16 04:37 PM, Brian Norris wrote:
>>> On Mon, Mar 16, 2015 at 04:07:51PM -0700, Scott Branden wrote:
>>> So, what's the standard? Company prefix? Long name? Commas? Hyphens?
>>
>> The problem with devicetree binding is there is no standard for much
>> of anything.  Some others use the vendor prefix for all their
>> binding documentation.  We can try to do the same?
>
> Ok, but we already have 3 versions for Broadcom. I can use 'brcm,' if
> that helps...

Yes, it helps if we try standardizing on the brcm vendor prefix in
Documentation/devicetree/bindings/vendor-prefixes.txt.  If you sift
through the bindings directory you will find some of the other vendors
have done the same.

Also, of note.
In Documentation/devicetree/bindings/submitting-patches.txt
it states the Documentation should be the first patch in the series.
Perhaps this helps the devicetree maintainer in reviewing bindings?

Scott

>
> Brian
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
