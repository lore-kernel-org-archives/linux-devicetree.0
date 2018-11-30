From: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH] ARM: dts: socfpga: remove incorrect 0x leading
Date: Fri, 30 Nov 2018 10:02:49 -0600
Message-ID: <a8b55198-ed1d-08d3-c3ea-159dade5d98c@kernel.org>
References: <20181129125649.4060-1-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181129125649.4060-1-peron.clem@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 11/29/18 6:56 AM, Clément Péron wrote:
> unit-address does not have a leading "0x" (the number is assumed to be hexadecimal).
> 
> Signed-off-by: Clément Péron <peron.clem@gmail.com>
> ---
>  arch/arm/boot/dts/socfpga.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied!

Thanks,
Dinh
