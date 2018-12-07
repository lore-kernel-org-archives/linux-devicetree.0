From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: misc: cxl: Use device_type helpers to access the node type
Date: Sat,  8 Dec 2018 00:07:08 +1100 (AEDT)
Message-ID: <43BCRd3ssvz9sCQ@ozlabs.org>
References: <20181116221104.23024-6-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181116221104.23024-6-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Frederic Barrat <fbarrat@linux.vnet.ibm.com>, Andrew Donnellan <andrew.donnellan@au1.ibm.com>, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Fri, 2018-11-16 at 22:11:02 UTC, Rob Herring wrote:
> Remove directly accessing device_node.type pointer and use the accessors
> instead. This will eventually allow removing the type pointer.
> 
> Cc: Frederic Barrat <fbarrat@linux.vnet.ibm.com>
> Cc: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> Acked-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/d2db097905d6ec439b7e863dc9a7e7

cheers
