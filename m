From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 0/4] MIPS: ath79: Add USB support on the TL-WR1043ND
Date: Tue, 29 Sep 2015 16:40:42 +0530
Message-ID: <560A71B2.8050606@ti.com>
References: <1441120994-31476-1-git-send-email-albeu@free.fr>
 <3589971.cbF7muh57v@wuerfel> <20150909161459.30cf580f@avionic-0020>
 <1734684.IINudhV2s6@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1734684.IINudhV2s6@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Alban <albeu-GANU6spQydw@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Wednesday 09 September 2015 07:51 PM, Arnd Bergmann wrote:
> On Wednesday 09 September 2015 16:14:59 Alban wrote:
>> On Mon, 07 Sep 2015 15:20:42 +0200
>> Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>>
>>> On Tuesday 01 September 2015 17:23:10 Alban Bedel wrote:
>>>>
>>>> this serie add a driver for the USB phy on the ATH79 SoCs and enable the
>>>> USB port on the TL-WR1043ND. The phy controller is really trivial as it
>>>> only use reset lines.
>>>>
>>>
>>> Is this a common thing to have? If other PHY devices are like this, we
>>> could instead add a simple generic PHY driver that just asserts all
>>> its reset lines in the order as provided, rather than making this a
>>> hardware specific driver that ends up getting copied several times.
>>
>> I don't know how common it is. However I agree that a simple driver that
>> can start a clock and toggle a few GPIO and/or reset would make sense.
>>
>> However in the case of the ATH79 SoC some models have a reset line that
>> is misused to force the PHY in sleep mode. Sadly this extra reset must
>> be asserted for the PHY to work, so it wouldn't fit in such a generic
>> design.
>>
>> Still we could have such a generic driver and let the ATH79 driver
>> build on top of it. Honestly that's what I wanted to do, but getting
>> generic drivers with DT support accepted is not easy. That's why I went
>> with this driver, it is technically inferior but much easier to get
>> considered for merging.
> 
> Ok, fair enough. If we end up doing a more generic driver for this,
> we can still consider adding the compatible string there, potentially
> with some workaround for the sleep mode.

hmm, makes sense to have a generic PHY driver for PHY's which doesn't
have PHY registers to be programmed like a PHY driver which enables only
clocks, regulators, drives gpios etc.

Cheers
Kishon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
