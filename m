From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v3 5/7] mfd: Add Device Tree bindings document for TI
 tps6105x chip
Date: Mon, 3 Apr 2017 11:47:50 -0400
Message-ID: <b1118a87-9b39-bb04-d43e-f8f2b366904b@osg.samsung.com>
References: <20170401071854.23198-1-javier@osg.samsung.com>
 <20170401071854.23198-6-javier@osg.samsung.com>
 <20170403111540.7k3rjucvcxe5cunf@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170403111540.7k3rjucvcxe5cunf@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hello Lee,

On 04/03/2017 07:15 AM, Lee Jones wrote:

[snip]

>> +
>> +The TP61050/TPS61052 is a high-power "white LED driver". This boost converter
>> +is also used for other things than white LEDs, and also contains a GPIO pin.
> 
> What functions does it offer?
>

Same comment than before, I'm not really familiar with this driver. But I'll
look what are the MFD cell instantiated to better understand dev functions
and expand this documentation accordingly.
 
Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
