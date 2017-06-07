From: Patrice CHOTARD <patrice.chotard-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH 0/3] Add stm32h743i-disco board
Date: Wed, 7 Jun 2017 07:16:05 +0000
Message-ID: <a9ad0792-8900-638e-e53e-4a7708c30ad2@st.com>
References: <1496765613-697-1-git-send-email-patrice.chotard@st.com>
 <f8d09cbf-8535-5906-28ee-6d9774a49c44@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f8d09cbf-8535-5906-28ee-6d9774a49c44-qxv4g6HH51o@public.gmane.org>
Content-Language: en-US
Content-ID: <B449735DFA1034468A9C0522B89E8F4B-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org" <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Alex

On 06/07/2017 09:04 AM, Alexandre Torgue wrote:
> Hi Patrice
> 
> On 06/06/2017 06:13 PM, patrice.chotard-qxv4g6HH51o@public.gmane.org wrote:
>> From: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>
>>
>> This series adds basic support for the stm32h743i discovery board
>> based on stm32h7 MCU.
>>
>> Patrice Chotard (3):
>>   ARM: dts: stm32h743: Add usart2_pins
>>   ARM: dts: stm32h743: Add usart2 support
>>   ARM: dts: stm32h743: Add stm32h743i-disco board
>>
>>  arch/arm/boot/dts/Makefile               |  3 +-
>>  arch/arm/boot/dts/stm32h743-pinctrl.dtsi | 13 ++++++
>>  arch/arm/boot/dts/stm32h743.dtsi         |  8 ++++
>>  arch/arm/boot/dts/stm32h743i-disco.dts   | 74 
>> ++++++++++++++++++++++++++++++++
>>  4 files changed, 97 insertions(+), 1 deletion(-)
>>  create mode 100644 arch/arm/boot/dts/stm32h743i-disco.dts
>>
> 
> Series looks fine for me, but can you change commit header please. For 
> example: ARM: dts: stm32: Add usart2_pins on stm32h743.
> 
> Soon it will be done, I will apply it for next pull request.

Sure, the v2 is on the way

Patrice

> 
> Regards
> Alex--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
