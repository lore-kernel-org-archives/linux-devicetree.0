From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/2] ARM: dts: at_xdmac: add bindings documentation
Date: Fri, 04 Jul 2014 16:48:42 +0400
Message-ID: <53B6A2AA.4000202@cogentembedded.com>
References: <1404459370-3540-1-git-send-email-ludovic.desroches@atmel.com> <1404459370-3540-3-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404459370-3540-3-git-send-email-ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: arnd-r2nGTMty4D4@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 07/04/2014 11:36 AM, Ludovic Desroches wrote:

> Add bindings documentation for the new Atmel DMA controller (XDMAC)
> introduced with SAMA5D4.

> Signed-off-by: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> ---
>   .../devicetree/bindings/dma/atmel-xdma.txt         |   39 ++++++++++++++++++++
>   1 file changed, 39 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/dma/atmel-xdma.txt

> diff --git a/Documentation/devicetree/bindings/dma/atmel-xdma.txt b/Documentation/devicetree/bindings/dma/atmel-xdma.txt
> new file mode 100644
> index 0000000..1e09fda
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/atmel-xdma.txt
[...]
> +DMA clients connected to the Atmel XDMA controller must use the format
> +described in the dma.txt file, using a three-cell specifier for each channel:
> +a phandle plus two integer cells.

    Specifiers do not include phandle.

> +The two cells in order are:

    s/two/three/?

> +
> +1. A phandle pointing to the DMA controller.
> +2. The memory interface (16 most significant bits), the peripheral interface
> +(16 less significant bits).
> +3. Channel configuration register. Configurable fields are:
> +  - bit 30-24: PERID, peripheral identifier.

WBR, Sergei


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
