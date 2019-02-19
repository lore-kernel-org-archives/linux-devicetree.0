Return-Path: <SRS0=2gpD=Q2=linux.intel.com=thor.thayer@kernel.org>
Reply-To: thor.thayer@linux.intel.com
Subject: Re: [PATCH 0/4] Update Stratix10 EDAC Bindings
References: <1548799428-10541-1-git-send-email-thor.thayer@linux.intel.com>
From: Thor Thayer <thor.thayer@linux.intel.com>
Message-ID: <81543652-7897-d23d-a52f-a51c27727a19@linux.intel.com>
Date: Tue, 19 Feb 2019 12:53:31 -0600
MIME-Version: 1.0
In-Reply-To: <1548799428-10541-1-git-send-email-thor.thayer@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: bp@alien8.de, dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org, james.morse@arm.com
Cc: devicetree@vger.kernel.org, linux-edac@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 1/29/19 4:03 PM, thor.thayer@linux.intel.com wrote:
> From: Thor Thayer <thor.thayer@linux.intel.com>
> 
> Instead of using the Arria10 (ARM32) EDAC bindings for
> Stratix10 (ARM64), create Stratix10 specific EDAC bindings
> to capture architecture differences between ARM32 and ARM64.
> This requires fixing the previous Stratix10 bindings.
> Also add the peripheral bindings for the Stratix10.
> 
> Thor Thayer (4):
>    Documentation: dt: edac: Fix Stratix10 IRQ bindings
>    Documentation: dt: edac: Add Stratix10 Peripheral bindings
>    EDAC, altera: Skip DB IRQ for Stratix10
>    arm64: dts: stratix10: Use new Stratix10 EDAC bindings
> 
>   .../devicetree/bindings/edac/socfpga-eccmgr.txt    | 129 +++++++++++++++++++--
>   arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi  |  25 ++--
>   drivers/edac/altera_edac.c                         |  31 ++---
>   3 files changed, 153 insertions(+), 32 deletions(-)
> 
Abandoning this review. As Dinh suggested, there are a few places
I can use the Stratix10 compatibles to make the code cleaner (although a 
few socfpga_is_a10() calls will remain where it makes sense).

I'll resubmit a new version with more Stratix10 compatibles.
