From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: powerpc: Use device_type helpers to access the node type
Date: Sat,  8 Dec 2018 00:07:06 +1100 (AEDT)
Message-ID: <43BCRZ67Hqz9sBQ@ozlabs.org>
References: <20181116221104.23024-4-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181116221104.23024-4-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Fri, 2018-11-16 at 22:11:00 UTC, Rob Herring wrote:
> Remove directly accessing device_node.type pointer and use the accessors
> instead. This will eventually allow removing the type pointer.
> 
> Replace the open coded iterating over child nodes with
> for_each_child_of_node() while we're here.
> 
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/e5480bdcc4429e4c172d450ee1db19

cheers
