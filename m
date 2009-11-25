From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v2 11/11] of: unify phandle name in struct device_node
Date: Wed, 25 Nov 2009 02:30:45 +0100
Message-ID: <AE8D50AE-03EE-45FC-80EF-376F0836B5CB@kernel.crashing.org>
References: <20091124215908.559.23998.stgit@angua>
Mime-Version: 1.0 (Apple Message framework v753.1)
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <20091124215908.559.23998.stgit@angua>
Sender: sparclinux-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linuxppc-dev@lists.ozlabs.org, devicetree-discuss@lists.ozlabs.org, sparclinux@vger.kernel.org, microblaze-uclinux@itee.uq.edu.au, benh@kernel.crashing.org, sfr@canb.auug.org.au, davem@davemloft.net, monstr@monstr.eu
List-Id: devicetree@vger.kernel.org

> In struct device_node, the phandle is named 'linux_phandle' for  
> PowerPC
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

   ^^^^^^^^^^^^  You forgot to update one :-)


>
Segher

