From: Radha Mohan <mohun106-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 3/3] Documentation: add devicetree bindings for Cavium
 Thunder SoC
Date: Tue, 25 Mar 2014 17:00:55 +0530
Message-ID: <CAC8NTUXBqLbZyBOzq=DZYY4xOMZo0Z4L6VtQUYsmWc2m4onapw@mail.gmail.com>
References: <1395652179-9216-1-git-send-email-mohun106@gmail.com>
	<1395652179-9216-4-git-send-email-mohun106@gmail.com>
	<4189666.qlSmlZKNNW@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4189666.qlSmlZKNNW@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Radha Mohan Chintakuntla <rchintakuntla-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, "pkapoor-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org" <pkapoor-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 24, 2014 at 4:30 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Monday 24 March 2014 14:39:39 mohun106-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>> diff --git a/Documentation/devicetree/bindings/arm/cavium-thunder.txt b/Documentation/devicetree/bindings/arm/cavium-thunder.txt
>> new file mode 100644
>> index 0000000..6ea0a34
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/cavium-thunder.txt
>> @@ -0,0 +1,9 @@
>> +Cavium Thunder platform device tree bindings
>> +---------------------------------------------
>> +
>> +Boards with Cavium's Thunder SoC shall have following properties.
>> +
>> +Root Node
>> +---------
>> +Required root node properties:
>> +    - compatible = "cavium,thunder";
>> diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
>> index 333f4ae..f6cadf1 100644
>> --- a/Documentation/devicetree/bindings/arm/cpus.txt
>> +++ b/Documentation/devicetree/bindings/arm/cpus.txt
>> @@ -163,6 +163,7 @@ nodes to be present and contain the properties described below.
>>                             "arm,cortex-r4"
>>                             "arm,cortex-r5"
>>                             "arm,cortex-r7"
>> +                           "cavium,thunder"
>>                             "faraday,fa526"
>>                             "intel,sa110"
>>                             "intel,sa1100"
>
>
> It seems very confusing to use the same name for both the SoC and the
> CPU core. Can you guarantee that there will never be another SoC with
> the same core, or a different CPU core in a SoC with the same name?
>
> If not, please be more specific here and use the exact model names
> rather than the product names.

OK, will fix this once I discuss this internally.

>
>         Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
