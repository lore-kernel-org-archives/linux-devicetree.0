Return-Path: <robherring2@gmail.com>
Date: Mon, 19 Feb 2018 09:50:50 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: usb: fix the STM32F7 DWC2 OTG HS core
 binding
Message-ID: <20180219155050.66n6db3pdo3vub4p@rob-hp-laptop>
References: <1518709601-17232-1-git-send-email-amelie.delaunay@st.com>
 <1518709601-17232-3-git-send-email-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1518709601-17232-3-git-send-email-amelie.delaunay@st.com>
To: Amelie Delaunay <amelie.delaunay@st.com>
Cc: John Youn <johnyoun@synopsys.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, Feb 15, 2018 at 04:46:40PM +0100, Amelie Delaunay wrote:
> This patch fixes binding documentation for DWC2 controller in HS mode
> found on STMicroelectronics STM32F7 SoC.
> The v2 former patch [1] had been acked by Rob Herring, but v1 was merged.
> 
> [1] https://patchwork.kernel.org/patch/9925575/
> 
> Fixes: 000777dadc7e ("dt-bindings: usb: Document the STM32F7xx DWC2 ...")
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
