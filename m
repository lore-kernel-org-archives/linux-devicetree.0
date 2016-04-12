From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 1/2] regulator: DT: Add support to scale ramp delay based
 on platform behavior
Date: Tue, 12 Apr 2016 18:59:06 +0530
Message-ID: <570CF822.4050002@nvidia.com>
References: <20160331184553.GS2350@sirena.org.uk> <56FD6ED6.3020507@nvidia.com> <20160331185945.GT2350@sirena.org.uk> <56FD7379.2000307@nvidia.com> <20160331192227.GU2350@sirena.org.uk> <56FD7F07.7010404@nvidia.com> <20160331203942.GV2350@sirena.org.uk> <56FE2009.4020302@nvidia.com> <20160401161121.GZ2350@sirena.org.uk> <570370E5.3070901@nvidia.com> <20160412010226.GO3351@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160412010226.GO3351@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <bjorn@kryo.se>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Liam Girdwood <lgirdwood@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Gandhar Dighe <gdighe@nvidia.com>, Stuart Yates <syates@nvidia.com>
List-Id: devicetree@vger.kernel.org


On Tuesday 12 April 2016 06:32 AM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Tue, Apr 05, 2016 at 01:31:41PM +0530, Laxman Dewangan wrote:
>> On Friday 01 April 2016 09:41 PM, Mark Brown wrote:
>> Now there is not really equation that how it control dV/dt with required
>> current vs regulator's current limit current limit.
> I'm having a hard time tying this in with what you're saying.  You're
> saying we have a predictable limit based on some hard maximum inrush
> current but we can't tell what that limit is?  What I'd expect is that
> we'd get the spec limit up to some maximum and then cap out at that.
>
>
I have put my understanding based on datasheet and observation but it 
seems I am missing some important information which is making difficult 
to understand further here.
We are not crossing the maximum limit of the load on the rail per 
datasheet. We just changed the output capacitor in the platforms and saw 
deviation.

I think I need to go again to Vendor to find out that why changing of 
capacitor making the deviation in ramp delay and what is the relation. 
Probably, that may help here.
