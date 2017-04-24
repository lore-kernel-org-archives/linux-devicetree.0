From: Michael Ellerman <patch-notifications-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [2/2] powerpc/sysfs: fix reference leak of cpu device_nodes present at boot
Date: Tue, 25 Apr 2017 08:47:25 +1000 (AEST)
Message-ID: <3wBhLP3Qv3z9s8W@ozlabs.org>
References: <1492475079-10740-1-git-send-email-tyreld@linux.vnet.ibm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1492475079-10740-1-git-send-email-tyreld-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: sachinp-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sudeep.karkadanagesha-5wv7dgnIgG8@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Tyrel Datwyler <tyreld-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, bharata-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, nfont-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2017-04-18 at 00:24:39 UTC, Tyrel Datwyler wrote:
> For cpus present at boot each logical cpu acquires a reference to the
> associated device node of the core. This happens in register_cpu() which
> is called by topology_init(). The result of this is that we end up with
> a reference held by each thread of the core. However, these references
> are never freed if the cpu core is dlpar removed.
> 
> This patch fixes the reference leaks by acquiring and releasing the
> references in the cpu hotplug callbacks un/register_cpu_online().
> With this patch symmetric reference counting is observed with both cpus
> present at boot, and those dlpar added after boot.
> 
> Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> fixes: f86e4718f24b ("driver/core: cpu: initialize of_node in cpu's device struture")
> Signed-off-by: Tyrel Datwyler <tyreld-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/e76ca27790a514590af782f83f6eae

cheers
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
