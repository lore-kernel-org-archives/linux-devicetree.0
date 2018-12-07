From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: macintosh: windfarm: Another convert to using %pOFn instead of device_node.name
Date: Sat,  8 Dec 2018 00:07:03 +1100 (AEDT)
Message-ID: <43BCRW3g0Sz9s0t@ozlabs.org>
References: <20181116220540.17222-3-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181116220540.17222-3-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 2018-11-16 at 22:05:39 UTC, Rob Herring wrote:
> In preparation to remove the node name pointer from struct device_node,
> convert printf users to use the %pOFn format specifier.
> 
> Convert the open coded iterating thru child nodes to
> for_each_child_of_node() while we're here.
> 
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/15b680c474afd54dac05530d8fed41

cheers
