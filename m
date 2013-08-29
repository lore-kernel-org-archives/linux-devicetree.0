From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 1/2] ARM: Dove: Add the audio devices in DT
Date: Thu, 29 Aug 2013 19:34:32 +0100
Message-ID: <20130829183432.GT6617@n2100.arm.linux.org.uk>
References: <20130828113459.48ecbb34@armhf> <521DCD33.2070008@gmail.com> <20130828121943.1c8327ca@skate> <521DD057.4040208@gmail.com> <20130829161217.GK10783@sirena.org.uk> <20130829163358.GS6617@n2100.arm.linux.org.uk> <20130829171210.GM10783@sirena.org.uk> <521F8CB3.5060407@gmail.com> <20130829182010.GQ10783@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130829182010.GQ10783@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Mark Rutland <mark.rutland@arm.com>, Jean-Francois Moine <moinejf@free.fr>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, devicetree@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Ian Campbell <ian.campbell@citrix.com>, liam.r.girdwood@intel.com
List-Id: devicetree@vger.kernel.org

On Thu, Aug 29, 2013 at 07:20:11PM +0100, Mark Brown wrote:
> On Thu, Aug 29, 2013 at 08:02:27PM +0200, Sebastian Hesselbarth wrote:
> > 
> > it is referring the same differences Russell already mentioned. But I
> > already came to the conclusion, that we don't need the information in
> > the binding. For example, if you use that controller on Dove and you
> > hook it up for SPDIF-in (which it hasn't), than I consider this a
> > DT bug. No need to double-check that in the driver. From that p-o-v,
> > please just let the current binding as is.
> 
> OK, great - none of these devices have any differences which are visible
> only within the controller, they're all extra external interfaces?

Dove Audio 0:
	- I2S in
	- I2S out
	- No SPDIF

Dove Audio 1:
	- I2S in
	- I2S out
	- SPDIF out only

Both these variants occur on the same SoC.

Kirkwood:
	- I2S in
	- SPDIF in
	- I2S out
	- SPDIF out

Preconditions:
1. Only one input can be used at any one time.
2. One output can be used or both if enabled simultaneously.
