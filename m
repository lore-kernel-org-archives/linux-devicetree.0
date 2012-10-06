From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] devicetree: fsl.txt: Add an entry to mx27pdk board
Date: Sat, 6 Oct 2012 22:06:41 +0800
Message-ID: <20121006140639.GG20231@S2101-09.ap.freescale.net>
References: <1348661955-7258-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1348661955-7258-1-git-send-email-festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 26, 2012 at 09:19:15AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> Add an entry to mx27pdk board (or also known as mx27 3ds).
> 
> Signed-off-by: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/fsl.txt |    4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.txt b/Documentation/devicetree/bindings/arm/fsl.txt
> index ac9e751..57dc148 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.txt
> +++ b/Documentation/devicetree/bindings/arm/fsl.txt
> @@ -5,6 +5,10 @@ i.MX23 Evaluation Kit
>  Required root node properties:
>      - compatible = "fsl,imx23-evk", "fsl,imx23";
>  
> +i.MX27 Product Development Kit

I'm wondering why fsl,imx27-pdk wasn't picked as the compatible string,
if Product Development Kit is the preferred name.

> +Required root node properties:
> +    - compatible = "fsl,imx27-3ds", "fsl,imx27";
> +

We have the following two lines in imx27-3ds.dts right now.

        model = "mx27_3ds";
        compatible = "freescale,imx27-3ds", "fsl,imx27";

The "model" property deserves a more descriptive string, while
"compatible" even needs a fixing, s/freescale/fsl.

>  i.MX28 Evaluation Kit
>  Required root node properties:
>      - compatible = "fsl,imx28-evk", "fsl,imx28";
> -- 
> 1.7.9.5
> 
