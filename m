From: Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v5 2/5] ARM: BCM: Clean up SMP support for Broadcom Kona
Date: Sat, 5 Dec 2015 17:26:08 +0530
Message-ID: <5662D0D8.1020004@broadcom.com>
References: <1449260611-24417-1-git-send-email-kapilh@broadcom.com>
 <1449260611-24417-3-git-send-email-kapilh@broadcom.com>
 <56621CA3.3090903@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56621CA3.3090903-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Florian,

On 12/5/2015 4:37 AM, Florian Fainelli wrote:
> On 04/12/15 12:23, Kapil Hali wrote:
>> These changes cleans up SMP implementaion for Broadcom's
>> Kona SoC which are required for handling SMP for iProc
>> family of SoCs at a single place for BCM NSP and BCM Kona.
>>
>> Signed-off-by: Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/bcm11351.dtsi |  2 +-
>>  arch/arm/boot/dts/bcm21664.dtsi |  2 +-
>>  arch/arm/mach-bcm/kona_smp.c    | 82 +++++++++++++++++++++++++++--------------
>>  3 files changed, 56 insertions(+), 30 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/bcm11351.dtsi b/arch/arm/boot/dts/bcm11351.dtsi
>> index 2ddaa51..3dc7a8c 100644
>> --- a/arch/arm/boot/dts/bcm11351.dtsi
>> +++ b/arch/arm/boot/dts/bcm11351.dtsi
>> @@ -31,7 +31,6 @@
>>  		#address-cells = <1>;
>>  		#size-cells = <0>;
>>  		enable-method = "brcm,bcm11351-cpu-method";
>> -		secondary-boot-reg = <0x3500417c>;
> 
> I would expect the 'enable-method' to be moved as well to be consistent
> with what you are adding for NSP later on.
> 
Right, it is updated in the new patch set.
>>  
>>  		cpu0: cpu@0 {
>>  			device_type = "cpu";
>> @@ -42,6 +41,7 @@
>>  		cpu1: cpu@1 {
>>  			device_type = "cpu";
>>  			compatible = "arm,cortex-a9";
>> +			secondary-boot-reg = <0x3500417c>;
>>  			reg = <1>;
>>  		};
Thanks,
Kapil
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
