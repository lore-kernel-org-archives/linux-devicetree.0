From: "H. Peter Anvin" <hpa@linux.intel.com>
Subject: Re: [sodaville] [PATCH 02/11] x86: Add device tree support
Date: Mon, 03 Jan 2011 10:06:52 -0800
Message-ID: <4D22103C.2080705@linux.intel.com>
References: <1290706801-7323-1-git-send-email-bigeasy@linutronix.de> <1290706801-7323-3-git-send-email-bigeasy@linutronix.de> <1290807736.32570.143.camel@pasglop> <20101128134907.GA30784@www.tglx.de> <20101230082654.GB11721@angua.secretlab.ca> <AANLkTin2=T=v0ZNOpAGhwuM0i9Ts8Xr+kRtEJ95VGeOp@mail.gmail.com> <AANLkTinSr_KYkFNUmWbL2PUzS2Ose7cA5q8xUbLeUr=J@mail.gmail.com> <4D21F3DB.90504@linux.intel.com> <4D21F718.8010600@linux.intel.com> <20110103175254.GD2522@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110103175254.GD2522@angua.secretlab.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, x86@kernel.org, linux-kernel@vger.kernel.org, sodaville@linutronix.de, Rob Landley <rob@landley.net>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On 01/03/2011 09:52 AM, Grant Likely wrote:
> 
> I think we've got an impedance mismatch.
> 
> The whole point of the ppc boot wrapper, and the kind of boot wrapper
> that I'm talking about here, is that it becomes part of the kernel
> image and is *not* part of firmware.  ie. an executable wrapper which
> carries the kernel as it's payload.  I'm wary too of depending of
> firmware to get things right because it can be so painful to change.
> 

The problem with that kind of boot wrapper is that they are
per-architecture, increasing the differences between architectures
needlessly, and they are often implemented very poorly.

As such, it's nice to have an ultimate fallback that doesn't depend on
anything outside ours -- the kernel community's -- control.

	-hpa
