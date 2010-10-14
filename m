From: David Daney <ddaney@caviumnetworks.com>
Subject: Re: [PATCH 1/2] of/flattree: Eliminate need to provide early_init_dt_scan_chosen_arch
Date: Thu, 14 Oct 2010 14:08:12 -0700
Message-ID: <4CB7713C.9040303@caviumnetworks.com>
References: <20101013064352.2743.80378.stgit@localhost6.localdomain6>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <20101013064352.2743.80378.stgit@localhost6.localdomain6>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Grant Likely <grant.likely@secretlab.ca>, ralf@linux-mips.org
Cc: benh@kernel.crashing.org, dediao@cisco.com, linux-mips@linux-mips.org, monstr@monstr.eu, dvomlehn@cisco.com, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On 10/12/2010 11:44 PM, Grant Likely wrote:
> This patch refactors the early init parsing of the chosen node so that
> architectures aren't forced to provide an empty implementation of
> early_init_dt_scan_chosen_arch.  Instead, if an architecture wants to
> do something different, it can either use a wrapper function around
> early_init_dt_scan_chosen(), or it can replace it altogether.
>
> This patch was written in preparation to adding device tree support to
> both x86 ad MIPS.
>
> Signed-off-by: Grant Likely<grant.likely@secretlab.ca>

In conjunction with my 'MIPS: Add some irq definitins required by OF' 
and the '2/2 of/mips: Add device tree support to MIPS' patches, I can 
enable CONFIG_USE_OF, and build and run a kernel on my Octeon.  I 
haven't started using the device tree yet, but this is a good start.

You can add my...

Tested-by: David Daney <ddaney@caviumnetworks.com>


> ---
>   arch/microblaze/kernel/prom.c |    5 -----
>   arch/powerpc/kernel/prom.c    |   12 ++++++++++--
>   drivers/of/fdt.c              |    2 --
>   include/linux/of_fdt.h        |    2 +-
>   4 files changed, 11 insertions(+), 10 deletions(-)
[...]
