From: Mitch Bradley <wmb@firmworks.com>
Subject: Re: [PATCH 03/11] x86/dtb: Add a device tree for CE4100
Date: Sun, 28 Nov 2010 15:34:31 -1000
Message-ID: <4CF30327.9020408@firmworks.com>
References: <1290706801-7323-1-git-send-email-bigeasy@linutronix.de>	 <1290706801-7323-4-git-send-email-bigeasy@linutronix.de>	 <1290808645.32570.158.camel@pasglop>  <20101128160449.GC30784@www.tglx.de> <1290984809.32570.208.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1290984809.32570.208.camel@pasglop>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-kernel@vger.kernel.org, sodaville@linutronix.de, x86@kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On 11/28/2010 12:53 PM, Benjamin Herrenschmidt wrote:
>> I wasn't aware of the OFW binding for X86. I will follow it once I find
>> it.
>
> Interesting, I though I would find it on
> http://www.openfirmware.info/Bindings but it's not there...
>
> CC'ing Mitch who might know where to find that.


I can't find the x86 binding either, which is a little bit embarrassing 
since I wrote it, albeit about 15 years ago...

If my memory is correct, it is not particularly useful now.  It 
primarily dealt with the ABI for transferring control to the OS and for 
calling back into the OFW client interface.  The only company that used 
it was Network Appliance, back when they were building their own x86 
motherboards (because most off-the-shelf mobo's of that era did not meet 
their stability requirements).

There has been a fair amount of churn since then, in relevant areas like 
x86 privileged architecture, compiler versions and code generation 
policies, popular bootloaders, OSs, and Linux early startup code.  The 
net result is that the ABI that the old binding specified probably isn't 
right for today.

I'd be happy to work with people to develop a new x86 binding.

The OLPC interface might be of some use as a starting point, but would 
need some work.  It is currently in use on AMD Geode, Via C7, and Intel 
Atom based systems, but, among other issues, it conflicts with the 
Physical Address Extension feature.

Mitch
