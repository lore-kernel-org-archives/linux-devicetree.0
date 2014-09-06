From: Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: pxa: dts: fix mmc controller compatible string
Date: Sat, 06 Sep 2014 17:55:34 +0200
Message-ID: <540B2E76.9000105@zonque.org>
References: <1408009573-24523-1-git-send-email-zonque@gmail.com> <CAOesGMh6sc7U6XRjGWBUPszaD9K66Ek=3xdMyGdh7bEAMXVG4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMh6sc7U6XRjGWBUPszaD9K66Ek=3xdMyGdh7bEAMXVG4g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Olof,

Sorry for the late reply.

On 08/28/2014 12:01 AM, Olof Johansson wrote:
> On Thu, Aug 14, 2014 at 2:46 AM, Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> The vendor prefix was renamed from "mrvl" to "marvell". Follow this
>> change in the dts file.
>>
>> Signed-off-by: Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/pxa2xx.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/pxa2xx.dtsi b/arch/arm/boot/dts/pxa2xx.dtsi
>> index febd391..f188f8c 100644
>> --- a/arch/arm/boot/dts/pxa2xx.dtsi
>> +++ b/arch/arm/boot/dts/pxa2xx.dtsi
>> @@ -128,7 +128,7 @@
>>                 };
>>
>>                 mmc0: mmc@41100000 {
>> -                       compatible = "mrvl,pxa-mmc";
>> +                       compatible = "marvell,pxa-mmc";
> 
> It seems that the driver was changed without consideration to
> backwards compatibility. The driver should still handle both the old
> and the new prefix (since we keep this a stable ABI). The old one
> should be deprecated but still accepted.
>
> I.e. this is an OK change, but it's fine to hold off as a cleanup
> until 3.18. The driver has a regression though, that needs to be fixed
> for 3.17.

Hmm, no. The driver never actuall supported that string. It was my bad
when I submitted the original version of pxa2xx.dtsi. Still, given that
it went unnoticed for so long, it can well wait for 3.18.

Thanks,
Daniel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
