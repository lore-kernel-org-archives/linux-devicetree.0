From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 4/5] regulator: pwm: Add support for voltage linear equal
 steps
Date: Tue, 15 Mar 2016 12:14:50 +0530
Message-ID: <56E7AF62.7000908@nvidia.com>
References: <1457434405-30372-1-git-send-email-ldewangan@nvidia.com> <1457434405-30372-5-git-send-email-ldewangan@nvidia.com> <20160312060925.GW3898@sirena.org.uk> <56E565BE.5010703@nvidia.com> <20160314162843.GC2566@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160314162843.GC2566@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, lgirdwood@gmail.com, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Monday 14 March 2016 09:58 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Sun, Mar 13, 2016 at 06:36:06PM +0530, Laxman Dewangan wrote:
>> On Saturday 12 March 2016 11:39 AM, Mark Brown wrote:
>>> I can't see any reason why this would ever be preferable to just using
>>> the flat linear range (you certainly haven't articulated one, you're
>>> just stating it).  This seems like you are bodging around a limited
>>> consumer driver, you should fix the consumer to cope with regulators
>>> with lots of voltages - PWM regulators aren't the only ones with high
>>> resolution steps.
>> The requirement is to have perfect linear steps interms of the period/pulse
>> time of PWM without loosing any voltage.
>> Continuous mode is pretty much near to what you said but here we are loosing
>> the perfect step as this divides the periods to 100 parts and then set
>> voltage.
> Could you be more specific about what the issue is?  We've hopefully got
> errors of less than 1% in the values here...
>
If I use the continuous mode of PWM regulator then the calculation for 
PWM pulse ON time(duty_pulse)
done as:
         duty_cycle = ((requested - minimum) * 100) / voltage_range.

         duty_pulse = (pwm_period/100) * duty_cycle

This leads to the calculation error if we have the requested voltage 
where accurate pulse time is possible. For example: Let's have following 
case
         voltage range is 800000uV to 1350000uV.
         pwm-period = 1550ns (1ns time is 1mV).
         Requested 900000uV.

         duty_cycle = ((900000uV - 800000uV) * 100)/ 1550000
                    = 6.45 but we will get 6 due to integer division.

         duty_pulse = (1550/100) * 6 = 90 pulse time.

     90 pulse time is equivalent to 90mV and this gives us pulse time 
equivalent
     to 890000uV instead of 900000uV.


>> If new mode is not accpetable then need to enhance the existing continuous
>> mode like before scaling for 100% of period, first look if we get the
>> perfect pulse time of of PWM period and if it is there then use this direct
>> instead of converting required voltage to 100% scale and then back
>> calculating duty time.
> That seems a lot better,

You mean using the continuous mode only.

If I add following logic then also it resolve the issue:
if (((req_uV - min_uV) * pwm_period) % voltage_range == 0)
     duty_pulse =  ((req_uV - min_uV) * pwm_period) / voltage_range;
else
     existing_continuous mode calculation.

So on above example:
     duty_pulse  = ((900000uV - 800000uV) * 1550)/1550000)
                        = 100

and this is equivalent to 100mV and so final voltage is
     (800000 + 100000) = 900000uV which is same as requested,
