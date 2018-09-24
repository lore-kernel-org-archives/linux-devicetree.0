Return-Path: <dinguyen@kernel.org>
Subject: Re: [PATCH 6/6] arm64: dts: stratix10: Add peripheral EDAC nodes
References: <1537385941-11582-1-git-send-email-thor.thayer@linux.intel.com>
 <1537385941-11582-7-git-send-email-thor.thayer@linux.intel.com>
From: Dinh Nguyen <dinguyen@kernel.org>
Message-ID: <5cdee9ac-855a-aed3-7ee8-9a535cba6fca@kernel.org>
Date: Mon, 24 Sep 2018 10:41:27 -0500
MIME-Version: 1.0
In-Reply-To: <1537385941-11582-7-git-send-email-thor.thayer@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: thor.thayer@linux.intel.com, robh+dt@kernel.org, mark.rutland@arm.com, bp@alien8.de, mchehab@kernel.org
Cc: devicetree@vger.kernel.org, linux-edac@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On 09/19/2018 02:39 PM, thor.thayer@linux.intel.com wrote:
> From: Thor Thayer <thor.thayer@linux.intel.com>
> 
> Add the usb and ethernet peripheral ECC nodes using the
> Arria10 format.
> 
> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
> ---
>  arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 27 ++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> index ee1d4b8ba631..f9cdbb82deeb 100644
> --- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> +++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> @@ -473,7 +473,7 @@
>  		};

Acked-by: Dinh Nguyen <dinguyen@kernel.org>
