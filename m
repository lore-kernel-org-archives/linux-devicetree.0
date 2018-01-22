From: Jeremy Linton <jeremy.linton-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC PATCH] Documentation: DT: arm: Add topology property to
 define package boundaries
Date: Mon, 22 Jan 2018 17:25:40 -0600
Message-ID: <dcafd8bc-1c10-bdfa-e855-5d48cfe63381@arm.com>
References: <20180122171534.7681-1-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180122171534.7681-1-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Morten Rasmussen <morten.rasmussen-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 01/22/2018 11:15 AM, Lorenzo Pieralisi wrote:
> The current ARM DT topology description provides the operating system
> with a topological view of the system that is based on leaf nodes
> representing either cores or threads (in an SMT system) and a
> hierarchical set of cluster nodes that creates a hierarchical topology
> view of how those cores and threads are grouped.
> 
> As opposed to the ACPI topology description ([1], PPTT table), this
> hierarchical representation of clusters does not allow to describe what
> topology level actually represents the physical package boundary, which
> is a key piece of information to be used by an operating system to
> optimize resource allocation and scheduling.
> 
> Define an optional, backward compatible boolean property for cluster
> nodes that, by reusing the ACPI nomenclature, add to the ARM DT
> topological description a binding to define what cluster level
> represents a physical package boundary.
> 
> [1] http://www.uefi.org/sites/default/files/resources/ACPI_6_2.pdf
> 
> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> Cc: Jeremy Linton <jeremy.linton-5wv7dgnIgG8@public.gmane.org>
> Cc: Morten Rasmussen <morten.rasmussen-5wv7dgnIgG8@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> ---
>   Documentation/devicetree/bindings/arm/topology.txt | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/topology.txt b/Documentation/devicetree/bindings/arm/topology.txt
> index de9eb0486630..8e78d76b0671 100644
> --- a/Documentation/devicetree/bindings/arm/topology.txt
> +++ b/Documentation/devicetree/bindings/arm/topology.txt
> @@ -109,6 +109,15 @@ Bindings for cluster/cpu/thread nodes are defined as follows:
>   	The cluster node name must be "clusterN" as described in 2.1 above.
>   	A cluster node can not be a leaf node.
>   
> +	Properties for cluster nodes:
> +
> +	- physical-package
> +		Usage: optional
> +		Value type: <empty>
> +		Definition: if present the cluster node represents the
> +			    boundary of a physical package, whether socketed
> +			    or surface mounted.
> +
>   	A cluster node's child nodes must be:
>   
>   	- one or more cluster nodes; or
> 

Looks good so far, but I would worry about it being optional. That 
seemed like a mistake on the ACPI side.

Assuming it is optional, it might be worth a sentence explaining what 
the fallback behavior is if the property is missing.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
