From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [PATCH v2 2/2] leds: Add control of the voltage/current regulator
 to the LED core
Date: Wed, 17 Jul 2019 15:47:16 +0200
Message-ID: <9497174a-65b9-bd4f-8ce3-89176930a78c@ti.com>
References: <20190715155657.22976-1-jjhiblot@ti.com>
 <20190715155657.22976-3-jjhiblot@ti.com>
 <20190716105032.thpcttko5do3u56n@holly.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190716105032.thpcttko5do3u56n@holly.lan>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com, dmurphy@ti.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On 16/07/2019 12:50, Daniel Thompson wrote:
> On Mon, Jul 15, 2019 at 05:56:57PM +0200, Jean-Jacques Hiblot wrote:
>> A LED is usually powered by a voltage/current regulator. Let the LED core
> This is almost certainly nitpicking but since there's enough other
> review comments that you will have to respin anyway ;-)
No problems. comments are welcome.
> Is an LED really "usually powered by a voltage/current regulator"? Some
> LEDs have a software controlled power supply but I'm not sure it is
> the usual case.
True. I'll reword this.
> Likewise its a little confusing to be talking about LEDs with an
> external current regulator since, although that is possible, it is also
> one the main features provided by LED driver chips.

In my experience LED drivers are quite often current sinks. In that case 
the power is provided externally, and sometimes by a managed regulator.

Thanks,

JJ

>
> Daniel.
