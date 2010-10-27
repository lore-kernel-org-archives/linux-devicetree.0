From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] x86: OLPC: add OLPC device-tree support (v3)
Date: Wed, 27 Oct 2010 07:41:20 -0700
Message-ID: <4CC83A10.8090607@zytor.com>
References: <20101022155846.66cde32f@queued.net> <20101027101933.GD6797@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20101027101933.GD6797@angua.secretlab.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Andres Salomon <dilinger@queued.net>, devicetree-discuss@lists.ozlabs.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/27/2010 03:19 AM, Grant Likely wrote:
> On Fri, Oct 22, 2010 at 03:58:46PM -0700, Andres Salomon wrote:
>>
>> Make use of PROC_DEVICETREE to export the tree, and sparc's PROMTREE code to
>> call into OLPC's Open Firmware to build the tree.
>>
>> v3: rename olpc_prom to olpc_dt
>>   - rework Kconfig entries
>>   - drop devtree build hook from proc, instead adding a call to x86's
>>     paging_init (similarly to how sparc64 does it)
>>   - switch allocation from using slab to alloc_bootmem.  this allows
>>     the DT to be built earlier during boot (during setup_arch); the
>>     downside is that there are some 1200 bootmem reservations that are
>>     done during boot.  Not ideal..
>>   - add a helper olpc_ofw_is_installed function to test for the
>>     existence and successful detection of OLPC's OFW.
>>
>> Signed-off-by: Andres Salomon <dilinger@queued.net>
> 
> Overall this patch looks fine, but it needs to be acked from the x86
> maintainers, and I'd like it to have a cycle through linux-next before
> it gets merged, so that means 2.6.38 because the 2.6.37 merge window
> has already been open for almost a week.
> 

Right... which means that our attention is going to be elsewhere for a
bit -- probably until after KS/LPC.  Sorry, just immediate
prioritization and nothing to do with the relative importance.

	-hpa

-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.
