From: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: introduce the sama5d2 ptc ek board
Date: Tue, 5 Dec 2017 19:01:41 +0200
Message-ID: <20171205170141.qleqh6rou2ow54je@tarshish.tkos.co.il>
References: <20171205142312.21506-1-ludovic.desroches@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171205142312.21506-1-ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ludovic Desroches <ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Ludovic,

On Tue, Dec 05, 2017 at 03:23:12PM +0100, Ludovic Desroches wrote:
> Add the official SAMA5D2 Peripheral Touch Controller Evaluation
> Kit board.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> ---

[...]

> +	memory {
> +		reg = <0x20000000 0x80000>;
> +	};

The size value is clearly wrong; you surely don't run on 512KB RAM. You most 
likely rely on the bootloader to fix the size value. Since sama5d2.dtsi has a 
memory node already with the same address, you can just drop it from here.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org - tel: +972.52.368.4656, http://www.tkos.co.il -
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
