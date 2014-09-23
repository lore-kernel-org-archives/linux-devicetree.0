From: Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Subject: Re: [RESEND PATCH 1/4] ARM: STi: DT: STiH407: 407 DT Entry for clockgen
 A0
Date: Tue, 23 Sep 2014 09:58:56 +0200
Message-ID: <54212840.60508@st.com>
References: <1408977888-10473-1-git-send-email-gabriel.fernandez@linaro.org> <1408977888-10473-2-git-send-email-gabriel.fernandez@linaro.org> <542124CB.1080307@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <542124CB.1080307-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olivier Bideau <olivier.bideau-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Thanks Maxime !

On 09/23/2014 09:44 AM, Maxime Coquelin wrote:
>
>
> On 08/25/2014 04:44 PM, Gabriel FERNANDEZ wrote:
>> Patch adds DT entries for clockgen A0
>>
>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Signed-off-by: Olivier Bideau <olivier.bideau-qxv4g6HH51o@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/stih407-clock.dtsi | 32 
>> ++++++++++++++++++++++++++++++++
>>   1 file changed, 32 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/stih407-clock.dtsi 
>> b/arch/arm/boot/dts/stih407-clock.dtsi
>> index 800f46f..e03e86e 100644
>> --- a/arch/arm/boot/dts/stih407-clock.dtsi
>> +++ b/arch/arm/boot/dts/stih407-clock.dtsi
>> @@ -7,6 +7,10 @@
>>    */
>>   / {
>>       clocks {
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        ranges;
>> +
>>           /*
>>            * Fixed 30MHz oscillator inputs to SoC
>>            */
>> @@ -35,5 +39,33 @@
>>               clock-frequency = <200000000>;
>>               clock-output-names = "clk-s-icn-reg-0";
>>           };
>> +
>> +        /*
>> +         * ClockGenAs on SASG2
>> +         */
> Note that I removed this comment since no SASG2 on STiH407.
>
>> +        clockgen-a@090ff000 {
>> +            compatible = "st,clkgen-c32";
>> +            reg = <0x90ff000 0x1000>;
> ...

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
