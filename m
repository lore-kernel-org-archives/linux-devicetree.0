Return-Path: <SRS0=vNml=MG=alien8.de=bp@kernel.org>
Date: Mon, 24 Sep 2018 12:40:02 +0200
From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 0/6] Add Peripheral EDACs to SOCFPGA Stratix10.
Message-ID: <20180924104002.GC20187@zn.tnic>
References: <1537385941-11582-1-git-send-email-thor.thayer@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1537385941-11582-1-git-send-email-thor.thayer@linux.intel.com>
To: thor.thayer@linux.intel.com
Cc: dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org, devicetree@vger.kernel.org, linux-edac@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Sep 19, 2018 at 02:38:55PM -0500, thor.thayer@linux.intel.com wrote:
> From: Thor Thayer <thor.thayer@linux.intel.com>
> 
> This series of patches adds peripheral EDAC support for the SOCFPGA
> Stratix10. To ease the integration, restructuring of the existing
> Stratix10 SDRAM EDAC occurred.
> The Stratix10 peripheral support closely mirrors some of the Arria10
> peripherals and they can share functions.
> 
> Thor Thayer (6):
>   arm64: dts: stratix10: Additions to EDAC System Manager
>   EDAC, altera: Combine Stratix10 and Arria10 probe functions
>   arm64: dts: stratix10: Add SDRAM node
>   EDAC, altera: Merge Stratix10 into Arria10 SDRAM probe
>   EDAC, altera: Add Stratix10 peripheral support.
>   arm64: dts: stratix10: Add peripheral EDAC nodes
> 
>  arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi |  37 +-
>  drivers/edac/altera_edac.c                        | 666 +++++++---------------
>  drivers/edac/altera_edac.h                        |  73 +--
>  3 files changed, 282 insertions(+), 494 deletions(-)

I love diffstats like those and don't find anything strange in the new
additions considering that I have no clue about ARM. So once the DT
stuff has been acked, I'll take this...

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
