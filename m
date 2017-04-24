From: Michael Ellerman <patch-notifications-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [1/2] powerpc/pseries: fix of_node_put() underflow during dlpar remove
Date: Tue, 25 Apr 2017 08:47:24 +1000 (AEST)
Message-ID: <3wBhLN4M8Fz9s8V@ozlabs.org>
References: <1492474900-10658-1-git-send-email-tyreld@linux.vnet.ibm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1492474900-10658-1-git-send-email-tyreld-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: sachinp-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Tyrel Datwyler <tyreld-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, bharata-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, nfont-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2017-04-18 at 00:21:40 UTC, Tyrel Datwyler wrote:
> Historically device_node references were tracked using a kref embedded
> as a struct field. Commit 75b57ecf9 refactored device_nodes to be
> kobjects such that the device tree could by more simply exposed to
> userspace using sysfs. Commit 0829f6d1f6 followed up these changes to
> better control the kobject lifecycle and in particular the referecne
> counting via of_node_get(), of_node_put(), and of_node_init(). A side
> effect of this second commit was that it introduced an of_node_put()
> call when a dynamic node is detached that removes the initial kobj
> reference created by of_node_init() . Traditionally as the original
> dynamic device node user the pseries code had assumed responsibilty for
> releasing this final reference in its platform specific DLPAR detach code.
> 
> This patch fixes a refcount underflow introduced by commit 0829f6d1f6,
> and recently exposed by the upstreaming of the recount API.
> 
> Messages like the following are no longer seen in the kernel log with this
> patch following DLPAR remove operations of cpus and pci devices.
> 
>   [  269.589441] rpadlpar_io: slot PHB 72 removed
>   [  270.589997] refcount_t: underflow; use-after-free.
>   [  270.590019] ------------[ cut here ]------------
>   [  270.590025] WARNING: CPU: 5 PID: 3335 at
>      lib/refcount.c:128 refcount_sub_and_test+0xf4/0x110
> 
> Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Fixes: 0829f6d1f69e ("of: device_node kobject lifecycle fixes")
> Signed-off-by: Tyrel Datwyler <tyreld-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/68baf692c435339e6295cb470ea554

cheers
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
