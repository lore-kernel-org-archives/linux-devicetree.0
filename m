Return-Path: <SRS0=6Z5N=VJ=linux.intel.com=thor.thayer@kernel.org>
Reply-To: thor.thayer@linux.intel.com
Subject: Re: [PATCH 0/3] Stratix10 SDRAM Common EDAC Framework
References: <1562711090-900-1-git-send-email-thor.thayer@linux.intel.com>
From: Thor Thayer <thor.thayer@linux.intel.com>
Message-ID: <08ec9a1b-bc01-bc0a-b35d-4997d27bfdf8@linux.intel.com>
Date: Fri, 12 Jul 2019 10:26:43 -0500
MIME-Version: 1.0
In-Reply-To: <1562711090-900-1-git-send-email-thor.thayer@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: bp@alien8.de, mchehab@kernel.org, james.morse@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, dinguyen@kernel.org
Cc: devicetree@vger.kernel.org, linux-edac@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 7/9/19 5:24 PM, thor.thayer@linux.intel.com wrote:
> From: Thor Thayer <thor.thayer@linux.intel.com>
> 
> Use the common Altera EDAC Device Framework for the SDRAM so that
> Double Bit Error Addresses can be tracked for SDRAM.
> This also simplifies the device tree.
> 
> Thor Thayer (3):
>    Documentation: dt: edac: Add reg to S10 SDRAM node
>    arm64: dts: Stratix10: Include regs in SDRAM ECC node
>    EDAC, altera: Use common framework for Stratix10 SDRAM ECC
> 
>   .../devicetree/bindings/edac/socfpga-eccmgr.txt    |  4 ++-
>   arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi  |  9 ++----
>   drivers/edac/altera_edac.c                         | 32 ++++++++++++++++++++--
>   drivers/edac/altera_edac.h                         | 25 ++++++++++++++++-
>   4 files changed, 58 insertions(+), 12 deletions(-)
> 
Please disregard this patchset, there is a simpler solution.
