From: "H. Peter Anvin" <hpa@linux.intel.com>
Subject: Re: [sodaville] [PATCH 03/11] x86/dtb: Add a device tree for CE4100
Date: Mon, 29 Nov 2010 10:26:23 -0800
Message-ID: <4CF3F04F.6090202@linux.intel.com>
References: <1290706801-7323-1-git-send-email-bigeasy@linutronix.de>		<1290706801-7323-4-git-send-email-bigeasy@linutronix.de>		<1290808645.32570.158.camel@pasglop>	<20101128160449.GC30784@www.tglx.de>	<1290984809.32570.208.camel@pasglop> <4CF30327.9020408@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4CF30327.9020408@firmworks.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mitch Bradley <wmb@firmworks.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, devicetree-discuss@lists.ozlabs.org, sodaville@linutronix.de, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, x86@kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/28/2010 05:34 PM, Mitch Bradley wrote:
> 
> The OLPC interface might be of some use as a starting point, but would 
> need some work.  It is currently in use on AMD Geode, Via C7, and Intel 
> Atom based systems, but, among other issues, it conflicts with the 
> Physical Address Extension feature.
> 

It conflicts with at least PAE, PAT and x86-64.  Since NX requires PAE,
it also conflicts with that.  As such, I would think it would have to be
considered obsolete.

	-hpa
