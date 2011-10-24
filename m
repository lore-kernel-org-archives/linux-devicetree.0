From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3 1/2] ARM: at91: dt: at91sam9g45 family and board device
 tree files
Date: Mon, 24 Oct 2011 09:44:55 -0500
Message-ID: <4EA579E7.7000002@gmail.com>
References: <4E9F8226.4030503@gmail.com>
 <15ab652499e7f6f8a26724bfd90643a8f3f96ad9.1319464310.git.nicolas.ferre@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <15ab652499e7f6f8a26724bfd90643a8f3f96ad9.1319464310.git.nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/24/2011 09:05 AM, Nicolas Ferre wrote:
> Create a new device tree source file for Atmel at91sam9g45 SoC family.
> The Evaluation Kit at91sam9m10g45ek includes it.
> This first basic support will be populated as drivers and boards will be
> converted to device tree.
> Contains serial, dma and interrupt controllers.
> 
> The generic board file still takes advantage of platform data for early serial
> init. As we need a storage media and the NAND flash driver is not converted to
> DT yet, we keep old initialization for it.
> 

This comment is out of date for serial.

> Signed-off-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> ---
> V3:
> - additional clock lookup for device tree handling
> - devices disabled in dtsi file so that only useful devices are
>   enabled in dts files
> 
> V2: foundation for AT91SAM generic support
> - device tree focused board file
> - inclusion of USART DT support
> - early USART and NAND still using platform data
> 

Reviewed-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

Rob
