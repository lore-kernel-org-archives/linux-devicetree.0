From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 0/3] at_hdmac: dt dma bindings update
Date: Thu, 30 May 2013 18:37:54 +0200
Message-ID: <20130530163754.GB23653@game.jcrosoft.org>
References: <1369930103-11963-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1369930103-11963-1-git-send-email-ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org
Cc: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 18:08 Thu 30 May     , ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org wrote:
> From: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> 
> Hi,
> 
> This set of patches update the dt dma binding for at_hdmac since we need one
> more parameter. In order to keep backward compatibility, an existing cell will
> be used to add this parameter. Since the content of that cell will become a
> magic value due to the concatenation of the two parameters, it is time to
> use macros.

For the record this is based on the cleanup branch for 3.11

Best Regards,
J.
> 
> Regards
> 
> Ludovic Desroches (3):
>   ARM: at91: dt: add header to define at_hdmac configuration
>   ARM: at91: dt: switch DMA DT bindings to pre-processor
>   at_hdmac: add FIFO configuration parameter to DMA DT binding
> 
>  .../devicetree/bindings/dma/atmel-dma.txt          |  7 ++++--
>  arch/arm/boot/dts/at91sam9g45.dtsi                 |  5 ++--
>  arch/arm/boot/dts/at91sam9n12.dtsi                 | 11 +++++----
>  arch/arm/boot/dts/at91sam9x5.dtsi                  | 17 +++++++-------
>  arch/arm/boot/dts/sama5d3.dtsi                     | 19 +++++++--------
>  drivers/dma/at_hdmac.c                             | 25 ++++++++++++++++----
>  include/dt-bindings/dma/at91.h                     | 27 ++++++++++++++++++++++
>  7 files changed, 81 insertions(+), 30 deletions(-)
>  create mode 100644 include/dt-bindings/dma/at91.h
> 
> -- 
> 1.7.11.3
> 
