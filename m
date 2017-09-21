From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [v5 00/12] soc/fsl/qbman: Enable QBMan on ARM Platforms
Date: Thu, 21 Sep 2017 15:40:28 +0100
Message-ID: <20170921144028.nv2f54w55quyabje@localhost>
References: <1505767187-4596-1-git-send-email-roy.pledge@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1505767187-4596-1-git-send-email-roy.pledge@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Roy Pledge <roy.pledge@nxp.com>
Cc: leoyang.li@nxp.com, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, arnd@arndb.de, madalin.bucur@nxp.com, linux@armlinux.org.uk, oss@buserror.net
List-Id: devicetree@vger.kernel.org

On Mon, Sep 18, 2017 at 04:39:35PM -0400, Roy Pledge wrote:
> Madalin Bucur (4):
>   soc/fsl/qbman: Drop set/clear_bits usage
>   soc/fsl/qbman: add QMAN_REV32
>   soc/fsl/qbman: different register offsets on ARM
>   soc/fsl/qbman: Enable FSL_LAYERSCAPE config on ARM
> 
> Roy Pledge (5):
>   soc/fsl/qbman: Add common routine for QBMan private allocations
>   soc/fsl/qbman: Use shared-dma-pool for BMan private memory allocations
>   soc/fsl/qbman: Use shared-dma-pool for QMan private memory allocations
>   dt-bindings: soc/fsl: Update reserved memory binding for QBMan
>   soc/fsl/qbman: Rework portal mapping calls for ARM/PPC
> 
> Valentin Rothberg (1):
>   soc/fsl/qbman: Fix ARM32 typo

I reviewed the patches specific to the arm qbman buffer mappings, they
look fine to me. The DT bindings would need acks from the devicetree
maintainers. The rest of the patches are qbman-specific definitions
which I haven't checked for correctness (I guess they are fine).

How do you plan to upstream these patches? They would probably go in via
arm-soc.

-- 
Catalin
