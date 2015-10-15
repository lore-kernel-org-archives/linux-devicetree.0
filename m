From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH 3/3] ARM: at91/defconfig: update sama5 defconfig
Date: Thu, 15 Oct 2015 15:24:51 +0200
Message-ID: <20151015132451.GD3421@piout.net>
References: <1444824684-24526-1-git-send-email-ludovic.desroches@atmel.com>
 <1444824684-24526-3-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1444824684-24526-3-git-send-email-ludovic.desroches@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ludovic Desroches <ludovic.desroches@atmel.com>
Cc: nicolas.ferre@atmel.com, plagnioj@jcrosoft.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cyrille.pitchen@atmel.com
List-Id: devicetree@vger.kernel.org

Hi,

On 14/10/2015 at 14:11:24 +0200, Ludovic Desroches wrote :
> Add SAMA5D2 SoC plus Atmel flexcom and Atmel sdhci devices.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> ---
>  arch/arm/configs/sama5_defconfig | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
It is probably worth updating the multi_v7_defconfig too (in a separate
patch).


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
