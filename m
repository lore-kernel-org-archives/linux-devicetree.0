From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 0/4] Add Stratix10 OCRAM & SDMMC EDAC Support
Date: Fri, 10 May 2019 16:34:13 +0200
Message-ID: <20190510143413.GC29927@zn.tnic>
References: <1556030197-24534-1-git-send-email-thor.thayer@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1556030197-24534-1-git-send-email-thor.thayer@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thor.thayer@linux.intel.com
Cc: mchehab@kernel.org, james.morse@arm.com, dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 23, 2019 at 09:36:33AM -0500, thor.thayer@linux.intel.com wrote:
> From: Thor Thayer <thor.thayer@linux.intel.com>
> 
> This patch series adds EDAC support for the Stratix10 OCRAM
> and SDMMC peripherals.
> 
> Thor Thayer (4):
>   EDAC, altera: Add Stratix10 OCRAM ECC support
>   arm64: dts: stratix10: Add OCRAM EDAC node
>   EDAC, altera: Add Stratix10 SDMMC support
>   arm64: dts: stratix10: Add SDMMC EDAC node
> 
>  arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi  |  8 ++++
>  .../boot/dts/altera/socfpga_stratix10_socdk.dts    | 11 ++++++
>  drivers/edac/altera_edac.c                         | 43 ++++++++++++++++++++--
>  3 files changed, 59 insertions(+), 3 deletions(-)
> 
> -- 

All 4 queued locally, will appear after -rc1 releases.

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
