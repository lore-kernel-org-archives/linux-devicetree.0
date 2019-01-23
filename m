Return-Path: <SRS0=xdWx=P7=alien8.de=bp@kernel.org>
Date: Wed, 23 Jan 2019 13:22:37 +0100
From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCHv2 0/4] Stratix10 EDAC Improvements
Message-ID: <20190123122237.GC3227@zn.tnic>
References: <1548179287-21760-1-git-send-email-thor.thayer@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1548179287-21760-1-git-send-email-thor.thayer@linux.intel.com>
To: thor.thayer@linux.intel.com
Cc: dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org, james.morse@arm.com, devicetree@vger.kernel.org, linux-edac@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Jan 22, 2019 at 11:48:03AM -0600, thor.thayer@linux.intel.com wrote:
> From: Thor Thayer <thor.thayer@linux.intel.com>
> 
> This patch series includes a fix, an improvement and the
> addition of OCRAM EDAC for Stratix10 SOCFPGA.
> 
> V2: Ensure the Fixes: line is on one line.
> 
> Thor Thayer (4):
>   EDAC, altera: Fix S10 persistent register offset
>   EDAC, altera: Less Intrusive Error Injection
>   EDAC, altera: Add Stratix10 OCRAM ECC support
>   arm64: dts: stratix10: Add OCRAM EDAC node
> 
>  arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi |  7 +++
>  drivers/edac/altera_edac.c                        | 52 ++++++++++++++---------
>  drivers/edac/altera_edac.h                        |  6 +--
>  3 files changed, 43 insertions(+), 22 deletions(-)

Looks ok, I'll take them when I get an ACK for the DT change in patch 4.

Patch 1 I'll send to Linus now as the broken commit is in 4.20 too.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
