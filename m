From: Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: add SMP enable-method for Broadcom
 NSP
Date: Tue, 10 Nov 2015 21:56:17 +0530
Message-ID: <56421AA9.5010106@broadcom.com>
References: <1446844273-6460-1-git-send-email-kapilh@broadcom.com>
 <1446844273-6460-2-git-send-email-kapilh@broadcom.com>
 <CAL_JsqL4FqEFN848eZjnnCj_1N7C1K1OkzFHLVxgG5srHpdGEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqL4FqEFN848eZjnnCj_1N7C1K1OkzFHLVxgG5srHpdGEw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, bcm-k
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 11/7/2015 11:33 PM, Rob Herring wrote:
> On Fri, Nov 6, 2015 at 3:11 PM, Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
>> Add a compatible string "brcm,bcm-nsp-smp" for Broadcom's
>> Northstar Plus CPU to the 32-bit ARM CPU device tree binding
>> documentation file and create a new binding documentation for
>> Northstar Plus CPU.
>>
>> Signed-off-by: Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> ---
>>  .../bindings/arm/bcm/brcm,nsp-cpu-method.txt       | 36 ++++++++++++++++++++++
>>  Documentation/devicetree/bindings/arm/cpus.txt     |  1 +
>>  2 files changed, 37 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method.txt
>>
>> diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method.txt b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method.txt
>> new file mode 100644
>> index 0000000..8506da7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method.txt
>> @@ -0,0 +1,36 @@
>> +Broadcom Northstar Plus SoC CPU Enable Method
>> +---------------------------------------------
>> +This binding defines the enable method used for starting secondary
>> +CPUs in the following Broadcom SoCs:
>> +  BCM58522, BCM58525, BCM58535, BCM58622, BCM58623, BCM58625, BCM88312
>> +
>> +The enable method is specified by defining the following required
>> +properties in the "cpus" device tree node:
>> +  - enable-method = "brcm,bcm-nsp-smp";
> 
> As I said already, this is supposed to be per cpu.
> 
>> +  - secondary-boot-reg = <...>;
> 
> And then you might as well move this too.
> 
NS/NSP family of SoCs have maximum of two cores. There would not be a
need for another boot-reg in this family of SoCs. However, I agree, it 
should go to individual CPU nodes. I will do the change in the next patch.
>> +
>> +The secondary-boot-reg property is a u32 value that specifies the
>> +physical address of the register used to request the ROM holding pen
>> +code release a secondary CPU.
>> +
>> +Example:
>> +       cpus {
>> +               #address-cells = <1>;
>> +               #size-cells = <0>;
>> +               enable-method = "brcm,bcm-nsp-smp";
>> +               secondary-boot-reg = <0xffff042c>;
>> +
>> +               cpu0: cpu@0 {
>> +                       device_type = "cpu";
>> +                       compatible = "arm,cortex-a9";
>> +                       next-level-cache = <&L2>;
>> +                       reg = <0>;
>> +               };
>> +
>> +               cpu1: cpu@1 {
>> +                       device_type = "cpu";
>> +                       compatible = "arm,cortex-a9";
>> +                       next-level-cache = <&L2>;
>> +                       reg = <1>;
>> +               };
>> +       };
>> diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
>> index 91e6e5c..6abe3f3 100644
>> --- a/Documentation/devicetree/bindings/arm/cpus.txt
>> +++ b/Documentation/devicetree/bindings/arm/cpus.txt
>> @@ -191,6 +191,7 @@ nodes to be present and contain the properties described below.
>>                             "allwinner,sun8i-a23"
>>                             "arm,psci"
>>                             "brcm,brahma-b15"
>> +                           "brcm,bcm-nsp-smp"
>>                             "marvell,armada-375-smp"
>>                             "marvell,armada-380-smp"
>>                             "marvell,armada-390-smp"
>> --
>> 2.1.0
>>
Thanks,
Kapil Hali
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
