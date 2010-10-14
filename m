From: David Daney <ddaney@caviumnetworks.com>
Subject: Re: [PATCH 2/2 RFC] of/mips: Add device tree support to MIPS
Date: Thu, 14 Oct 2010 14:09:49 -0700
Message-ID: <4CB7719D.9030405@caviumnetworks.com>
References: <20101013064352.2743.80378.stgit@localhost6.localdomain6> <20101013064416.2743.42892.stgit@localhost6.localdomain6>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <20101013064416.2743.42892.stgit@localhost6.localdomain6>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Grant Likely <grant.likely@secretlab.ca>, ralf@linux-mips.org
Cc: benh@kernel.crashing.org, dediao@cisco.com, linux-mips@linux-mips.org, monstr@monstr.eu, dvomlehn@cisco.com, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On 10/12/2010 11:48 PM, Grant Likely wrote:
> From: Dezhong Diao<dediao@cisco.com>
>
> Add the ability to enable CONFIG_OF on the MIPS architecture.
>
> Signed-off-by: Dezhong Diao<dediao@cisco.com>
> [grant.likely@secretlab.ca: cleared out obsolete hooks,
> 	removed ARCH_HAS_DEVTREE_MEM from being manually selected,
> 	remove __init tags from header file]
> Signed-off-by: Grant Likely<grant.likely@secretlab.ca>
> Cc: linux-mips@linux-mips.org
> Cc: David Daney<ddaney@caviumnetworks.com>
> Cc: David VomLehn<dvomlehn@cisco.com>

As I mentioned in my reply to 1/2, this seems to work,


Tested-by: David Daney <ddaney@caviumnetworks.com>


> ---
>
> I've not tested this on anything, but I picked up the MIPS device tree
> patch written by Dezhong and updated it to match the changes in
> mainline.  I also half-heartedly tried to rebase the powertv support
> patch, didn't get very far due to the refactoring in
> arch/mips/powertv/memory.c
>
> Anyway, please take a look and give it a spin.  If it looks good, then
> I can add it into my -next branch.
>
> g.
>
[...]
