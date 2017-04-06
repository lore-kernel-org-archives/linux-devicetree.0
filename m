From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [v2, 3/3] powerpc/powernv: Introduce address translation services for Nvlink2
Date: Thu,  6 Apr 2017 23:06:08 +1000 (AEST)
Message-ID: <3vzNJ01sS5z9s8N@ozlabs.org>
References: <1491213104-24450-3-git-send-email-alistair@popple.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1491213104-24450-3-git-send-email-alistair@popple.id.au>
Sender: linux-kernel-owner@vger.kernel.org
Cc: devicetree@vger.kernel.org, Alistair Popple <alistair@popple.id.au>, mhairgrove@nvidia.com, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, robh+dt@kernel.org, shailendras@nvidia.com
List-Id: devicetree@vger.kernel.org

On Mon, 2017-04-03 at 09:51:44 UTC, Alistair Popple wrote:
> Nvlink2 supports address translation services (ATS) allowing devices
> to request address translations from an mmu known as the nest MMU
> which is setup to walk the CPU page tables.
> 
> To access this functionality certain firmware calls are required to
> setup and manage hardware context tables in the nvlink processing unit
> (NPU). The NPU also manages forwarding of TLB invalidates (known as
> address translation shootdowns/ATSDs) to attached devices.
> 
> This patch exports several methods to allow device drivers to register
> a process id (PASID/PID) in the hardware tables and to receive
> notification of when a device should stop issuing address translation
> requests (ATRs). It also adds a fault handler to allow device drivers
> to demand fault pages in.
> 
> Signed-off-by: Alistair Popple <alistair@popple.id.au>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/1ab66d1fbadad86b1f4a9c7857e193

cheers
