From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 3/6] mmc: sh_mmcif: Document r8a7793 DT bindings
Date: Fri, 31 Jul 2015 13:34:01 +0300
Message-ID: <55BB4F19.40602@cogentembedded.com>
References: <1432826225-6743-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1432826225-6743-4-git-send-email-ulrich.hecht+renesas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1432826225-6743-4-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, devicetree@vger.kernel.org, geert@linux-m68k.org
Cc: horms@verge.net.au, linux-sh@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
List-Id: devicetree@vger.kernel.org

Hello.

On 5/28/2015 6:17 PM, Ulrich Hecht wrote:

> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> Acked-by: Simon Horman <horms+renesas@verge.net.au>
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: devicetree@vger.kernel.org
> ---
>   Documentation/devicetree/bindings/mmc/renesas,mmcif.txt | 1 +
>   1 file changed, 1 insertion(+)

> diff --git a/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt b/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt
> index 299081f..3b9422b 100644
> --- a/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt
> +++ b/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt
> @@ -10,6 +10,7 @@ Required properties:
>   	- "renesas,mmcif-r8a7740" for the MMCIF found in r8a7740 SoCs
>   	- "renesas,mmcif-r8a7790" for the MMCIF found in r8a7790 SoCs
>   	- "renesas,mmcif-r8a7791" for the MMCIF found in r8a7791 SoCs
> +	- "renesas,mmcif-r8a7793" for the MMCIF found in r8a7793 SoCs
>   	- "renesas,sh-mmcif" for the generic MMCIF
[...]

    Why this patch still hasn't been merged?
    (I have submitted analogous patch yesterday covering both R8A779[34], not 
knowing about this patch.)

MBR, Sergei

