From: Stephen Warren <swarren@nvidia.com>
Subject: Re: [PATCH v2 01/17] fdt: Tidy up a few fdtdec problems
Date: Mon, 05 Dec 2011 14:27:57 -0700
Message-ID: <4EDD375D.9090509@nvidia.com>
References: <1322878300-5551-1-git-send-email-sjg@chromium.org>
	<1322878300-5551-2-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1322878300-5551-2-git-send-email-sjg@chromium.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Simon Glass <sjg@chromium.org>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Tom Warren <TWarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

On 12/02/2011 07:11 PM, Simon Glass wrote:
...
> +int fdtdec_get_is_enabled(const void *blob, int node)
>  {
>  	const char *cell;
>  
>  	cell = fdt_getprop(blob, node, "status", NULL);
>  	if (cell)
> -		return 0 == strcmp(cell, "ok");
> -	return default_val;
> +		return 0 == strcmp(cell, "okay");
> +	return 1;
>  }

The kernel accepts both okay (standard) and ok (non-standard). I assume
the latter is required for some in-use-but-technically-incorrect .dts
files. I imagine U-Boot should act like the kernel here.

(Sorry if I wasn't clear here before; that's certainly what I intended
to mean)

-- 
nvpublic
