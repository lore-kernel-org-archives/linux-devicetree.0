From: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCHv3] arm64: dts: stratix10: Add QSPI support for Stratix10
Date: Wed, 16 May 2018 08:36:32 -0500
Message-ID: <d6175958-41a4-8d5c-2cba-ff6bc9c74a4e@kernel.org>
References: <1526423187-27521-1-git-send-email-thor.thayer@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1526423187-27521-1-git-send-email-thor.thayer@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: thor.thayer@linux.intel.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 05/15/2018 05:26 PM, thor.thayer@linux.intel.com wrote:
> From: Thor Thayer <thor.thayer@linux.intel.com>
> 
> Add qspi_clock
>    The qspi_clk frequency is updated by U-Boot before starting Linux.
> Add QSPI interface node.
> Add QSPI flash memory child node.
>    Setup the QSPI memory in 2 partitions.
> 
> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
> ---
> v2  s/_/-/ in qspi-clk
>     rename flash node.
>     use partition child node notation
> v3  remove unused bus-num node
>     use device id from table (n25q00a)
> ---
>  arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi  | 21 +++++++++++++
>  .../boot/dts/altera/socfpga_stratix10_socdk.dts    | 35 ++++++++++++++++++++++
>  2 files changed, 56 insertions(+)
> 

Applied!

Thanks,
Dinh
