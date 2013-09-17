From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [tpmdd-devel] [PATCH] tpm: Add support for Atmel I2C TPMs
Date: Tue, 17 Sep 2013 17:56:58 -0600
Message-ID: <20130917235658.GC345@obsidianresearch.com>
References: <20130911205807.GA21467@obsidianresearch.com>
 <20130911230841.GB4251@obsidianresearch.com>
 <201309120124.00067.PeterHuewe@gmx.de>
 <201309120152.36878.PeterHuewe@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201309120152.36878.PeterHuewe-Mmb7MZpHnFY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter H?we <PeterHuewe-Mmb7MZpHnFY@public.gmane.org>
Cc: tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Leonidas Da Silva Barbosa <leosilva-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ashley Lai <ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org>, Rajiv Andrade <mail-ZlhrYzitvtWsTnJN9+BGXg@public.gmane.org>, Peter Huewe <peter.huewe-d0qZbvYSIPpWk0Htik3J/w@public.gmane.org>, Teddy Reed <teddy-KaFzXBG2u9Ng9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 12, 2013 at 01:52:36AM +0200, Peter H?we wrote:
> Hi,
> 
> 
> > I think I'll stage them (nuvoton, st and atmel) all in a temporary branch
> > "testing-and-review" so it's easier for people to try them out.
> > This branch might rebase and change all the time, but maybe it makes things
> > easier (and patches can be squashed afterwards easily if needed).
> > 
> > 
> > But since you'll be sending a v2, I'll wait until the v2.
> I staged everything here for the moment
> https://github.com/PeterHuewe/linux-tpmdd/tree/testing-and-review

I put up a branch on my github that has the drivers as well as parts
of a major cleanup as we both vaugely discussed.

Not finished yet, but maybe by the time you get back. It is big, I'm
just going to keep it on github for the moment.

commit dfd68b37beb8806b0a061af71436017d0b6c577e
Author: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Date:   Sat Sep 14 19:21:12 2013 -0600

    tpm: Pull everything related to /dev/tpmX into tpm-dev.c
    
    This cleans up all the identical file_operations sprinkled about in
    the drivers.
    
    To support this the way the chip structure is recovered in tpm_open
    is switched to use container_of rather than searching, otherwise this
    is just a copy of function content from tpm.c to tpm-dev.c and the
    resulting cleanup from making the functions static.
    
    Signed-off-by: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>

commit 9d83865080be4fce23c3247754c640aacd30c25e
Author: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Date:   Sat Sep 14 18:51:54 2013 -0600

    tpm: Store devname in the tpm_chip
    
    Just put the memory directly in the chip structure, rather than
    a 2nd dedicated kalloc.
    
    Signed-off-by: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>

commit 4b05342eb38db16afb5698dd7b79ce21b56e669b
Author: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Date:   Sat Sep 14 18:47:43 2013 -0600

    tpm: Create a tpm_class_ops structure and use it
    
    This replaces the static initialization of a tpm_vendor_specific
    structure in the drivers with the standard Linux idiom of providing
    a const structure of function pointers.
    
    As the first clean up step this just changes the names and copies
    ops into chip->vendor exactly as before.
    
    Signed-off-by: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>

commit 4e1a392500e4f588ec685703d0c1066c93135eaa
Author: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Date:   Sat Sep 14 17:55:30 2013 -0600

    tpm: xen-tpmfront: Fix default durations
    
    All the default durations were being set to 10 minutes which is
    way too long for the timeouts. Normal values for the longest
    duration are around 5 mins, and short duration ar around .5s.
    
    Further, these are just the default, tpm_get_timeouts will set
    them to values from the TPM (or throw an error).
    
    Just remove them.
    
    Signed-off-by: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>

commit 181416f763b9adf2cf8f9cf0ca4d377a16b255d7
Author: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Date:   Sat Sep 14 17:36:29 2013 -0600

    tpm atmel: Call request_region with the correct base
    
    Commit e0dd03caf20d040a0a86b6bd74028ec9bda545f5
    changed the code path here so that ateml_get_base_addr
    no longer directly altered the tpm_vendor_specific
    structure, and instead placed the base address on the stack.
    
    The commit missed updating the request_region call, which
    would have resulted in request_region being called with 0
    as the base address.
    
    I don't know if request_region(0, ..) will fail, if so the
    driver has been broken since 2006 and we should remove it
    from the tree as it has no users.
    
    Signed-off-by: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>

commit c41042057dc3fd156c8cb264a18dac1ce2bdf90a
Author: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Date:   Sat Sep 14 16:57:58 2013 -0600

    tpm: ibmvtpm: Use %zd formatting for size_t format arguments
    
    This suppresses compile warnings on 32 bit builds.
    
    Signed-off-by: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
