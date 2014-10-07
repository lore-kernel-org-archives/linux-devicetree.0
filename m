From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/2] arm: shmobile: lager: enable HS-USB
Date: Tue, 7 Oct 2014 09:20:20 +0900
Message-ID: <543331C4.90608@renesas.com>
References: <1412237073-1288-1-git-send-email-yoshihiro.shimoda.uh@renesas.com> <1412237073-1288-3-git-send-email-yoshihiro.shimoda.uh@renesas.com> <54330BC4.2050501@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54330BC4.2050501-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, "horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org" <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, "magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello.

(2014/10/07 6:38), Sergei Shtylyov wrote:
> Hello.
> 
> On 10/02/2014 12:04 PM, Yoshihiro Shimoda wrote:
> 
>> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/r8a7790-lager.dts |    5 +++++
>>   1 file changed, 5 insertions(+)
> 
>> diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
>> index 1698591..4badd0a 100644
>> --- a/arch/arm/boot/dts/r8a7790-lager.dts
>> +++ b/arch/arm/boot/dts/r8a7790-lager.dts
>> @@ -445,3 +445,8 @@
>>   		};
>>   	};
>>   };
>> +
>> +&hsusb {
>> +	status = "okay";
>> +	renesas,enable-gpio = <&gpio5 18 GPIO_ACTIVE_LOW>;
>> +};
> 
>     Darn, this also misses the PinMux props... I was going to post v2 of these 
> patches but now would need to add that and retest... :-/

I'm sorry for the my delayed work... I will submit v2 patches today.

By the way, I cannot understand that "this also misses the PinMux props".
According to the original "legacy" code in board-lager.c, it uses gpio5 18:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=36be7686caa05334ca8d52df157b373a41d8d9f1

Best regards,
Yoshihiro Shimoda

> WBR, Sergei
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
