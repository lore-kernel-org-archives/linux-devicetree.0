From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 4/5] regulator: pwm: Add support for voltage linear equal
 steps
Date: Sun, 13 Mar 2016 18:36:06 +0530
Message-ID: <56E565BE.5010703@nvidia.com>
References: <1457434405-30372-1-git-send-email-ldewangan@nvidia.com> <1457434405-30372-5-git-send-email-ldewangan@nvidia.com> <20160312060925.GW3898@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160312060925.GW3898@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, lgirdwood@gmail.com, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Saturday 12 March 2016 11:39 AM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Tue, Mar 08, 2016 at 04:23:24PM +0530, Laxman Dewangan wrote:
>
>> There is a use cases where entire voltage ranges from minimum
>> to maximum is divided into n equal steps and just providing the
>> steps count, the voltage table with duty cycles is linearly
>> calculated.
> I can't see any reason why this would ever be preferable to just using
> the flat linear range (you certainly haven't articulated one, you're
> just stating it).  This seems like you are bodging around a limited
> consumer driver, you should fix the consumer to cope with regulators
> with lots of voltages - PWM regulators aren't the only ones with high
> resolution steps.

The requirement is to have perfect linear steps interms of the 
period/pulse time of PWM without loosing any voltage.
Continuous mode is pretty much near to what you said but here we are 
loosing the perfect step as this divides the periods to 100 parts and 
then set voltage.

If new mode is not accpetable then need to enhance the existing 
continuous mode like before scaling for 100% of period, first look if we 
get the perfect pulse time of of PWM period and if it is there then use 
this direct instead of converting required voltage to 100% scale and 
then back calculating duty time.
