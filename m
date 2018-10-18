From: Brian Norris <briannorris@chromium.org>
Subject: Re: [RFC PATCH] soc: qcom: rmtfs_mem: Control remoteproc from
 rmtfs_mem
Date: Wed, 17 Oct 2018 17:23:59 -0700
Message-ID: <20181018002350.GB179852@rodete-desktop-imager.corp.google.com>
References: <20180925080607.30565-1-bjorn.andersson@linaro.org>
 <20180925172943.GA118699@ban.mtv.corp.google.com>
 <37621d4fadff8e3a0bbe034119351d16@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <37621d4fadff8e3a0bbe034119351d16@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sibi Sankar <sibis@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Sibi,

On Sun, Sep 30, 2018 at 08:58:49PM +0530, Sibi Sankar wrote:
> On 2018-09-25 22:59, Brian Norris wrote:
> > On Tue, Sep 25, 2018 at 01:06:07AM -0700, Bjorn Andersson wrote:
> > So rather than looking for open(), I think somebody needs to be looking
> > for the appearance and disappearance of the RMTFS_QMI_SERVICE. (Looking
> > for disappearance would resolve the daemon restart issue, no?) That
> > "somebody" could be the remoteproc driver I suppose (qmi_add_lookup()?),
> > or...couldn't it just be the modem itself? Do you actually need to
> > restart the entire modem when the RMTFS service goes away, or do you
> > just need to pause storage activity?
> > 
> 
> Hi Brian,
> 
> It might be more logical to make that "somebody" the rmtfs_mem driver
> itself, since
> the modem as such does not have any direct functional dependency on
> rmtfs_mem i.e
> the firmware can be configured to run on rmtfs_mem or internal fs. So in

How exactly is the firmware configured for this? Isn't this something
that's just determined at (firmware) build time? I seem to recall seeing
early firmware releases that booted OK without rmtfs (and therefore
probably had an internal FS?) and later ones that didn't.

Anyway, this sounds even more like an argument for:
(1) not describing this in the device tree; and
(2) as a result of (1), probably not handled in the kernel either

The reasoning for (1): this is purely a software configuration, and does
not really describe the hardware. There's nothing about the hardware
that says the modem won't have an internal FS; so you have to choose
whether to add a rmtfs-to-rproc phandle based on which firmware you're
building in.

On second thought, that might even be an argument for killing the entire
rmtfs_mem node in DT actually -- and as a matter of fact, I think you
have the same "configuration" (i.e., DT isn't just describing hardware)
problem with the rmtfs_mem node. AIUI, you may have to choose a
different memory region size based on the number of firmware features
a particular product supports. That's typically a Device Tree no-no.

But I don't know how far down that rabbit hole we should go...

> such cases
> where the modem is running on internal fs, it would be undesirable to have a
> hard
> coded dependency for rmtfs_mem in remoteproc modem itself.

OK, sure. But as per the above, the whole software-configuration-in-DT
thing is undesirable as well.

Anyway, I'll take a look at your v2.

> Wouldn't it be simpler/quicker to fix this in kernel than churning out new
> firmware
> releases. A fix in firmware will also mean that this becomes one-off fix for
> dragon
> boards diverging the firmware branch from whats used in android for
> 8916/8974/8996.

I'm not so sure. Well, sure, it's probably quicker. But this is a known
bug in Android that you've clearly added Android workarounds for. Fixing
it in later firmware doesn't preclude you also continuing to use your
hack on Android.

And can you explain: why can't this fix be applied on all new firmware?
Why does it have to be a "one-off" for dragon boards?

Brian
