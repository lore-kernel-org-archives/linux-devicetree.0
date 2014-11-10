From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v9 4/8] ARM: dts: Enable Broadcom Cygnus SoC
Date: Mon, 10 Nov 2014 10:35:36 -0800
Message-ID: <CAOesGMgqsvOtgxKa6aBwvTqW3CO5Q7E_YsVVuS83yR4GdQEHUw@mail.gmail.com>
References: <sbranden@broadcom.com>
	<1414538111-11668-1-git-send-email-sbranden@broadcom.com>
	<1414538111-11668-5-git-send-email-sbranden@broadcom.com>
	<1415616611.4862.38.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415616611.4862.38.camel@x220>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Cc: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Valentin Rothberg <valentinrothberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Broadcom Kernel Feedback List <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Antti Palosaari <crope-X3B1VOXEql0@public.gmane.org>, JD Zheng <jdzheng-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>"linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linu>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 10, 2014 at 2:50 AM, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org> wrote:
> On Tue, 2014-10-28 at 16:15 -0700, Scott Branden wrote:
>> DT files to enable cygnus consisting on reference designs
>> and cygnus core configuration.
>>
>> Reviewed-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> Reviewed-by: Arun Parameswaran <aparames-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> Tested-by: Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> Reviewed-by: JD (Jiandong) Zheng <jdzheng-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> Signed-off-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>
> This landed in today's linux-next (ie, next-21041110) as commit
> 8872fc22c267 ("ARM: dts: Enable Broadcom Cygnus SoC").
>
>>  arch/arm/boot/dts/Makefile              |    4 ++
>>  arch/arm/boot/dts/bcm-cygnus-clock.dtsi |   73 ++++++++++++++++++++++
>>  arch/arm/boot/dts/bcm-cygnus.dtsi       |  100 +++++++++++++++++++++++++++++++
>>  arch/arm/boot/dts/bcm911360_entphn.dts  |   32 ++++++++++
>>  arch/arm/boot/dts/bcm911360k.dts        |   32 ++++++++++
>>  arch/arm/boot/dts/bcm958300k.dts        |   32 ++++++++++
>>  6 files changed, 273 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/bcm-cygnus-clock.dtsi
>>  create mode 100644 arch/arm/boot/dts/bcm-cygnus.dtsi
>>  create mode 100644 arch/arm/boot/dts/bcm911360_entphn.dts
>>  create mode 100644 arch/arm/boot/dts/bcm911360k.dts
>>  create mode 100644 arch/arm/boot/dts/bcm958300k.dts
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index 38c89ca..4b3a590 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -54,6 +54,10 @@ dtb-$(CONFIG_ARCH_AT91)    += at91-sama5d4ek.dtb
>>  dtb-$(CONFIG_ARCH_ATLAS6) += atlas6-evb.dtb
>>  dtb-$(CONFIG_ARCH_AXXIA) += axm5516-amarillo.dtb
>>  dtb-$(CONFIG_ARCH_BCM2835) += bcm2835-rpi-b.dtb
>> +dtb-$(CONFIG_ARCH_BCM_CYGNUS) += \
>> +     bcm911360_entphn.dtb \
>> +     bcm911360k.dtb \
>> +     bcm958300k.dtb
>>  dtb-$(CONFIG_ARCH_BCM_5301X) += bcm4708-netgear-r6250.dtb
>>  dtb-$(CONFIG_ARCH_BCM_63XX) += bcm963138dvt.dtb
>>  dtb-$(CONFIG_ARCH_BCM_MOBILE) += bcm28155-ap.dtb \
>
> Without patch 1/8 ("ARM: cygnus: Initial support for Broadcom Cygnus
> SoC") CONFIG_ARCH_BCM_CYGNUS will not be set. I guess patch 1/8 will be
> added to linux-next one of these days. Is that correct?

Yes.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
