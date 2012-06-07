From: ludovic.desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: at91: at91 based machines specify their own
 irq handler at run time
Date: Thu, 7 Jun 2012 09:25:03 +0200
Message-ID: <4FD0574F.6000200@atmel.com>
References: <1338907664-24646-1-git-send-email-ludovic.desroches@atmel.com>
 <1338907664-24646-2-git-send-email-ludovic.desroches@atmel.com>
 <20120606094748.GA26504@taskit.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120606094748.GA26504-7uXufW8GZECzQB+pC5nmwQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Christian Glindkamp <christian.glindkamp-7uXufW8GZECzQB+pC5nmwQ@public.gmane.org>
Cc: will.deacon-5wv7dgnIgG8@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Christian,

On 06/06/2012 11:47 AM, Christian Glindkamp wrote:
> On 2012-06-05 16:47, ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org wrote:
>> From: Ludovic Desroches<ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>>
>> SOC_AT91SAM9 selects MULTI_IRQ_HANDLER in order to let machines specify their
>> own IRQ handler at run time.
>>
>> Signed-off-by: Ludovic Desroches<ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>> ---
>>   arch/arm/mach-at91/board-cpu9krea.c           |    1 +
>>   arch/arm/mach-at91/board-sam9g20ek.c          |    1 +
>>   arch/arm/mach-at91/board-sam9261ek.c          |    1 +
>>   arch/arm/mach-at91/board-stamp9g20.c          |    1 +
>>   arch/arm/mach-at91/board-usb-a926x.c          |    1 +
>
> At least these board files contain more than one MACHINE_START, but
> you only update the last one. Same for the third patch.

Thanks for your feedback, I'll correct it in V2.

>
> I have not looked at the rest of the patch.
>
>

Regards

Ludovic
