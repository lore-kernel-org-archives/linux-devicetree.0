From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v3] qcom: ipq40xx: Add basic board/dts support for
 IPQ40XX SoC
Date: Tue, 25 Aug 2015 14:14:05 -0700
Message-ID: <20150825211405.GJ19120@codeaurora.org>
References: <20150824092813.GA15581@codeaurora.org>
 <20150824224928.GE14330@codeaurora.org>
 <20150825081042.GA14028@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150825081042.GA14028@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Varadarajan Narayanan <varada@codeaurora.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-arm-msm@vger.kernel.org, Andy Gross <agross@codeaurora.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Georgi Djakov <gdjakov@mm-sol.com>, Kumar Gala <galak@codeaurora.org>, David Brown <davidb@codeaurora.org>, linux-soc@vger.kernel.org, Lina Iyer <lina.iyer@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 08/25, Varadarajan Narayanan wrote:
> On Mon, Aug 24, 2015 at 03:49:28PM -0700, Stephen Boyd wrote:
> > On 08/24, Varadarajan Narayanan wrote:
> 
> > > +	compatible = "qcom,ipq40xx-r3pc", "qcom,ipq40xx";
> > > +
> > > +	memory {
> > > +		device_type = "memory";
> > > +		reg = <0x80000000 0x20000000>; /* 512MB */
> > > +	};
> >
> > Doesn't the bootloader fill the memory node for us? Why do we
> > need this?
> >
> > > +
> > > +	chosen {
> > > +		bootargs = "root=/dev/ram rw init=/init console=ttyMSM0,115200n8 initrd=0x82000000,0x000E2246";
> > > +	};
> >
> > Please don't add bootargs. Use stdout-path for the console part
> > and everything else should be done by the bootloader or is the
> > defaults.
> 
> Since this is for the emulation platform, we don't have the bootloader.

Why are we upstreaming an emulation platform?

I assume you have some sort of scripts or something to load the
kernel image into the emulator, so those scripts could go and
modify the dtb in place to populate the initrd and commandline.
If you need pointers on that feel free to contact me directly.

> 
> > > +			compatible = "arm,armv7-timer";
> > > +			interrupts = <1 2 0xf08>,
> > > +				     <1 3 0xf08>,
> > > +				     <1 4 0xf08>,
> > > +				     <1 1 0xf08>;
> > > +			clock-frequency = <20833333>;
> >
> > Drop this clock-frequency part if you can. The hardware should
> > properly report the frequency.
> 
> Cannot drop this. This is the ref-clock frequency. For the
> chip it is 48MHz, for emulation is ~20MHz. Similar to
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/qcom-msm8974.dtsi#n89

And the hardware is not emulated properly to report the actual
frequency that the timer is running at? That's sad.

At the least, this should be in the board specific dtsi file
instead of the SoC specific file, because it's a board quirk.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
