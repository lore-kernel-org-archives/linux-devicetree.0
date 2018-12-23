From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: powerpc: Use of_node_name_eq for node name comparisons
Date: Mon, 24 Dec 2018 00:27:58 +1100 (AEDT)
Message-ID: <43N38G6V72z9sMM@ozlabs.org>
References: <20181205195050.4759-2-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181205195050.4759-2-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Paul Mackerras <paulus@samba.org>, Alistair Popple <alistair@popple.id.au>, Anatolij Gustschin <agust@denx.de>, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Wed, 2018-12-05 at 19:50:18 UTC, Rob Herring wrote:
> Convert string compares of DT node names to use of_node_name_eq helper
> instead. This removes direct access to the node name pointer.
> 
> A couple of open coded iterating thru the child node names are converted
> to use for_each_child_of_node() instead.
> 
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Alistair Popple <alistair@popple.id.au>
> Cc: Matt Porter <mporter@kernel.crashing.org>
> Cc: Anatolij Gustschin <agust@denx.de>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/2c8e65b595cf0bf7c1413404dff9b9

cheers
