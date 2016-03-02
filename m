From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 1/2] regulator: DT: Add support to scale ramp delay based
 on platform behavior
Date: Wed, 2 Mar 2016 11:42:35 +0530
Message-ID: <56D68453.4070401@nvidia.com>
References: <1456756829-2277-1-git-send-email-ldewangan@nvidia.com> <20160229174751.GQ21240@tuxbot> <20160301022326.GC18327@sirena.org.uk> <56D5111E.6090606@nvidia.com> <20160302033833.GV18327@sirena.org.uk> <56D65F7E.3090907@nvidia.com> <20160302043506.GC18327@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160302043506.GC18327@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, lgirdwood@gmail.com, bjorn.andersson@sonymobile.com, swarren@wwwdotorg.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Wednesday 02 March 2016 10:05 AM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Wed, Mar 02, 2016 at 09:05:26AM +0530, Laxman Dewangan wrote:
>> On Wednesday 02 March 2016 09:08 AM, Mark Brown wrote:
>>> You're not trying to scale the value here, you're trying to replace the
>>> value because the PMIC is incapable of delivering the advertised ramp
>>> rate.  Trying to express this as a multiple of the advertised ramp rate
>>> is just adding complexity.
>> So should we provide absolute ramp value here for platform specific?
> Yes, otherwise if the PMIC vendor respecifies their ramp rates to
> reflect reality and the driver is updated then your DT will be broken.

Then can we have other member for pmic ramp time register configuration 
via DT.
So measured value on platform will be existing ramp-delay and the value 
which will be configured in PMIC will be via pmic-ramp-delay if provided 
otherwise use ramp-delay.
