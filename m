From: Nathan Lynch <Nathan_Lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH] dt:numa: adding numa node mapping for memory nodes.
Date: Wed, 17 Sep 2014 16:48:39 -0500
Message-ID: <541A01B7.8030601@mentor.com>
References: <1410944189-3608-1-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410944189-3608-1-git-send-email-ganapatrao.kulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ganapatrao Kulkarni <ganapatrao.kulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/17/2014 03:56 AM, Ganapatrao Kulkarni wrote:
> From: Ganapatrao Kulkarni <ganapatrao.kulkarni-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> 
> This patch adds property "nid" to memory node to provide the memory range to
> numa node id mapping.
> 
> Signed-off-by: Ganapatrao Kulkarni <ganapatrao.kulkarni-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> 
> ---
>  Documentation/devicetree/bindings/numa.txt | 58 ++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/numa.txt
> 
> diff --git a/Documentation/devicetree/bindings/numa.txt b/Documentation/devicetree/bindings/numa.txt
> new file mode 100644
> index 0000000..c4a94f2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/numa.txt
> @@ -0,0 +1,58 @@
> +======================================================
> +numa id binding description
> +======================================================
> +
> +======================================================
> +1 - Introduction
> +======================================================
> +The device node  property "nid(numa node id)" can be added to memory
> +device node to map the range of memory addresses as defined in property "reg".
> +The property "nid" maps the memory range to the numa node id, which is used to
> +find the local and remory pages on numa aware systems.

"Local" and "remote" memory are notions that relate to some other
resource -- typically a CPU, but also I/O resources on some systems.  It
seems to me that a useful NUMA binding would at least specify a "nid"
property, or something like it, for both cpu and memory nodes.  But this
document speaks only of memory nodes.

As Kumar said, the device tree on powerpc server systems already has
properties that express NUMA information.  If you can get hold of a copy
of the PAPR (not ePAPR) from power.org, refer to the description of
"ibm,associativity" and related properties.  I recall that it's a bit
more complex than this proposal, though.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
