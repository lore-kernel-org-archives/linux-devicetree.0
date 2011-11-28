From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 01/14] fdt: Tidy up a few fdtdec problems
Date: Mon, 28 Nov 2011 11:33:22 -0700
Message-ID: <4ED3D3F2.8070302@nvidia.com>
References: <1322106896-23054-2-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1322106896-23054-2-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Albert ARIBAUD <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/23/2011 08:54 PM, Simon Glass wrote:
> This fixes three trivial issues in fdtdec.c:
> 1. fdtdec_get_is_enabled() doesn't really need a default value
> 2. The fdt must be word-aligned, since otherwise it will fail on ARM
> 3. The compat_names[] array is missing its first element

> diff --git a/lib/fdtdec.c b/lib/fdtdec.c
...
>  #define COMPAT(id, name) name
>  static const char * const compat_names[COMPAT_COUNT] = {
> +	COMPAT(UNKNOWN, "<none>"),
>  };

Could you educate me on why that change is necessary? Maybe explain this
in the commit description?

> -int fdtdec_get_is_enabled(const void *blob, int node, int default_val)
> +int fdtdec_get_is_enabled(const void *blob, int node)
>  {
>  	const char *cell;
>  
>  	cell = fdt_getprop(blob, node, "status", NULL);
>  	if (cell)
>  		return 0 == strcmp(cell, "ok");
> -	return default_val;
> +	return 1;
>  }

Not that this patch changes this, but isn't "okay" also a legal
"enabled" value, and perhaps even the recommended value? See
http://lists.ozlabs.org/pipermail/devicetree-discuss/2011-July/006389.html.

-- 
nvpublic
