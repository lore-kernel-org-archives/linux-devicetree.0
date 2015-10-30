From: Al Stone <al.stone@linaro.org>
Subject: Re: [PATCH 1/2] dma: add Qualcomm Technologies HIDMA management
 driver
Date: Fri, 30 Oct 2015 14:08:03 -0600
Message-ID: <5633CE23.7060303@linaro.org>
References: <1446174501-8870-1-git-send-email-okaya@codeaurora.org>
 <20151030150025.GF31073@leverpostej>
 <CAHp75VdHxGC841cFY3M+ujZKSX04nT4+7gc3iKsgwzLRC4AYWQ@mail.gmail.com>
 <5633B207.5030505@codeaurora.org>
 <CAHp75Ve_7NeyJD==EpgzKes9n9wb5oTwtNt7FvZHUSUxqZ4+=Q@mail.gmail.com>
 <20151030182537.GB30791@leverpostej>
 <CAHp75Vd-z22XJboxQ=CMxDQ9UaTatbCmpAPLO0jPM0FwJadBOg@mail.gmail.com>
 <5633BB66.3070505@codeaurora.org> <20151030190106.GC30791@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151030190106.GC30791@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, Sinan Kaya <okaya@codeaurora.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, dmaengine <dmaengine@vger.kernel.org>, timur@codeaurora.org, cov@codeaurora.org, jcm@redhat.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, leif.lindholm@linaro.org
List-Id: devicetree@vger.kernel.org

On 10/30/2015 01:01 PM, Mark Rutland wrote:
> On Fri, Oct 30, 2015 at 02:48:06PM -0400, Sinan Kaya wrote:
>>>>>> It was decided by
>>>>>> Linaro that CSRT will not be supported for ARM64.

Hrm.  I personally decided we didn't have to worry about using the CSRT
(specifically, let's wait until someone has a need for it), but I know
of no decision to *not* support it.  Please cite a source for that claim.

>> See this.
>>
>> https://wiki.linaro.org/LEG/Engineering/Kernel/ACPI/TablePriorities
> 
> The CSRT is listed under "Want", not "Never" or "Don't Care", so Linaro
> have certainly not said that CSRT will not be supported. If anything,
> they have stated that the table should be supported.

"Want" means interesting, and probably useful, but no clear indication that
anyone actually needs it.  At one point, we thought we might use the CSRT
for describing DMA, but it turns out we have not needed to.

However, let's make sure we're saying the same thing: the CSRT table is
properly defined in the kernel include/acpi/actbl2.h file so one can read
such a table and use it if they so choose.  Nothing that we have done at
Linaro in the arm64 part of the kernel relies on any of the content from
the CSRT, nor does it preclude someone relying on that content.  So, the
CSRT is defined, and is usable, but is just not being used -- by Linaro --
at present.

If that needs to change, let me know; no one has asked us to use the CSRT
for a DMA engine, and we have not been provided any hardware that requires
it.

> I suspect that the rationale for it not being "Critical" or "Must" is
> that it's possible to use contemporary systems without DMA engines, but
> we will need support at some point in future.

Essentially correct.  We (Linaro ACPI team) would be glad to work on it,
if needed.  We just need to know that someone wants it, and we need to
have some way to test it (i.e., aka "hardware").

> I also note that there are Linaro patches adding supoprt for DBG2 [1] ,
> which is listed as "Never". So the page may be out of date...

Sadly, it is indeed out of date, but it is on my TODO list.  The DBG2
table was originally listed as "Never" only because of the licensing;
this has since changed and is now usable for consoles, so it got worked
on and implemented.

> Leif, Al?
> 
> [1] https://lkml.org/lkml/2015/9/8/287
> 
> Thanks,
> Mark.
> 


-- 
ciao,
al
-----------------------------------
Al Stone
Software Engineer
Linaro Enterprise Group
al.stone@linaro.org
-----------------------------------
