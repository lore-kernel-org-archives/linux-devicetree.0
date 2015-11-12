From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [kbuild-all] [PATCH V3 4/4] dma: add Qualcomm Technologies HIDMA channel driver
Date: Thu, 12 Nov 2015 14:49 +0100
Message-ID: <4850864.TsBisV6LLx@wuerfel>
References: <201511090323.GmbQltpW%fengguang.wu@intel.com> <4119660.BobUIRMK6T@wuerfel> <20151112082015.GA9099@wfg-t540p.sh.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151112082015.GA9099@wfg-t540p.sh.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fengguang Wu <lkp@intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Vinod Koul <vinod.koul@intel.com>, jcm@redhat.com, timur@codeaurora.org, agross@codeaurora.org, linux-kernel@vger.kernel.org, Sinan Kaya <okaya@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, kbuild-all@01.org, Kumar Gala <galak@codeaurora.org>, dmaengine@vger.kernel.org, linux-arm-msm@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, cov@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Thursday 12 November 2015 16:20:15 Fengguang Wu wrote:
> Hi Arnd,
> 
> On Wed, Nov 11, 2015 at 09:42:00AM +0100, Arnd Bergmann wrote:
> > On Wednesday 11 November 2015 10:21:03 Fengguang Wu wrote:
> > > Hi Sinan,
> > > 
> > > Sorry please ignore this warning -- it's actually a problem specific
> > > to the mn10300 arch. I'll disable such warning in mn10300 in future.
> > 
> > I just tried to find what happened here. mn10300 appears to define
> > the type based on the gcc version:
> > 
> > #if __GNUC__ == 4
> > typedef unsigned int    __kernel_size_t;
> > typedef signed int      __kernel_ssize_t;
> > #else
> > typedef unsigned long   __kernel_size_t;
> > typedef signed long     __kernel_ssize_t;
> > #endif
> > 
> > while gcc defines it based on whether you are using a Linux targetted
> > gcc or a bare-metal one:
> > 
> > gcc/config/mn10300/linux.h:#undef SIZE_TYPE
> > gcc/config/mn10300/mn10300.h:#undef  SIZE_TYPE
> > gcc/config/mn10300/mn10300.h:#define SIZE_TYPE "unsigned int"
> > 
> > I can think of two reasons why it went wrong here:
> > 
> > a) You are using gcc-5.x, and the check in the kernel should be ">="
> >    rather than "==". We should probably fix that regardless
> > 
> > b) You are using a bare-metal gcc rather than a Linux version.
> 
> > I couldn't find an mn10300 gcc on kernel.org, which one do you use?
> 
> I used this mn10300 compiler:
> 
> https://www.kernel.org/pub/tools/crosstool/files/bin/x86_64/4.9.0/x86_64-gcc-4.9.0-nolibc_am33_2.0-linux.tar.xz

Ok, so this is not gcc-5.x (i.e. we are not hitting the first problem), but it uses
this definition:

./lib/gcc/am33_2.0-linux/4.9.0/include/stddef.h:#define __SIZE_TYPE__ long unsigned int

which does not match what the kernel expects. I see I have the same thing in
my locally built am33_2.0-linux-gcc-4.9.3.

I have just tried this again with a newly built am33_2.0-linux-gcc-5.2.1, and that
indeed avoids almost all warnings for the mn10300 kernel. I suspect this is
really a combination of two bugs that cancel each other out, but if you do the
same update on your system, you will get the results you want and will no longer
see the bogus warning.

	Arnd
