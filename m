From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 1/2] regulator: DT: Add support to scale ramp delay based
 on platform behavior
Date: Fri, 1 Apr 2016 01:18:23 +0530
Message-ID: <56FD7F07.7010404@nvidia.com>
References: <20160331165145.GF2350@sirena.org.uk> <56FD5A9F.5050001@nvidia.com> <20160331174741.GO2350@sirena.org.uk> <56FD62BA.3040406@nvidia.com> <20160331183130.GR2350@sirena.org.uk> <56FD6CF7.5080909@nvidia.com> <20160331184553.GS2350@sirena.org.uk> <56FD6ED6.3020507@nvidia.com> <20160331185945.GT2350@sirena.org.uk> <56FD7379.2000307@nvidia.com> <20160331192227.GU2350@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160331192227.GU2350@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <bjorn@kryo.se>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Liam Girdwood <lgirdwood@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Gandhar Dighe <gdighe@nvidia.com>, Stuart Yates <syates@nvidia.com>
List-Id: devicetree@vger.kernel.org


On Friday 01 April 2016 12:52 AM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Fri, Apr 01, 2016 at 12:29:05AM +0530, Laxman Dewangan wrote:
>> On Friday 01 April 2016 12:29 AM, Mark Brown wrote:
>> But here is the stuff without typo ;-)
>> Device supports 5mV/us and 100mV/us which is not in observed value.
> So why doesn't the device end up configuring 100mV/us when asked for
> 50mv/us?  That's reasonably expected - the configured ramp rate is a
> maximum rate given that this is used to limit inrush current.
>
>

We did this to adjust device configuration to nearest higher side but 
this is not working well on some of cases.

On same device, DCDC (SD) rails support 4 ramp configurations, 
13.75mV/us, 27.5mV/us, 55mV/us and 100mV/us.

HW team measured the  ramp time at 7.5mV/us when device configured at 
27.5mV/uS.

So as per above, it will be adjusted to 13.75mV/us (nearest higher side) 
for device configuration but this device need to configure for 27.5mV/us.
