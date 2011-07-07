From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] dt: bindings: move SEC node under new crypto/
Date: Thu, 7 Jul 2011 13:51:34 -0600
Message-ID: <20110707195134.GM2824@ponder.secretlab.ca>
References: <20110707144312.8456bf35.kim.phillips@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110707144312.8456bf35.kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 07, 2011 at 02:43:12PM -0500, Kim Phillips wrote:
> Since technically it's not powerpc arch-specific.  Also rename it sec2
> to differentiate it from its incompatible successor, the SEC 4.
> 
> Signed-off-by: Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Applied, thanks.

g.

> ---
>  .../{powerpc/fsl/sec.txt => crypto/fsl-sec2.txt}   |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>  rename Documentation/devicetree/bindings/{powerpc/fsl/sec.txt => crypto/fsl-sec2.txt} (98%)
> 
> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/sec.txt b/Documentation/devicetree/bindings/crypto/fsl-sec2.txt
> similarity index 98%
> rename from Documentation/devicetree/bindings/powerpc/fsl/sec.txt
> rename to Documentation/devicetree/bindings/crypto/fsl-sec2.txt
> index 2b6f2d4..38988ef 100644
> --- a/Documentation/devicetree/bindings/powerpc/fsl/sec.txt
> +++ b/Documentation/devicetree/bindings/crypto/fsl-sec2.txt
> @@ -1,4 +1,4 @@
> -Freescale SoC SEC Security Engines
> +Freescale SoC SEC Security Engines versions 2.x-3.x
>  
>  Required properties:
>  
> -- 
> 1.7.6
> 
> 
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
