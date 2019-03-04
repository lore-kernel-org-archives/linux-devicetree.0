From: Helen Koike <helen.koike@collabora.com>
Subject: Re: rpi-b-rev2 can't detect hdmi display due to wrong hpd gpio pull
 in dts
Date: Mon, 4 Mar 2019 18:54:00 -0300
Message-ID: <b488f43d-2fe3-6e1d-bed0-94ed9d033129@collabora.com>
References: <20190304185454.18043-1-helen.koike@collabora.com>
 <8736o2tmg0.fsf@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8736o2tmg0.fsf@anholt.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Anholt <eric@anholt.net>
Cc: linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stefan.wahren@i2se.com, linus.walleij@linaro.org, lkundrak@v3.sk, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, kernel@collabora.com
List-Id: devicetree@vger.kernel.org



On 3/4/19 5:27 PM, Eric Anholt wrote:
> Helen Koike <helen.koike@collabora.com> writes:
> 
>> Hello,
>>
>> I have a rpi-b-rev2 (two holes, 512M) and when I was trying to test vc4
>> driver, the HDMI wans't being detected.
>>
>> So I changed the hpd-gpios from ACTIVE_LOW to ACTIVE_HIGH and now it
>> works correctly. I can see that modeprint from libdrm detects correctly
>> when the display is plugged and when it is unpluggled.
>>
>> So I was wondering if this is just in my board or if there is an error
>> in the dts (which I think it's unlikely).
>>
>> In any case I am dropping this email here in case anyone else see this
>> problem, if you do, try appliying the patch below.
> 
> We even have the GPIO labeled as "HDMI_HPD_P" above, and dt-blob.dts
> agrees.

You are right, I didn't notice it.

> 
> Reviewed-by: Eric Anholt <eric@anholt.net>
> Thanks!  If Stefan doesn't pick this up shortly, I can.
> 

Thanks for reviewing!

Helen
