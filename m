From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v5] hwmon: Driver for TI TMP103 temperature sensor
Date: Tue, 17 Jun 2014 23:41:41 -0700
Message-ID: <53A134A5.9020308@roeck-us.net>
References: <1403069837-15651-1-git-send-email-hs@denx.de> <53A127BB.7090802@gmail.com> <53A12DBB.50704@roeck-us.net> <53A12F37.8020206@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53A12F37.8020206@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Varka Bhadram <varkabhadram@gmail.com>, Heiko Schocher <hs@denx.de>, lm-sensors@lm-sensors.org
Cc: Jean Delvare <khali@linux-fr.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On 06/17/2014 11:18 PM, Varka Bhadram wrote:

>>>>   ti,tmp102        Low Power Digital Temperature Sensor with SMBUS/Two Wire Serial Interface
>>>> +ti,tmp103        Low Power Digital Temperature Sensor with SMBUS/Two Wire Serial Interface
> May i know about this binding compatible property ?

At some point someone will have to document how trivial i2c device mappings
work in detail. Every other time another trivial i2c device is added
to this file, the same argument starts all over again.

An attempt to document the trivial i2c device mappings implementation
was rejected with the argument that it would be implementation (Linux)
specific. The proposed patch [1] may however help understanding how
it works.

Hope that helps,
Guenter

---

[1] http://patchwork.ozlabs.org/patch/301938/
