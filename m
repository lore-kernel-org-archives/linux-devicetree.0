From: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [PATCH] powerpc: dts: use #include "..." to include local DT
Date: Tue, 13 Jun 2017 20:21:45 +1000
Message-ID: <87r2yogpc6.fsf@concordia.ellerman.id.au>
References: <1495602744-18874-1-git-send-email-yamada.masahiro@socionext.com> <CAK7LNARnkHTyAMXjPZnOxOkP_b8vc6qvYOv-wf_Fn0eaPSdpeA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK7LNARnkHTyAMXjPZnOxOkP_b8vc6qvYOv-wf_Fn0eaPSdpeA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Cc: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> writes:

> Hi
>
> (+Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>)
>
>
> Ping.
> I am not 100% sure who is responsible for this,
> but somebody, could take a look at this patch, please?

Have you tested it actually works?

It sounds reasonable, and if it behaves as you describe there is no
change in behaviour, right?

cheers

> 2017-05-24 14:12 GMT+09:00 Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>:
>> Most of DT files in PowerPC use #include "..." to make pre-processor
>> include DT in the same directory, but we have 3 exceptional files
>> that use #include <...> for that.
>>
>> Fix them to remove -I$(srctree)/arch/$(SRCARCH)/boot/dts path from
>> dtc_cpp_flags.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
>> ---
>>
>>  arch/powerpc/boot/dts/ac14xx.dts     | 2 +-
>>  arch/powerpc/boot/dts/mpc5121ads.dts | 2 +-
>>  arch/powerpc/boot/dts/pdm360ng.dts   | 2 +-
>>  3 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/powerpc/boot/dts/ac14xx.dts b/arch/powerpc/boot/dts/ac14xx.dts
>> index 27fcabc2f857..83bcfd865167 100644
>> --- a/arch/powerpc/boot/dts/ac14xx.dts
>> +++ b/arch/powerpc/boot/dts/ac14xx.dts
>> @@ -10,7 +10,7 @@
>>   */
>>
>>
>> -#include <mpc5121.dtsi>
>> +#include "mpc5121.dtsi"
>>
>>  / {
>>         model = "ac14xx";
>> diff --git a/arch/powerpc/boot/dts/mpc5121ads.dts b/arch/powerpc/boot/dts/mpc5121ads.dts
>> index 75888ce2c792..73c30621429b 100644
>> --- a/arch/powerpc/boot/dts/mpc5121ads.dts
>> +++ b/arch/powerpc/boot/dts/mpc5121ads.dts
>> @@ -9,7 +9,7 @@
>>   * option) any later version.
>>   */
>>
>> -#include <mpc5121.dtsi>
>> +#include "mpc5121.dtsi"
>>
>>  / {
>>         model = "mpc5121ads";
>> diff --git a/arch/powerpc/boot/dts/pdm360ng.dts b/arch/powerpc/boot/dts/pdm360ng.dts
>> index 0cec7244abe7..445b88114009 100644
>> --- a/arch/powerpc/boot/dts/pdm360ng.dts
>> +++ b/arch/powerpc/boot/dts/pdm360ng.dts
>> @@ -13,7 +13,7 @@
>>   * option) any later version.
>>   */
>>
>> -#include <mpc5121.dtsi>
>> +#include "mpc5121.dtsi"
>>
>>  / {
>>         model = "pdm360ng";
>> --
>> 2.7.4
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>
> -- 
> Best Regards
> Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
