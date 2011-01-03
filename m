From: "H. Peter Anvin" <hpa@linux.intel.com>
Subject: Re: [sodaville] [PATCH 02/11] x86: Add device tree support
Date: Mon, 03 Jan 2011 08:19:36 -0800
Message-ID: <4D21F718.8010600@linux.intel.com>
References: <1290706801-7323-1-git-send-email-bigeasy@linutronix.de>	<1290706801-7323-3-git-send-email-bigeasy@linutronix.de>	<1290807736.32570.143.camel@pasglop>	<20101128134907.GA30784@www.tglx.de>	<20101230082654.GB11721@angua.secretlab.ca>	<AANLkTin2=T=v0ZNOpAGhwuM0i9Ts8Xr+kRtEJ95VGeOp@mail.gmail.com>	<AANLkTinSr_KYkFNUmWbL2PUzS2Ose7cA5q8xUbLeUr=J@mail.gmail.com> <4D21F3DB.90504@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4D21F3DB.90504@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, x86@kernel.org, linux-kernel@vger.kernel.org, sodaville@linutronix.de, Rob Landley <rob@landley.net>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On 01/03/2011 08:05 AM, H. Peter Anvin wrote:
> On 12/30/2010 12:58 PM, Grant Likely wrote:
>>
>> Right, but in all of those cases a boot wrapper provides the same
>> functionality with better flexability, such as being able to provided
>> the dtb image(s) at install time instead of compile time.
>>
> 
> Assuming the boot wrapper is written correctly.  I have seen a number of
> cases in which it was not, and it being "already locked into firmware"
> and not changeable.
> 
> It's a nice theory.  And in theory, theory and practice agree.
> 

By the way, this is the same reason we also allow the initramfs and even
the command line to be compiled in.

	-hpa
