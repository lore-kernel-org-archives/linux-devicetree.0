From: Michael Ellerman <michael-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [PATCH v2 3/7] dt/powerpc/powernv: Use of_get_child_by_name to
 get a named child.
Date: Mon, 17 Sep 2012 12:07:48 +1000
Message-ID: <1347847668.28674.3.camel@concordia>
References: <1347610743-20189-1-git-send-email-srinivas.kandagatla@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1347610743-20189-1-git-send-email-srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2012-09-14 at 09:19 +0100, Srinivas KANDAGATLA wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
> 
> As follow-up to "dt: introduce of_get_child_by_name to get child node by
> name." patch, This patch removes some of the code duplication in the
> driver by replacing it with of_get_child_by_name instead.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
> ---
>  arch/powerpc/platforms/powernv/opal.c |    6 ++----
>  1 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
> index aaa0dba..6dfb8af 100644
> --- a/arch/powerpc/platforms/powernv/opal.c
> +++ b/arch/powerpc/platforms/powernv/opal.c
> @@ -294,11 +294,9 @@ static int __init opal_init(void)
>  		consoles = of_node_get(opal_node);
>  
>  	/* Register serial ports */
> -	for_each_child_of_node(consoles, np) {
> -		if (strcmp(np->name, "serial"))
> -			continue;
> +	np = of_get_child_by_name(consoles, "serial");
> +	if (np)
>  		of_platform_device_create(np, NULL, NULL);
> -	}
>  	of_node_put(consoles);

You've introduced a refcounting bug here.

The return value of of_get_child_by_name() has its refcount elevated
(via of_node_get()), so you have to drop that reference with
of_node_put().

The old code was safe because it only used np inside the loop, and the
loop logic deals with dropping the refcount for you.

And yes of_platform_device_create() takes a reference for itself.

cheers
