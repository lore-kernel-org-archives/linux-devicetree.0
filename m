From: Stephen Warren <swarren@nvidia.com>
Subject: Re: [PATCH v2 2/7] fdt: Add function to allow aliases to
 refer to multiple nodes
Date: Thu, 19 Jan 2012 13:49:01 -0700
Message-ID: <4F1881BD.2050704@nvidia.com>
References: <1326394818-32227-1-git-send-email-sjg@chromium.org>
	<1326394818-32227-3-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1326394818-32227-3-git-send-email-sjg@chromium.org>
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
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <TWarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

On 01/12/2012 12:00 PM, Simon Glass wrote:
> Some devices can deal with multiple compatible properties. The devices
> need to know which nodes to bind to which features. For example an
> I2C driver which supports two different controller types will want to
> know which type it is dealing with in each case.
> 
> The new fdtdec_add_aliases_for_id() function deals with this by allowing
> the driver to search for additional compatible nodes for a different ID.
> It can then detect the new ones and perform appropriate processing.
> 
> Another option considered was to return a tuple (node offset, compat id)
> and have the function be passed a list of compatible IDs. This is more
> overhead for the common case though. We may add such a function later if
> more drivers in U-Boot require it.

> +int fdtdec_add_aliases_for_id(const void *blob, const char *name,
> +			enum fdt_compat_id id, int *node_list, int maxcount)
...
> @@ -232,11 +238,13 @@ int fdtdec_find_aliases_for_id(const void *blob, const char *name,
>  		 * it as done.
>  		 */
>  		if (fdtdec_get_is_enabled(blob, node)) {
> +			if (node_list[number])
> +				continue;
>  			node_list[number] = node;
>  			if (number >= num_found)
>  				num_found = number + 1;
>  		}
> -		nodes[j] = 0;
> +		nodes[found] = 0;
>  	}
>  
>  	/* Add any nodes not mentioned by an alias */

Aren't those two changes really bug-fixes to the underlying patch rather
than part of this enhancement?

I'm not convinced this patch is correct in all cases. It'll probably
work fine for simply device-trees though. Consider the following case:

4 device nodes
A: compat=i2c alias for usb0
B: compat=i2c no alias
C: compat=i2c alias for usb2
D: compat=i2cx alias for usb1

First, we search for all compat=i2c, the list comes back:

0=A
1=B
2=C

Then we search for all compat=i2cx, the list comes back:

-1
-1
-1
D

So D's alias of 1 isn't honored even though if both IDs were searched
for together, it would have been.

Also, what about the scenario where a driver searches for both
nvidia,tegra20-i2c then later nvidia,tegra30-i2c, given that all the DT
nodes are probably compatible with both?

-- 
nvpublic
