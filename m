From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [PATCH] libfdt: Use libfdt shared library for testcases
Date: Fri, 02 Jan 2009 09:41:02 -0600
Message-ID: <E1LIm90-00048J-HK@jdl.com>
References: <20090102132113.GC8954@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-reply-to: <20090102132113.GC8954-jnIq6iUNB1CO8iYQgJmm/0EOCMrvLtNR@public.gmane.org> 
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Josh Boyer <jwboyer-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

> Link the testcases against the libfdt.so that is built and use
> it for the testsuite verification.
> 
> Signed-off-by: Josh Boyer <jwboyer-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>

Not applied.  Something is wrong here, not quite sure what.

First, after I apply this patch, when I do:

    $ make clean
    $ make check

I get this:

     DEP flattree.c
     DEP dtc.c
     DEP data.c
     DEP checks.c
    CHK version_gen.h
    UPD version_gen.h
     CC tests/get_mem_rsv.o
    cc: -lfdt: linker input file unused because linking not done
     CC libfdt/fdt.o
     CC libfdt/fdt_ro.o
     CC libfdt/fdt_wip.o
     CC libfdt/fdt_sw.o
     CC libfdt/fdt_rw.o
     CC libfdt/fdt_strerror.o
     LD libfdt/libfdt.so
    /usr/bin/ld: cannot find -lfdt
    collect2: ld returned 1 exit status
    make: *** [libfdt/libfdt.so] Error 1

Doing just:

    $ make
    $ make check

seems to clear it up and it finishes building.
So that is promising.

However, the "make check" yields funny results:

    $ make check

    ********** TEST SUMMARY
    *     Total testcases:1197
    *                PASS:88
    *                FAIL:0
    *   Bad configuration:0
    * Strange test result:1109
    **********

Not sure there at all..

jdl
