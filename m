From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v2 11/23] ARM: dts: armadillo800eva: Fix W=1 dtc warnings
Date: Mon, 23 May 2016 14:52:20 +0200
Message-ID: <CAMuHMdXPhMToHhZggdKo=i65nS_mQT1o44YBd_Lz-B2Td3Jm9Q@mail.gmail.com>
References: <1463728214-13838-1-git-send-email-geert+renesas@glider.be>
	<1463728214-13838-12-git-send-email-geert+renesas@glider.be>
	<e0a1fbc1-ac95-2c79-65ed-d0328679bb8a@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e0a1fbc1-ac95-2c79-65ed-d0328679bb8a-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, May 20, 2016 at 5:38 PM, Sergei Shtylyov
<sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
> On 05/20/2016 10:10 AM, Geert Uytterhoeven wrote:
>> Warning (unit_address_vs_reg): Node /memory has a reg or ranges property, but no unit name
>> Warning (unit_address_vs_reg): Node /regulator@0 has a unit name, but no reg property
>> Warning (unit_address_vs_reg): Node /regulator@1 has a unit name, but no reg property
>> Warning (unit_address_vs_reg): Node /regulator@2 has a unit name, but no reg property
>> Warning (unit_address_vs_reg): Node /regulator@3 has a unit name, but no reg property
>> Warning (unit_address_vs_reg): Node /i2c@2 has a unit name, but no reg property
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>> ---
>> v2:
>>   - No changes.
>> ---
>>  arch/arm/boot/dts/r8a7740-armadillo800eva.dts | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
>> b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
>> index 2c82dab2b6f45f9c..b3f0ac4b99bd5a3d 100644
>> --- a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
>> +++ b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
>
> [...]
>>
>> @@ -127,7 +127,7 @@
>>                 };
>>         };
>>
>> -       i2c2: i2c@2 {
>> +       i2c2: i2c2 {
>
>    Not "i2c-2" as in the other patches?

Oops... Thanks for noticing!

Simon: Do you want me to repost the whole series once again, or
can you fix this up while applying?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
