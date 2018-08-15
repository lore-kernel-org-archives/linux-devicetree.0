From: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH] ARM: dts: socfpga: use stdout-path for chosen node
Date: Wed, 15 Aug 2018 10:09:37 -0500
Message-ID: <e209db3a-22af-ae6c-99b6-f79658530131@kernel.org>
References: <20180808090944.861-1-simon.k.r.goldschmidt@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180808090944.861-1-simon.k.r.goldschmidt@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Vasut <marex@denx.de>
List-Id: devicetree@vger.kernel.org



On 08/08/2018 04:09 AM, Simon Goldschmidt wrote:
> Use stdout-path dts property for kernel console.
> 
> There were two socfpga boards left not using stdout-path:
> socrates and vining. Make sure they match the other boards.
> 
> Signed-off-by: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
> ---
>  arch/arm/boot/dts/socfpga_cyclone5_socrates.dts    | 3 ++-
>  arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)

Applied!

Thanks,
Dinh
