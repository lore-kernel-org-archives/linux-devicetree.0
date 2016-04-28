From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V5 1/6] SLIMbus: Device management on SLIMbus
Date: Thu, 28 Apr 2016 18:49:23 +0200
Message-ID: <2745420.JjpjMPLp2B@wuerfel>
References: <1461801489-16254-1-git-send-email-sdharia@codeaurora.org> <5047442.UXEhPc2Isi@wuerfel> <20160428163919.GP3217@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20160428163919.GP3217@sirena.org.uk>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Sagar Dharia <sdharia@codeaurora.org>, gregkh@linuxfoundation.org, bp@suse.de, poeschel@lemonage.de, treding@nvidia.com, gong.chen@linux.intel.com, andreas.noever@gmail.com, alan@linux.intel.com, mathieu.poirier@linaro.org, daniel@ffwll.ch, jkosina@suse.cz, sharon.dvir1@mail.huji.ac.il, joe@perches.com, davem@davemloft.net, james.hogan@imgtec.com, michael.opdenacker@free-electrons.com, daniel.thompson@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kheitke@audience.com, mlocke@codeaurora.org, agross@codeaurora.org, sheetal.tigadoli@gmail.com, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thursday 28 April 2016 17:39:20 Mark Brown wrote:
> > I don't think we have merge new platform support on any
> > architecture that would need this in the past years and
> > stuff like spi_board_info and i2c_board_info is only really
> > used on really old machines (but not going away any time soon
> > either).
> 
> It's not just platforms that use these things though - there's things
> like the SolarFlare NICs where the firmware update mechanism essentially
> involves exposing a SPI flash as part of a PCI device and we just merged
> an ASoC driver for a video card which was reusing some existing IPs and
> chips.
> 

That's of course fine: you essentially have a discoverable bus there,
and if we need something like that, we can always add it later to
any subsystem.

In contrast, the interface in the proposed slimbus subsystem seems
designed for board files, and is in the best case just dead code
that can be removed, or has a risk of being misused e.g. if some
device manufacturer decides to use a board file for this instead
of describing the slimbus slaves in DT.

	Arnd
