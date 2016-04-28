From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V5 1/6] SLIMbus: Device management on SLIMbus
Date: Thu, 28 Apr 2016 14:33:41 +0200
Message-ID: <7478716.z4vdp0mVTA@wuerfel>
References: <1461801489-16254-1-git-send-email-sdharia@codeaurora.org> <2692115.H6acsZmTjn@wuerfel> <20160428115337.GN3217@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160428115337.GN3217@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Sagar Dharia <sdharia@codeaurora.org>, gregkh@linuxfoundation.org, bp@suse.de, poeschel@lemonage.de, treding@nvidia.com, gong.chen@linux.intel.com, andreas.noever@gmail.com, alan@linux.intel.com, mathieu.poirier@linaro.org, daniel@ffwll.ch, jkosina@suse.cz, sharon.dvir1@mail.huji.ac.il, joe@perches.com, davem@davemloft.net, james.hogan@imgtec.com, michael.opdenacker@free-electrons.com, daniel.thompson@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kheitke@audience.com, mlocke@codeaurora.org, agross@codeaurora.org, sheetal.tigadoli@gmail.com, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thursday 28 April 2016 12:53:37 Mark Brown wrote:
> On Thu, Apr 28, 2016 at 12:00:26PM +0200, Arnd Bergmann wrote:
> > On Wednesday 27 April 2016 17:58:04 Sagar Dharia wrote:
> 
> > > +int slim_add_device(struct slim_controller *ctrl, struct slim_device *sbdev)
> 
> > This looks like an artifact of ancient pre-DT times. I'd say kill it off before
> > someone starts using it.
> 
> Not every architecture uses DT, and even on architectures with DT
> support it isn't always the only firmware.  In this specific case it's
> questionable how many people are going to implement Slimbus at this
> point but in general insisting that we go DT only doesn't seem great.
> 

Nothing wrong with adding support for manual board files later if
we have a good reason for it, but at the moment, this seems completely
ARM/ARM64 specific.

I don't foresee mobile phones with ACPI using this subsystem, but even
if we got them, it would be a horrible idea to use hardcoded board
specific tables in a platform file, and we should insist that whatever
firmware is present has a way to describe the slimbus devices.

	Arnd
