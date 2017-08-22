From: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [PATCH v2 2/5] powerpc: pseries: vio: match parent nodes with of_find_node_by_path
Date: Tue, 22 Aug 2017 15:12:17 +1000
Message-ID: <87fuckb2z2.fsf@concordia.ellerman.id.au>
References: <20170821151651.25096-1-robh@kernel.org> <20170821151651.25096-3-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170821151651.25096-3-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, David Laight <David.Laight-JxhZ9S5GRejQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:

> In preparation to remove the full path from device_node.full_name, use
> of_find_node_by_path instead of open coding with strcmp.
>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
> Cc: Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
> Cc: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
> Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> ---
> v2:
> - rebased to linux-next and removed spurious change fro patch 1.
>
>  arch/powerpc/platforms/pseries/vio.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/pseries/vio.c
> index aa5ca74316fa..5754572deb23 100644
> --- a/arch/powerpc/platforms/pseries/vio.c
> +++ b/arch/powerpc/platforms/pseries/vio.c
> @@ -1357,9 +1357,9 @@ struct vio_dev *vio_register_device_node(struct device_node *of_node)
>  	 */
>  	parent_node = of_get_parent(of_node);
>  	if (parent_node) {
> -		if (!strcmp(parent_node->full_name, "/ibm,platform-facilities"))
> +		if (parent_node == of_find_node_by_path("/ibm,platform-facilities"))
>  			family = PFO;
> -		else if (!strcmp(parent_node->full_name, "/vdevice"))
> +		else if (parent_node == of_find_node_by_path("/vdevice"))
>  			family = VDEVICE;

This leaks references to the looked up nodes.

Both these nodes are defined in PAPR (our hypervisor spec), and both of
them must have a device_type, either "ibm,platform-facilities" or
"vdevice".

Looking at the commit that added the code I don't see any particular
reason it used the comparison against full_name, rather than using the
device_type.

So I'm inclined to do this instead:

diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/pseries/vio.c
index 8a47f168476b..f26f906e6021 100644
--- a/arch/powerpc/platforms/pseries/vio.c
+++ b/arch/powerpc/platforms/pseries/vio.c
@@ -1357,9 +1357,9 @@ struct vio_dev *vio_register_device_node(struct device_node *of_node)
 	 */
 	parent_node = of_get_parent(of_node);
 	if (parent_node) {
-		if (!strcmp(parent_node->full_name, "/ibm,platform-facilities"))
+		if (!strcmp(parent_node->type, "ibm,platform-facilities"))
 			family = PFO;
-		else if (!strcmp(parent_node->full_name, "/vdevice"))
+		else if (!strcmp(parent_node->type, "vdevice"))
 			family = VDEVICE;
 		else {
 			pr_warn("%s: parent(%s) of %s not recognized.\n",


I've checked both Qemu and kvmtool add the device_type, and I'm fairly
confident that PowerVM does too. Anyway I'll test it on all the machines
I can find.

cheers
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
