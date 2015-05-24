From: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH] ARM: BCM5301X: activate some additional options in pl310
 cache controller
Date: Sun, 24 May 2015 21:00:37 +0200
Message-ID: <55621FD5.8010408@hauke-m.de>
References: <1432493418-12933-1-git-send-email-hauke@hauke-m.de> <CACna6ryXjmEgw+dzz5OgS=9rUn8ng9S6rD7eBoQ8dqycG5vJ9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACna6ryXjmEgw+dzz5OgS=9rUn8ng9S6rD7eBoQ8dqycG5vJ9Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felix Fietkau <nbd-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Florian Fainelli <fainelli-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org" <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/24/2015 08:54 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
> On 24 May 2015 at 20:50, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org> wrote:
>> In the default Broadcom SDK the shared override is activated for thi=
s
>> cache controller, do the same in the upstream code. Data and
>> instruction prefetching is not activated by default for this cache
>> controller on the bcm53xx SoC, do it manually like it is done in the
>> vendor SDK.
>>
>> Signed-off-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/bcm5301x.dtsi | 3 +++
>>  1 file changed, 3 insertions(+)
>>
This makes use of the attributes added by these two patches:

http://www.spinics.net/lists/arm-kernel/msg416406.html
http://www.spinics.net/lists/arm-kernel/msg418996.html

I hope both patches will make it into 4.2, but there wasn't a negative
comment in the last week.

Hauke
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
