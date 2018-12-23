From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: powerpc: pseries: pmem: Convert to using %pOFn instead of device_node.name
Date: Mon, 24 Dec 2018 00:27:57 +1100 (AEDT)
Message-ID: <43N38G05D7z9sDn@ozlabs.org>
References: <20181205195050.4759-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181205195050.4759-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Wed, 2018-12-05 at 19:50:17 UTC, Rob Herring wrote:
> In preparation to remove the node name pointer from struct device_node,
> convert printf users to use the %pOFn format specifier. pmem.c was
> recently added and missed the initial conversion.
> 
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/0d1223dd9273b2ba3e965a81092a23

cheers
