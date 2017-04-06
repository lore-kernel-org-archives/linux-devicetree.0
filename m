From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [v2, 2/3] powerpc/powernv: Add sanity checks to pnv_pci_get_{gpu|npu}_dev
Date: Thu,  6 Apr 2017 23:06:07 +1000 (AEST)
Message-ID: <3vzNHz2TyZz9sCX@ozlabs.org>
References: <1491213104-24450-2-git-send-email-alistair@popple.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1491213104-24450-2-git-send-email-alistair@popple.id.au>
Sender: linux-kernel-owner@vger.kernel.org
Cc: devicetree@vger.kernel.org, Alistair Popple <alistair@popple.id.au>, mhairgrove@nvidia.com, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, robh+dt@kernel.org, shailendras@nvidia.com
List-Id: devicetree@vger.kernel.org

On Mon, 2017-04-03 at 09:51:43 UTC, Alistair Popple wrote:
> The pnv_pci_get_{gpu|npu}_dev functions are used to find associations
> between nvlink PCIe devices and standard PCIe devices. However they
> lacked basic sanity checking which results in NULL pointer
> dereferencing if they are incorrect called can be harder to spot than
> an explicit WARN_ON.
> 
> Signed-off-by: Alistair Popple <alistair@popple.id.au>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/4c3b89effc281704d5395282c800c4

cheers
