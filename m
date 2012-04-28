From: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/9] ARM: mmp: fix build issue on mmp with device tree
Date: Sat, 28 Apr 2012 11:11:56 +0800
Message-ID: <CAN1soZzETeCa7zVVpXC3y6Pa+nUMJLgbPAYpCBEfNsTTPF=XTg@mail.gmail.com>
References: <1335515957-1798-1-git-send-email-haojian.zhuang@gmail.com>
 <1335515957-1798-2-git-send-email-haojian.zhuang@gmail.com>
 <201204272015.49611.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201204272015.49611.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Apr 28, 2012 at 4:15 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Friday 27 April 2012, Haojian Zhuang wrote:
>> Since irq_domain_add_simple() is removed, remove it in mmp-dt.c also.
>>
>> Signed-off-by: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> This should also be fixed for v3.4, right?
>
Since I have more code updated in irq, I update them together to avoid
dependency issue.
>
>> diff --git a/arch/arm/mach-mmp/mmp-dt.c b/arch/arm/mach-mmp/mmp-dt.c
>> index 6707539..ca22e3c0 100644
>> --- a/arch/arm/mach-mmp/mmp-dt.c
>> +++ b/arch/arm/mach-mmp/mmp-dt.c
>> @@ -32,31 +32,9 @@ static const struct of_dev_auxdata mmp_auxdata_lookup=
[] __initconst =3D {
>> =A0 =A0 =A0 =A0 {}
>> =A0};
>>
>> -static int __init mmp_intc_add_irq_domain(struct device_node *np,
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0struct device_node *parent)
>> -{
>> - =A0 =A0 =A0 irq_domain_add_simple(np, 0);
>> - =A0 =A0 =A0 return 0;
>> -}
>> -
>> -static int __init mmp_gpio_add_irq_domain(struct device_node *np,
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0struct device_node *parent)
>> -{
>> - =A0 =A0 =A0 irq_domain_add_simple(np, IRQ_GPIO_START);
>> - =A0 =A0 =A0 return 0;
>> -}
>> -
>> -static const struct of_device_id mmp_irq_match[] __initconst =3D {
>> - =A0 =A0 =A0 { .compatible =3D "mrvl,mmp-intc", .data =3D mmp_intc_add_=
irq_domain, },
>> - =A0 =A0 =A0 { .compatible =3D "mrvl,mmp-gpio", .data =3D mmp_gpio_add_=
irq_domain, },
>> - =A0 =A0 =A0 {}
>> -};
>> -
>> =A0static void __init mmp_dt_init(void)
>> =A0{
>>
>> - =A0 =A0 =A0 of_irq_init(mmp_irq_match);
>> -
>> =A0 =A0 =A0 =A0 of_platform_populate(NULL, of_default_bus_match_table,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mmp_auxdata_l=
ookup, NULL);
>> =A0}
>
> Shouldn't you be calling irq_domain_add_legacy now?
>
irq_domain_add_legacy() is used in irq.c. It's in another patch in this ser=
ies.
