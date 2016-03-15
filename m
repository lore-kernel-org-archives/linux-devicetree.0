From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 1/2] regulator: DT: Add support to scale ramp delay based
 on platform behavior
Date: Tue, 15 Mar 2016 19:11:23 +0530
Message-ID: <56E81103.8010903@nvidia.com>
References: <1456756829-2277-1-git-send-email-ldewangan@nvidia.com> <20160229174751.GQ21240@tuxbot> <20160301022326.GC18327@sirena.org.uk> <56D5111E.6090606@nvidia.com> <20160302033833.GV18327@sirena.org.uk> <56D65F7E.3090907@nvidia.com> <20160302043506.GC18327@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160302043506.GC18327@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, lgirdwood@gmail.com, bjorn.andersson@sonymobile.com, swarren@wwwdotorg.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Gandhar Dighe <gdighe@nvidia.com>, Stuart Yates <syates@nvidia.com>
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
>
>> Or any other suggestion to handle this situation as this is very common and
>> almost all our boards have this slowness on ramp.
> Perhaps time to have a chat with your PMIC vendors...
>

I had discussion with our HW team to get more information about this 
variation.
They said that Maxim advertise the ramp time with given condition in 
interface i.e. capacitance etc which is very generic.
We did the experiment with Maxim recommendation about the rail and its 
capacitance (2.2uF) and found that measured value is same as what they 
advertise in datasheet.

When chip team use this PMIC with Tegra hardware specs and did the 
circuit simulation to ensures how our boards should be designed for 
signal integrity they suggested that the rail capacitance should be more 
than what Maxim recommending in general to work with our silicon. So 
here condition get changed and hence the effective ramp time.

So here we will need two parameters:
advertised-ramp-delay for PMIC configurations and
ramp-delay which is measured one.

Most of time, advertised-ramp-delay is same as ramp-delay and hence one 
value from DT will be sufficient.
If there is difference then both value can be provided and 
advertised-ramp-delay  will be used for PMIC configuration and rest of 
calculation about delay will be from ramp-delay.
