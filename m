From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH 3/5] of/device: Make of_get_next_child() check status
	properties
Date: Wed, 8 Dec 2010 15:01:02 -0600
Message-ID: <20101208150102.69b8062b@udp111988uds.am.freescale.net>
References: <cover.1291799069.git.deepak_saxena@mentor.com>
	<20101208192944.GE32473@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <20101208192944.GE32473@mentor.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Deepak Saxena <deepak_saxena@mentor.com>
Cc: devicetree-discuss@ozlabs.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Wed, 8 Dec 2010 11:29:44 -0800
Deepak Saxena <deepak_saxena@mentor.com> wrote:

> We only return the next child if the device is available.
> 
> Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
> Signed-off-by: Deepak Saxena <deepak_saxena@mentor.com>
> ---
>  drivers/of/base.c |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 5d269a4..81b2601 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -321,6 +321,8 @@ struct device_node *of_get_next_parent(struct device_node *node)
>   *
>   *	Returns a node pointer with refcount incremented, use
>   *	of_node_put() on it when done.
> + *
> + *	Does not return nodes marked unavailable by a status property.
>   */
>  struct device_node *of_get_next_child(const struct device_node *node,
>  	struct device_node *prev)
> @@ -330,7 +332,7 @@ struct device_node *of_get_next_child(const struct device_node *node,
>  	read_lock(&devtree_lock);
>  	next = prev ? prev->sibling : node->child;
>  	for (; next; next = next->sibling)
> -		if (of_node_get(next))
> +		if (of_device_is_available(next) && of_node_get(next))
>  			break;
>  	of_node_put(prev);
>  	read_unlock(&devtree_lock);

This seems like too low-level a place to put this.  Some code may know
how to un-disable a device in certain situations, or it may be part of
debug code trying to dump the whole device tree, etc.  Looking
further[1], I see a raw version of this function, but not other things
like of_find_compatible_node.

Could this be done more othogonally, so that the caller specifies in a
parameter whether to skip based on status?

-Scott

[1] For some reason I received some of these patches from
linuxppc-dev, and others from devicetree-discuss.  I wish lists
wouldn't try to be "smart" about discarding duplicates -- it messes with
filters.
