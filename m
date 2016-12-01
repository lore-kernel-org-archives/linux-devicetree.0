From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: BCM5301X: Enable UART by default for BCM4708(1) and BCM4709(4)
Date: Thu, 1 Dec 2016 18:23:20 +0100
Message-ID: <CACna6rygrQuZqaViTVQM5P8ieA2Gh-h-zrEZETAQrHHT9cnrWA@mail.gmail.com>
References: <20161128140134.25128-1-zajec5@gmail.com> <CAC3K-4o3-eSDU5JvjkgohtWLUmZqQViHvX1h2zfdPAGe+qbCOg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAC3K-4o3-eSDU5JvjkgohtWLUmZqQViHvX1h2zfdPAGe+qbCOg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 1 December 2016 at 18:14, Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
> On Mon, Nov 28, 2016 at 9:01 AM, Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8@public.gmane.org=
m> wrote:
>>
>> From: Rafa=C5=82 Mi=C5=82ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>>
>> Every device tested so far got UART0 (at 0x18000300) working as serial
>> console. It's most likely part of reference design and all vendors use
>> it that way.
>>
>> It seems to be easier to enable it by default and just disable it if we
>> ever see a device with different hardware design.
>>
>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/bcm4708-buffalo-wzr-1750dhp.dts  | 4 ----
>>  arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts       | 4 ----
>>  arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts       | 4 ----
>>  arch/arm/boot/dts/bcm4708-netgear-r6250.dts        | 4 ----
>>  arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts      | 4 ----
>>  arch/arm/boot/dts/bcm4708.dtsi                     | 4 ++++
>>  arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dts | 4 ----
>>  arch/arm/boot/dts/bcm47081.dtsi                    | 4 ++++
>>  arch/arm/boot/dts/bcm4709-netgear-r7000.dts        | 4 ----
>>  arch/arm/boot/dts/bcm4709-netgear-r8000.dts        | 4 ----
>>  arch/arm/boot/dts/bcm4709-tplink-archer-c9-v1.dts  | 4 ----
>>  arch/arm/boot/dts/bcm4709.dtsi                     | 1 +
>>  arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts      | 4 ----
>>  arch/arm/boot/dts/bcm47094-luxul-xwr-3100.dts      | 4 ----
>>  arch/arm/boot/dts/bcm47094-netgear-r8500.dts       | 4 ----
>>  arch/arm/boot/dts/bcm47094.dtsi                    | 1 +
>
>
> I think there are a few missing here.  A quick grep shows
>
> $ grep -rI '#include "bcm470[89].dtsi"'  arch/arm/boot/dts/*.dts
> arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dts:#include "bcm4708.dtsi"
> arch/arm/boot/dts/bcm4708-asus-rt-ac68u.dts:#include "bcm4708.dtsi"
> arch/arm/boot/dts/bcm4708-buffalo-wzr-1750dhp.dts:#include "bcm4708.dtsi"
> arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts:#include "bcm4708.dtsi"
> arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts:#include "bcm4708.dtsi"
> arch/arm/boot/dts/bcm4708-netgear-r6250.dts:#include "bcm4708.dtsi"
> arch/arm/boot/dts/bcm4708-netgear-r6300-v2.dts:#include "bcm4708.dtsi"
> arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts:#include "bcm4708.dtsi"
> arch/arm/boot/dts/bcm4709-asus-rt-ac87u.dts:#include "bcm4709.dtsi"
> arch/arm/boot/dts/bcm4709-buffalo-wxr-1900dhp.dts:#include "bcm4709.dtsi"
> arch/arm/boot/dts/bcm4709-netgear-r7000.dts:#include "bcm4709.dtsi"
> arch/arm/boot/dts/bcm4709-netgear-r8000.dts:#include "bcm4709.dtsi"
> arch/arm/boot/dts/bcm4709-tplink-archer-c9-v1.dts:#include "bcm4709.dtsi"
> arch/arm/boot/dts/bcm94708.dts:#include "bcm4708.dtsi"
> arch/arm/boot/dts/bcm94709.dts:#include "bcm4708.dtsi"
> arch/arm/boot/dts/bcm953012er.dts:#include "bcm4708.dtsi"
> arch/arm/boot/dts/bcm953012k.dts:#include "bcm4708.dtsi"
>
> I specifically care about the last 4 :)

Actually the only missing ones are the last 4. Other ones (e.g.
bcm4709-buffalo-wxr-1900dhp.dts) never got uart0 enabled so I just
didn't need to modify these files.

I'll send V2 updating last 4 ones as well. Thanks for catching this.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
