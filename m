From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 1/2] regulator: DT: Add support to scale ramp delay based
 on platform behavior
Date: Wed, 16 Mar 2016 17:00:49 +0530
Message-ID: <56E943E9.5020503@nvidia.com>
References: <1456756829-2277-1-git-send-email-ldewangan@nvidia.com> <20160229174751.GQ21240@tuxbot> <20160301022326.GC18327@sirena.org.uk> <56D5111E.6090606@nvidia.com> <20160302033833.GV18327@sirena.org.uk> <56D65F7E.3090907@nvidia.com> <20160302043506.GC18327@sirena.org.uk> <56E81103.8010903@nvidia.com> <20160315144822.GP2566@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160315144822.GP2566@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, lgirdwood@gmail.com, bjorn.andersson@sonymobile.com, swarren@wwwdotorg.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Gandhar Dighe <gdighe@nvidia.com>, Stuart Yates <syates@nvidia.com>
List-Id: devicetree@vger.kernel.org


On Tuesday 15 March 2016 08:18 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Tue, Mar 15, 2016 at 07:11:23PM +0530, Laxman Dewangan wrote:
>
>> So here we will need two parameters:
>> advertised-ramp-delay for PMIC configurations and
>> ramp-delay which is measured one.
>> Most of time, advertised-ramp-delay is same as ramp-delay and hence =
one
>> value from DT will be sufficient.
>> If there is difference then both value can be provided and
>> advertised-ramp-delay  will be used for PMIC configuration and rest =
of
>> calculation about delay will be from ramp-delay.
> This sounds more like the difference between typical and maximum spec
> values than anything else, we are looking for maxima in Linux.
>

Maxim datasheet does not say about the typical/maximum. It has only one=
=20
value and that is typical.
However, it has note on the advertised values as:

Note 20.
During a soft-start event or a DVS transition, the regulators output=20
current will increase by COUT*dV/dt. In the event that the load current=
=20
plus the additional current imposed by the soft-start or DVS transition=
,=20
reach the regulator=C2=92s current limit, the current limit will be enf=
orced.=20
When the current limit is enforced, the advertised transition rate=20
(dV/dt) will not occur.
