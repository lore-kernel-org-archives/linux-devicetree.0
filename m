From: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH] ARM: dts: socfpga: use tabs for indentation
Date: Fri, 9 Nov 2018 15:08:01 -0600
Message-ID: <0ade3acc-4e92-8cd0-c4bb-249c00503f32@kernel.org>
References: <20181105203900.23788-1-simon.k.r.goldschmidt@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181105203900.23788-1-simon.k.r.goldschmidt@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marek Vasut <marex@denx.de>
List-Id: devicetree@vger.kernel.org



On 11/5/18 2:39 PM, Simon Goldschmidt wrote:
> In two of the gen5 socfpga devicetree files, there are some lines
> indented using spaces instead of tabs.
> 
> Fix this by correctly indenting them with tabs.
> 
> Signed-off-by: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
> ---
>  arch/arm/boot/dts/socfpga.dtsi               | 2 +-
>  arch/arm/boot/dts/socfpga_cyclone5_sodia.dts | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied!

Thanks,
Dinh
