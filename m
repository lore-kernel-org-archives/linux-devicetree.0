From: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH for-4.11 1/2] Revert "phy: Add USB3 PHY support for
 Broadcom NSP SoC"
Date: Wed, 8 Feb 2017 18:36:28 -0500
Message-ID: <CAC3K-4pT62VQ10MVtrrwbRUr9EYkoudZ0vatN_h9gQa7rxkuqQ@mail.gmail.com>
References: <20170208233023.31922-1-zajec5@gmail.com> <82b47a03-c41b-378b-2d7c-f263eff514a9@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <82b47a03-c41b-378b-2d7c-f263eff514a9-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Yendapally Reddy Dhananjaya Reddy <yendapally.reddy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 8, 2017 at 6:32 PM, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wro=
te:
> On 02/08/2017 03:30 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
>> From: Rafa=C5=82 Mi=C5=82ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>>
>> This reverts commit d7bc1a7d41bf ("phy: Add USB3 PHY support for
>> Broadcom NSP SoC") as we already have driver for this PHY (shared by NS
>> and NSP). It was added in commit e5666281d9ea ("phy: bcm-ns-usb3: new
>> driver for USB 3.0 PHY on Northstar").
>>
>> Instead of adding separated driver & duplicating code we should work on
>> improving existing (old) one. Thanks to work done by Broadcom we know
>> there is MDIO bus we weren't aware of & we know register names which
>> makes initialization more clear. This is very valuable info and we
>> should work on using it in existing driver afterwards.
>
> Should not we first extend the old driver to support NSP and then revert
> d7bc1a7d41bf ("phy: Add USB3 PHY support for Broadcom NSP SoC")?

I am currently in the process of doing this, but I'm guessing that I
am 1-2 weeks away from having it completed.  It might not hit the
merge window.

Thanks,
Jon

> --
> Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
