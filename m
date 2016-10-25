From: atull <atull@opensource.altera.com>
Subject: Re: [v2 2/2] fpga: Add support for Lattice iCE40 FPGAs
Date: Tue, 25 Oct 2016 09:47:49 -0500
Message-ID: <alpine.DEB.2.02.1610250913530.14525@linuxheads99>
References: <1477283989-21947-1-git-send-email-joel@airwebreathe.org.uk> <1477283989-21947-2-git-send-email-joel@airwebreathe.org.uk> <alpine.DEB.2.02.1610241615280.14525@linuxheads99> <c971d8f4-dbb4-8d6e-f8eb-028a0a95e6fb@airwebreathe.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c971d8f4-dbb4-8d6e-f8eb-028a0a95e6fb@airwebreathe.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Joel Holdsworth <joel@airwebreathe.org.uk>
Cc: ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mark.rutland@arm.com, moritz.fischer@ettus.com, pawel.moll@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 25 Oct 2016, Joel Holdsworth wrote:

> 
> > Hi Joel,
> > 
> > Thanks for submitting your driver!
> > 
> > I didn't see any huge problems, just minor things below...
> > 
> > Alan
> > 
> 
> Hi Alan, Thanks for your feedback. I've implemented all your suggestions and
> I'll resubmit.
> 
> I had a question about the status of the fpga-manager framework. Is there
> active work going on? I was wondering if there were any patches for specifying
> a firmware file from device-tree?

Yes!  I have submitted patches for doing exactly that.  About to
submit v21.  Here's patch 1 of v20:

https://patchwork.kernel.org/patch/9379859/

> and/or if there were any patches for loading
> firmware from userspace - something like this: "cat firmware.bin >
> /dev/fpga0"?

We discussed doing a char driver interface.  That's where all this
started.  It met with lots of resistance.

> 
> Only being able to load firmware from kernel C-code is rather a limitation -
> though I suppose the framework is quite early in development.
> 
> Thanks
> Joel
> 
