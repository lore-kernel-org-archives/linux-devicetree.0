From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 1/2] regulator: DT: Add support to scale ramp delay based
 on platform behavior
Date: Wed, 2 Mar 2016 09:05:26 +0530
Message-ID: <56D65F7E.3090907@nvidia.com>
References: <1456756829-2277-1-git-send-email-ldewangan@nvidia.com> <20160229174751.GQ21240@tuxbot> <20160301022326.GC18327@sirena.org.uk> <56D5111E.6090606@nvidia.com> <20160302033833.GV18327@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160302033833.GV18327@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, lgirdwood@gmail.com, bjorn.andersson@sonymobile.com, swarren@wwwdotorg.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Wednesday 02 March 2016 09:08 AM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Tue, Mar 01, 2016 at 09:18:46AM +0530, Laxman Dewangan wrote:
>
>> HW team characterize the board and its rail and come up with the following
>> data:
>> - Configure PMIC to 27mV/us for ramp time.
>> - With this measured value of ramp on board is 10mV/us and it is safe to
>> assume 5mv/us to consider the board variations.
>> So we have now two input from HW team:
>> 1. What should be configure in PMIC.
>> 2. And for calculation, how much ramp need to be consider.
>> For (1), it is 25mV/us and for (2) which 540% (27 *100/5).
>> Currently, we can provide the 27mv/us as ramp-delay but do not have option
>> for scaling it.
> You're not trying to scale the value here, you're trying to replace the
> value because the PMIC is incapable of delivering the advertised ramp
> rate.  Trying to express this as a multiple of the advertised ramp rate
> is just adding complexity.
>
So should we provide absolute ramp value here for platform specific?
Or any other suggestion to handle this situation as this is very common 
and almost all our boards have this slowness on ramp.
