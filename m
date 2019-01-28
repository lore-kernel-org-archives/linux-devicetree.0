From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 2/3] Dt-bindings: RTC: Add X1000 RTC bindings.
Date: Mon, 28 Jan 2019 21:11:53 +0100
Message-ID: <20190128201153.GC18309@piout.net>
References: <1548696599-53639-1-git-send-email-zhouyanjie@zoho.com>
 <1548696599-53639-3-git-send-email-zhouyanjie@zoho.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548696599-53639-3-git-send-email-zhouyanjie@zoho.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhou Yanjie <zhouyanjie@zoho.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, a.zummo@towertech.it, robh+dt@kernel.org, paul.burton@mips.com, mark.rutland@arm.com, syq@debian.org, jiaxun.yang@flygoat.com, 772753199@qq.com
List-Id: devicetree@vger.kernel.org

On 29/01/2019 01:29:58+0800, Zhou Yanjie wrote:
> Add the RTC bindings for the X1000 Soc from Ingenic.
> 

The subject is not properly capitalized and this patch should either
come first or be squashed in the previous one.

> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
> ---
>  Documentation/devicetree/bindings/rtc/ingenic,jz4740-rtc.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/ingenic,jz4740-rtc.txt b/Documentation/devicetree/bindings/rtc/ingenic,jz4740-rtc.txt
> index 41c7ae1..7ce0018 100644
> --- a/Documentation/devicetree/bindings/rtc/ingenic,jz4740-rtc.txt
> +++ b/Documentation/devicetree/bindings/rtc/ingenic,jz4740-rtc.txt
> @@ -5,6 +5,7 @@ Required properties:
>  - compatible: One of:
>    - "ingenic,jz4740-rtc" - for use with the JZ4740 SoC
>    - "ingenic,jz4780-rtc" - for use with the JZ4780 SoC
> +  - "ingenic,x1000-rtc" - for use with the X1000 SoC
>  - reg: Address range of rtc register set
>  - interrupts: IRQ number for the alarm interrupt
>  - clocks: phandle to the "rtc" clock
> -- 
> 2.7.4
> 
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
