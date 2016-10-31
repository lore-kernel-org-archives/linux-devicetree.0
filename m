From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: BCM5301X: Add back handler ignoring external
 imprecise aborts
Date: Mon, 31 Oct 2016 23:16:20 +0100
Message-ID: <CACna6ryMbF8kVUYOfhre4qtZp5haa2Shijcv40AXsjL_jZL=JQ@mail.gmail.com>
References: <20161029111229.26875-1-zajec5@gmail.com> <a491509e-5cfc-fc7d-0011-dfcab3c884ea@broadcom.com>
 <6e252703-0010-83ae-fa14-57352add007a@hauke-m.de> <fb2c36cb-6f85-1a6d-160a-c50e22d6c46b@gmail.com>
 <dcb21fe4-672f-4545-5b47-d764f390e741@broadcom.com> <18db27c7-1055-ff3c-0b0b-eeeaf5f3f5e0@gmail.com>
 <3847db9f-a8e1-b7fe-c2fa-19ea893bae5f@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3847db9f-a8e1-b7fe-c2fa-19ea893bae5f-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux PCI <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 31 October 2016 at 23:05, Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wro=
te:
> On 16-10-31 02:56 PM, Florian Fainelli wrote:
>> - fixups the aborts in the kernel, look where they come from, by using
>> some bit of magic, looking at PCIe registers and whatnot (provided that
>> is even possible), not too hard, but can take a while, and is error pron=
e
>
> Option 4 sounds like the proper solution - check the range the abort is d=
ue
> to the PCI device enumeration and only ignore those aborts.

This was already suggested by Arnd:
http://lists.infradead.org/pipermail/linux-arm-kernel/2016-April/422873.htm=
l
and Ray was checking some internal datasheets, but I'm afraid he never
found info on checking if error was caused by PCIe controller.

Maybe we could think about some BCM5301X API (extra symbol exported by
arch code) for starting ignoring aborts and stopping that. We could
ignore aborts during scanning only but honestly it sounds like a bit
hacky solution to me.


>> I can certainly advocate that option 3 is the one that gives a working
>> device, and this is what matters from a distribution perspective like
>> LEDE/OpenWrt.
>>
> Since I don't use BCM5301x option 3 is fine by me.

So for it seems like the best solution to me, but I'm open for changes
if someone points another that is clean & better one.

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
