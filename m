From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 5/6] ARM: DTS: da850-evm: Add node for tlv320aic3106 codec
Date: Fri, 01 Aug 2014 16:49:46 +0400
Message-ID: <53DB8CEA.9010902@cogentembedded.com>
References: <1406801934-23334-1-git-send-email-peter.ujfalusi@ti.com> <1406801934-23334-6-git-send-email-peter.ujfalusi@ti.com> <53DA519A.4090905@cogentembedded.com> <53DB240F.2030908@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53DB240F.2030908-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, nsekhar-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, khilman-1D3HCaltpLuhEniVeURVKkEOCMrvLtNR@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 01-08-2014 9:22, Peter Ujfalusi wrote:

>>> The board uses aic3106 for audio.

>>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
>>> ---
>>>    arch/arm/boot/dts/da850-evm.dts | 14 ++++++++++++++
>>>    1 file changed, 14 insertions(+)

>>> diff --git a/arch/arm/boot/dts/da850-evm.dts b/arch/arm/boot/dts/da850-evm.dts
>>> index 09118c72e83f..b9ef2be0b145 100644
>>> --- a/arch/arm/boot/dts/da850-evm.dts
>>> +++ b/arch/arm/boot/dts/da850-evm.dts
>>> @@ -51,6 +51,20 @@
>>>                tps: tps@48 {
>>>                    reg = <0x48>;
>>>                };
>>> +            tlv320aic3106: tlv320aic3106@1b {

[...]

>> Also, the ePAPR standard [1] says:

>> The name of a node should be somewhat generic, reflecting the function of the
>> device and not its precise programming model.

> True. This is why the node for the audio support is named as 'sound'. For the
> components, like in this case I do not see issue to call the audio codec with
> it's name.

    I do. We should follow the standard consistently. Why not call the node 
"sound-codec"?

WBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
