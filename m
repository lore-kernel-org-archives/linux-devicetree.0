From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: common location for devicetree files
Date: Fri, 8 Nov 2013 13:32:40 -0500
Message-ID: <20131108183240.GH10335@titan.lakedaemon.net>
References: <1438803E-C904-428B-B042-891978BC15DF@codeaurora.org>
 <20131108165255.GA32668@titan.lakedaemon.net>
 <5957C301-9698-45B0-BFED-749DE79D0A74@codeaurora.org>
 <20131108181351.GF10335@titan.lakedaemon.net>
 <2274FB81-099B-4206-8332-70E9824FFF2F@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2274FB81-099B-4206-8332-70E9824FFF2F@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org list" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 08, 2013 at 12:17:30PM -0600, Kumar Gala wrote:
...
> I get the point, just not sure how else to sort the 800+ .dts{i} files
> that we have in the kernel tree right now.

Well, to start with, all #include'd files could go into a
arch/dts/include directory.  That would clean things up a bit.

We could also consider separating the dts files by ISA.  All armv7 in
one directory, armv8, armv5te, powerpc, mips, etc.  Since multiplatform
kernels would only support one of those directories, it would make build
products easier:

$ make multi_v7_defconfig && make dtbs
$ fancy_script.sh zImage arch/dts/armv7/*.dtb

Just a thought, I'm still not sold that the churn is worth it.

thx,

Jason.
