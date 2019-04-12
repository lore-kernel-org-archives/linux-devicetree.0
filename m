From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH V5 3/3] hwmon: pwm-fan: Add RPM support via external
 interrupt
Date: Fri, 12 Apr 2019 06:47:21 -0700
Message-ID: <b0930582-7528-bda9-214b-c6df8619c1a4@roeck-us.net>
References: <1554989411-23666-1-git-send-email-stefan.wahren@i2se.com>
 <1554989411-23666-4-git-send-email-stefan.wahren@i2se.com>
 <24771fbe-0c45-78b0-e96b-6ed31ccdcb7f@metux.net>
 <518757ac-b0d7-298c-c896-4bd7e3b2ac5b@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <518757ac-b0d7-298c-c896-4bd7e3b2ac5b@i2se.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>, "Enrico Weigelt, metux IT consult" <lkml@metux.net>, Kamil Debski <kamil@wypas.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Robin Murphy <robin.murphy@arm.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 4/12/19 6:35 AM, Stefan Wahren wrote:
> Hi Enrico,
> 
> On 12.04.19 15:15, Enrico Weigelt, metux IT consult wrote:
>> On 11.04.19 15:30, Stefan Wahren wrote:
>>> This adds RPM support to the pwm-fan driver in order to use with
>>> fancontrol/pwmconfig. This feature is intended for fans with a tachometer
>>> output signal, which generate a defined number of pulses per revolution.
>> Wouldn't it be better to have a CONFIG_* flag for keeping the kernel
>> image size smaller when this feature isn't needed ?
> 
> i compared the kernel module size in linux-next for ARM without and with
> this patch:
> without patch: 12088 bytes
> with patch: 14292 bytes
> 
> I don't think it is worth the trouble.
> 

Agreed. This would end up being a mess, with lots of configuration options
in various drivers. Please don't start it.

Guenter
