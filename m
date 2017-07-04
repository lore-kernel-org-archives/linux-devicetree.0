From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/2] arm64: dts: add Spreadtrum's fm support
Date: Tue, 4 Jul 2017 13:35:11 +0100
Message-ID: <20170704123510.GC21587@leverpostej>
References: <20170704101508.30946-1-chunyan.zhang@spreadtrum.com>
 <20170704101508.30946-2-chunyan.zhang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170704101508.30946-2-chunyan.zhang@spreadtrum.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Songhe Wei <songhe.wei@spreadtrum.com>, Zhongping Tan <zhongping.tan@spreadtrum.com>, Orson Zhai <orson.zhai@spreadtrum.com>, Chunyan Zhang <zhang.lyra@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 04, 2017 at 06:15:07PM +0800, Chunyan Zhang wrote:
> Added FM support for Spreadtrum's SP9860 board.
> 
> Signed-off-by: Songhe Wei <songhe.wei@spreadtrum.com>
> Signed-off-by: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
> ---
>  arch/arm64/boot/dts/sprd/sp9860g-1h10.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts b/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts
> index 0362ecd..6fe052d 100644
> --- a/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts
> +++ b/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts
> @@ -39,6 +39,10 @@
>  		#size-cells = <2>;
>  		ranges;
>  	};
> +
> +	sprd-fm {
> +		compatible  = "sprd,marlin2-fm";
> +	};

What kind of device is this? MMIO?

It seems to be sitting directly under the root node, but has no reg or
relationship with another bus defined, so something is missing.

This will need binding documentation.

Thanks,
Mark.


>  };
>  
>  &uart0 {
> -- 
> 2.7.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
