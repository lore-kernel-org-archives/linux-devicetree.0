From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH v4 1/4] ARM: UniPhier: add basic support for UniPhier architecture
Date: Thu, 23 Apr 2015 12:41:08 +0900
Message-ID: <CAK7LNAQW0qf3qunhMHu63+m5W0jeJKajW51Y+XXH8jk_A+3fgQ@mail.gmail.com>
References: <1429600890-26713-1-git-send-email-yamada.masahiro@socionext.com>
	<1429600890-26713-2-git-send-email-yamada.masahiro@socionext.com>
	<4816076.vmWnA5VvTb@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4816076.vmWnA5VvTb@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Heiko,


2015-04-21 23:56 GMT+09:00 Heiko St=C3=BCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>:
> Am Dienstag, 21. April 2015, 16:21:27 schrieb Masahiro Yamada:
>> Initial commit for a new SoC family, UniPhier, developed by
>> Socionext Inc. (formerly, System LSI Business Division of
>> Panasonic Corporation).
>>
>> This commit includes a minimal set of components for booting the
>> kernel, including SMP support.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
>> ---
>
> [...]
>
>> +static int uniphier_boot_secondary(unsigned int cpu,
>> +                                struct task_struct *idle)
>> +{
>> +     struct regmap *sbcm_regmap;
>> +     int ret;
>> +
>> +     sbcm_regmap =3D syscon_regmap_lookup_by_compatible(
>> +                     "socionext,uniphier-system-bus-controller-misc=
");
>> +     if (IS_ERR(sbcm_regmap)) {
>> +             pr_err("failed to regmap system-bus-controller-misc\n"=
);
>> +             return PTR_ERR(sbcm_regmap);
>> +     }
>> +
>> +     ret =3D regmap_write(sbcm_regmap, 0x1208,
>> +                        virt_to_phys(uniphier_secondary_startup));
>> +     if (!ret)
>> +             asm("sev"); /* wake up secondary CPU */
>> +
>> +     return ret;
>> +}
>> +
>> +struct smp_operations uniphier_smp_ops __initdata =3D {
>> +     .smp_prepare_cpus       =3D uniphier_smp_prepare_cpus,
>> +     .smp_boot_secondary     =3D uniphier_boot_secondary,
>> +};
>
> this is more of a drive-by comment, but you're doing the syscon looku=
p on
> every boot of a core, which includes walking big parts of the devicet=
ree every
> time.
>
> Is there anything speaking against doing this once in a .smp_prepare_=
cpus
> callback?

Not really.

I fixed this in v5.
Thanks for reviewing my patch!


--=20
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
