From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v2 11/11] of: unify phandle name in struct device_node
Date: Tue, 24 Nov 2009 14:22:42 -0800 (PST)
Message-ID: <20091124.142242.46843869.davem@davemloft.net>
References: <20091124215908.559.23998.stgit@angua>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <20091124215908.559.23998.stgit@angua>
Sender: sparclinux-owner@vger.kernel.org
To: grant.likely@secretlab.ca
Cc: linuxppc-dev@lists.ozlabs.org, devicetree-discuss@lists.ozlabs.org, sparclinux@vger.kernel.org, microblaze-uclinux@itee.uq.edu.au, benh@kernel.crashing.org, sfr@canb.auug.org.au, monstr@monstr.eu
List-Id: devicetree@vger.kernel.org

From: Grant Likely <grant.likely@secretlab.ca>
Date: Tue, 24 Nov 2009 15:01:14 -0700

> In struct device_node, the phandle is named 'linux_phandle' for PowerPC
> and MicroBlaze, and 'node' for SPARC.  There is no good reason for the
> difference, it is just an artifact of the code diverging over a couple
> of years.  This patch renames both to simply .phandle.
> 
> Note: the .node also existed in PowerPC/MicroBlaze, but the only user
> seems to be arch/powerpc/platforms/powermac/pfunc_core.c.  It doesn't
> look like the assignment between .linux_phandle and .node is
> significantly different enough to warrant the separate code paths
> unless ibm,phandle properties actually appear in Apple device trees.
> 
> I think it is safe to eliminate the old .node property and use
> linux_phandle everywhere.
> 
> Signed-off-by: Grant Likely <grant.likely@secretlab.ca>

Acked-by: David S. Miller <davem@davemloft.net>
