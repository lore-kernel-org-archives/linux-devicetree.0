From: Michael Ellerman <michael-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [RESEND PATCH v3 2/5] dt/powerpc/powernv: Use
 of_get_child_by_name to get a named child.
Date: Tue, 18 Sep 2012 11:32:39 +1000
Message-ID: <1347931959.7046.1.camel@concordia>
References: <1347883109-16714-1-git-send-email-srinivas.kandagatla@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1347883109-16714-1-git-send-email-srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
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
To: Srinivas KANDAGATLA <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2012-09-17 at 12:58 +0100, Srinivas KANDAGATLA wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
> 
> As follow-up to "dt: introduce of_get_child_by_name to get child node by
> name." patch, This patch removes some of the code duplication in the
> driver by replacing it with of_get_child_by_name instead.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
> ---
>  arch/powerpc/platforms/powernv/opal.c |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
> index aaa0dba..fc7ae70 100644
> --- a/arch/powerpc/platforms/powernv/opal.c
> +++ b/arch/powerpc/platforms/powernv/opal.c
> @@ -294,9 +294,9 @@ static int __init opal_init(void)
>  		consoles = of_node_get(opal_node);
>  
>  	/* Register serial ports */
> -	for_each_child_of_node(consoles, np) {
> -		if (strcmp(np->name, "serial"))
> -			continue;
> +	np = of_get_child_by_name(consoles, "serial");
> +	if (np) {
> +		of_node_put(np);
>  		of_platform_device_create(np, NULL, NULL);

You mustn't drop the reference until after you've finished with np, as
you have written it the node could be freed before you call
of_platform_device_create().

cheers
