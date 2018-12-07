From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: macintosh: Use device_type helpers to access the node type
Date: Sat,  8 Dec 2018 00:07:07 +1100 (AEDT)
Message-ID: <43BCRb5wVkz9s8F@ozlabs.org>
References: <20181116221104.23024-5-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181116221104.23024-5-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 2018-11-16 at 22:11:01 UTC, Rob Herring wrote:
> Remove directly accessing device_node.type pointer and use the accessors
> instead. This will eventually allow removing the type pointer.
> 
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/bf82d3758d4a075d17f4930c9872b0

cheers
