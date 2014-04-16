From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 0/2] ARM: berlin: add GPIO support for the BG2Q
Date: Wed, 16 Apr 2014 21:21:23 +0200
Message-ID: <534ED833.9080004@gmail.com>
References: <1397634395-7456-1-git-send-email-antoine.tenart@free-electrons.com> <20140416171112.31757110@xhacker>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140416171112.31757110@xhacker>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, =?UTF-8?B?QW50b2luZSBUw6luYXJ0?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: "alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jimmy Xu <zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/16/2014 11:11 AM, Jisheng Zhang wrote:
> On Wed, 16 Apr 2014 00:46:33 -0700
> Antoine T=C3=A9nart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>=20
>> This series add the support for the GPIOs of the Berlin BG2Q. We use=
 the
>> newly integrated dwapb GPIO driver here.
>>
>> This applies on top of Alexandre's BG2Q symbol introduction[1] and t=
he dwapb
>> gpio patch fixing IRQ initialization[2].
>>
>> [1] https://patchwork.kernel.org/patch/3876141/
>> [2] https://lkml.org/lkml/2014/4/7/96
>>
>> Changes since v1:
>> 	- s/gpio-controller@/gpio-port@/ in device tree
>> 	- moved ARCH_REQUIRE_GPIOLIB to ARCH_BERLIN in Kconfig
>>
>> Antoine T=C3=A9nart (2):
>>   ARM: berlin: add the LIBGPIO as a dependency for the BG2Q
>>   ARM: dts: berlin: add GPIO nodes for the BG2Q
>>
>>  arch/arm/boot/dts/berlin2q.dtsi | 102
>> ++++++++++++++++++++++++++++++++++++++++ arch/arm/mach-berlin/Kconfi=
g
>> |   1 + 2 files changed, 103 insertions(+)
>>
>=20
> All the two patches look good

Patch 1 applied to berlin/soc,
Patch 2 applied to berlin/dt,

both with Jisheng's Reviewed-by.

Thanks!

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
