From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/1] ARM: at91/dt: sam9x5: Add CAN device nodes
Date: Tue, 7 Oct 2014 09:54:05 +0200
Message-ID: <54339C1D.5000501@atmel.com>
References: <1412605640-29472-1-git-send-email-alexander.stein@systec-electronic.com> <5432B637.1060200@atmel.com> <1553953.Bxvx42RTxh@ws-stein>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1553953.Bxvx42RTxh@ws-stein>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>
Cc: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/10/2014 17:57, Alexander Stein :
> Hi Jean,

s/Jean/Nicolas/

;-)

> On Monday 06 October 2014 17:33:11, Nicolas Ferre wrote:
>> On 06/10/2014 16:27, Alexander Stein :
>>> Add the missing CAN devices node including their pin muxing and clocks.
>>>
>>> Signed-off-by: Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>
>>> Acked-by: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>>> ---
>>> Changes in v3:
>>> * Match the pin name to the ones in the datasheet.
>>>
>>>  arch/arm/boot/dts/at91sam9x5.dtsi | 48 +++++++++++++++++++++++++++++++++++++++
>>
>> Alexander,
>>
>> In fact, we already have a placeholder for these nodes:
>> arch/arm/boot/dts/at91sam9x5_can.dtsi
>>
>> The file is only included in SoC device trees which actually contain
>> this peripheral: at91sam9x25 and at91sam9x35 (and not the other variants
>> of this family).
> 
> Actually, I can't find anyone including this :-/ If they would I guess I should have hit an error for duplicated labels.
> Is this a mistake no-one includes at91sam9x5_can.dtsi?

Yes it is. It should be included in
arch/arm/boot/dts/at91sam9x[23]5.dtsi files.

>> So, can you please move this addition above into the
>> arch/arm/boot/dts/at91sam9x5_can.dtsi file?
> 
> Can you confirm that both (at91sam9x25 and at91sam9x35) have identical peripheral addresses, irq and pinmuxing?

Absolutely, the same.

Thanks, bye.
-- 
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
