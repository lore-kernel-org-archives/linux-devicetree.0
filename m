From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] of: OF_IRQ should depend on IRQ_DOMAIN
Date: Mon, 6 Apr 2015 10:26:43 -0500
Message-ID: <CAL_JsqJtZguOpnn25Nbw30DcKGqs6f+dQSvWbCr-hsv4UnPiHw@mail.gmail.com>
References: <1428245965-19618-1-git-send-email-geert@linux-m68k.org>
 <1428245965-19618-3-git-send-email-geert@linux-m68k.org> <4981781.UvXHorNsu5@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4981781.UvXHorNsu5@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 6, 2015 at 9:40 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Sunday 05 April 2015 16:59:24 Geert Uytterhoeven wrote:
>> If CONFIG_IRQ_DOMAIN=3Dn:
>>
>> drivers/of/irq.c: In function =E2=80=98of_irq_get=E2=80=99:
>> drivers/of/irq.c:406: error: implicit declaration of function =E2=80=
=98irq_find_host=E2=80=99
>> drivers/of/irq.c:406: warning: assignment makes pointer from integer=
 without a cast
>> make[2]: *** [drivers/of/irq.o] Error 1
>>
>> Signed-off-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
>> ---
>>  drivers/of/Kconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
>> index 4c98f14694458794..92adecd3ecb28fc7 100644
>> --- a/drivers/of/Kconfig
>> +++ b/drivers/of/Kconfig
>> @@ -50,7 +50,7 @@ config OF_ADDRESS_PCI
>>
>>  config OF_IRQ
>>         def_bool y
>> -       depends on !SPARC
>> +       depends on !SPARC && IRQ_DOMAIN
>>
>>  config OF_NET
>>         depends on NETDEVICES
>>
>
> Sparc does not set IRQ_DOMAIN, so we can probably simplify this to
>
> config OF_IRQ
>         def_bool IRQ_DOMAIN
>
> unless you want to keep the sparc antidependency explicit.

IRQ_DOMAIN is selected in quite a few places. We'd need to make sure
none of those can be selected by Sparc.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
