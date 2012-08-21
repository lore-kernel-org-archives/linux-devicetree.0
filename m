From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] devicetree: pwm: mxs-pwm.txt: Fix reg field annotation
Date: Tue, 21 Aug 2012 13:25:51 -0500
Message-ID: <5033D2AF.8010401@gmail.com>
References: <1345564243-30085-1-git-send-email-fabio.estevam@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1345564243-30085-1-git-send-email-fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
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
To: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/21/2012 10:50 AM, Fabio Estevam wrote:
> In the reg field we should annotate the register address space in hexadecimal
> format.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---

Applied for 3.7.

Rob

> Change since v1:
> - Fix subject to include 'pwm: mxs-pwm.txt'
> 
>  Documentation/devicetree/bindings/pwm/mxs-pwm.txt |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/mxs-pwm.txt b/Documentation/devicetree/bindings/pwm/mxs-pwm.txt
> index b16f4a5..11963e4 100644
> --- a/Documentation/devicetree/bindings/pwm/mxs-pwm.txt
> +++ b/Documentation/devicetree/bindings/pwm/mxs-pwm.txt
> @@ -11,7 +11,7 @@ Example:
>  
>  pwm: pwm@80064000 {
>  	compatible = "fsl,imx28-pwm", "fsl,imx23-pwm";
> -	reg = <0x80064000 2000>;
> +	reg = <0x80064000 0x2000>;
>  	#pwm-cells = <2>;
>  	fsl,pwm-number = <8>;
>  };
> 
