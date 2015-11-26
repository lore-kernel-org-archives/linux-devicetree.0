From: Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: Re: [PATCH 12/14] DEVICETREE: Add bindings for PIC32 SDHC host
 controller
Date: Wed, 25 Nov 2015 22:16:32 -0700
Message-ID: <565695B0.8090704@microchip.com>
References: <1448065205-15762-1-git-send-email-joshua.henderson@microchip.com>
 <1448065205-15762-13-git-send-email-joshua.henderson@microchip.com>
 <20151122215737.GA5285@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151122215737.GA5285@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Andrei Pistirica <andrei.pistirica-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 11/22/2015 2:57 PM, Rob Herring wrote:
> On Fri, Nov 20, 2015 at 05:17:24PM -0700, Joshua Henderson wrote:
>> From: Andrei Pistirica <andrei.pistirica-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
>>
>> Document the devicetree bindings for the SDHC peripheral found on
>> Microchip PIC32 class devices.
>>
>> Signed-off-by: Andrei Pistirica <andrei.pistirica-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
>> Signed-off-by: Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
>> ---
>>  .../devicetree/bindings/mmc/sdhci-pic32.txt        |   24 ++++++++++++++++++++
>>  1 file changed, 24 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mmc/sdhci-pic32.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-pic32.txt b/Documentation/devicetree/bindings/mmc/sdhci-pic32.txt
>> new file mode 100644
>> index 0000000..f16388c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mmc/sdhci-pic32.txt
>> @@ -0,0 +1,24 @@
>> +* Microchip PIC32 SDHCI Controller
>> +
>> +This file documents differences between the core properties in mmc.txt
>> +and the properties used by the sdhci-pic32 driver.
>> +
>> +Required properties:
>> +- compatible: Should be "microchip,pic32-sdhci"
>> +- reg: Should contain registers location and length
>> +- interrupts: Should contain interrupt
>> +- pinctrl: Should contain pinctrl for data and command lines
>> +
>> +Optional properties:
>> +- no-1-8-v: 1.8V voltage selection not supported
> 
> There's a standard property for this one.
> 

Correct.  This is indeed a standard property that should not be here.  There is currently discussion to avoid using this property anyway.

>> +- piomode: disable DMA support
> 
> Proably this one too IIRC.
> 

We will be dropping this.  There are other ways to accomplish the same thing outside of DT.

Josh


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
