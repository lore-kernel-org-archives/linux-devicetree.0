From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [v2, 3/5] powerpc: pseries: remove dlpar_attach_node dependency on full path
Date: Thu, 24 Aug 2017 22:37:34 +1000 (AEST)
Message-ID: <3xdP2Q710hz9sR9@ozlabs.org>
References: <20170821151651.25096-4-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170821151651.25096-4-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: David Laight <David.Laight@aculab.com>, Frank Rowand <frowand.list@gmail.com>, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2017-08-21 at 15:16:49 UTC, Rob Herring wrote:
> In preparation to stop storing the full node path in full_name, remove the
> dependency on full_name from dlpar_attach_node(). Callers of
> dlpar_attach_node() already have the parent device_node, so just pass the
> parent node into dlpar_attach_node instead of the path. This avoids doing
> a lookup of the parent node by the path.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linuxppc-dev@lists.ozlabs.org

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/215ee763f8cb9a2912d411f96f6f67

cheers
