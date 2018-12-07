From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: powerpc: Rework btext_find_display to use of_stdout and device_type helpers
Date: Sat,  8 Dec 2018 00:07:04 +1100 (AEDT)
Message-ID: <43BCRY4dyZz9sB7@ozlabs.org>
References: <20181116221104.23024-3-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181116221104.23024-3-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 2018-11-16 at 22:10:59 UTC, Rob Herring wrote:
> Remove directly accessing device_node.type pointer and use the accessors
> instead. This will eventually allow removing the type pointer.
> 
> In the process, the of_stdout pointer can be used instead of finding the
> stdout node again.
> 
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/5b8d6be7b8dd286bd654e37d637ded

cheers
