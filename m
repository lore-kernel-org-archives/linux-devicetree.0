From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/4] ARM: at91: at91sam9x5: enable ISI and ov2640 support
Date: Wed, 4 Mar 2015 14:43:05 +0100
Message-ID: <54F70BE9.2030009@atmel.com>
References: <1423728386-24544-1-git-send-email-josh.wu@atmel.com> <20150212100837.2ab78742@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150212100837.2ab78742@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Le 12/02/2015 10:08, Boris Brezillon a =E9crit :
> On Thu, 12 Feb 2015 16:06:22 +0800
> Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org> wrote:
>=20
>> This patch series will enable ISI and ov2640 sensor support for
>> at91sam9g25ek board.
>=20
> This series looks good to me.
>=20
> Acked-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>


3 first patches stacked on top of at91-4.1-dt. Last one on
at91-4.1-defconfig.

Thank, bye.


>> Josh Wu (4):
>>   ARM: at91: at91sam9x5/dts: add ISI dt support, include isi node,
>>     pinctrls
>>   ARM: at91: at91sam9x5ek/dts: add ov2640 support
>>   ARM: at91: at91sam9g25ek/dts: enable ISI and ov2640
>>   ARM: at91: at91_dt_defconfig: enable ISI and ov2640 support
>>
>>  arch/arm/boot/dts/at91sam9g25.dtsi    |  1 +
>>  arch/arm/boot/dts/at91sam9g25ek.dts   | 18 +++++++++++++
>>  arch/arm/boot/dts/at91sam9x5_isi.dtsi | 46 ++++++++++++++++++++++++=
+++++++++
>>  arch/arm/boot/dts/at91sam9x5ek.dtsi   | 48 ++++++++++++++++++++++++=
+++++++++++
>>  arch/arm/configs/at91_dt_defconfig    |  6 +++++
>>  5 files changed, 119 insertions(+)
>>
>=20
>=20
>=20


--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
