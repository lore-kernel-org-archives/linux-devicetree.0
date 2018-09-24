Return-Path: <dinguyen@kernel.org>
Subject: Re: [PATCH 1/6] arm64: dts: stratix10: Additions to EDAC System
 Manager
References: <1537385941-11582-1-git-send-email-thor.thayer@linux.intel.com>
 <1537385941-11582-2-git-send-email-thor.thayer@linux.intel.com>
From: Dinh Nguyen <dinguyen@kernel.org>
Message-ID: <08800670-b2a1-9957-3d8c-05ff2268d7d9@kernel.org>
Date: Mon, 24 Sep 2018 10:37:43 -0500
MIME-Version: 1.0
In-Reply-To: <1537385941-11582-2-git-send-email-thor.thayer@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: thor.thayer@linux.intel.com, robh+dt@kernel.org, mark.rutland@arm.com, bp@alien8.de, mchehab@kernel.org
Cc: devicetree@vger.kernel.org, linux-edac@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On 09/19/2018 02:38 PM, thor.thayer@linux.intel.com wrote:
> From: Thor Thayer <thor.thayer@linux.intel.com>
> 
> Add the phandle, address, size and ranges to the
> Stratix10 System Manager node to match the existing
> Arria10 EDAC implementation.
> 
> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
> ---
>  arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Dinh Nguyen <dinguyen@kernel.org>
