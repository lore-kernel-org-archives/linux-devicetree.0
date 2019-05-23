From: Angus Ainslie <angus@akkea.ca>
Subject: Re: [PATCH v13 2/4] arm64: dts: fsl: librem5: Add a device tree for  the Librem5 devkit
Date: Thu, 23 May 2019 14:52:56 -0700
Message-ID: <9626cd324eaaab2b49c37cf3c824aa5e@www.akkea.ca>
References: <20190520142330.3556-1-angus@akkea.ca>
 <20190520142330.3556-3-angus@akkea.ca>
 <20190523191922.GA3803@xo-6d-61-c0.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190523191922.GA3803@xo-6d-61-c0.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: angus.ainslie@puri.sm, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kernel-owner@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Pavel,


On 2019-05-23 12:19, Pavel Machek wrote:
> Hi!
> 
>> This is for the development kit board for the Librem 5. The current 
>> level
>> of support yields a working console and is able to boot userspace from
>> the network or eMMC.
>> 
>> Additional subsystems that are active :
> 
>> - haptic motor
> 
> Haptic motor is not a LED. It should be controlled by input subsystem.
> 
>> +	pwmleds {
>> +		compatible = "pwm-leds";
>> +
>> +		haptic {
>> +			label = "librem5::haptic";
>> +			pwms = <&pwm2 0 200000>;
>> +			active-low;
>> +			max-brightness = <255>;
>> +			power-supply = <&reg_3v3_p>;
>> +		};
>> +	};
> 
> You can take a look at N900, that has reasonable interface.
> 

I wanted to control the haptic with the pwm-vibra driver but 
"fsl,imx27-pwm" doesn't seem to respect the PWM_POLARITY_INVERTED flag 
so when I start the system the vibrator is full on.

I could use gpio-vibrator but that seemed like a waste when the device 
is connected to pwm.

I figured the using the pwm-leds interface was a reasonable compromise 
until I had an opportunity to make changes the the imx27-pwm driver.

Thanks
Angus


> Thanks,
> 										Pavel
