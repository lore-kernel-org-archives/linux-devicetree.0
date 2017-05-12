From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: Document optional "reserved-names" property
Date: Fri, 12 May 2017 18:55:01 -0500
Message-ID: <20170512235501.ziplwgevcjqyjims@rob-hp-laptop>
References: <20170509171847.27457-1-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170509171847.27457-1-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, stewart-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, May 09, 2017 at 10:18:47AM -0700, Florian Fainelli wrote:
> Define an optional string property: "reserved-names" which can be used
> by the client program to tag/identify reserved memory regions.
> 
> Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> index 3da0ebdba8d9..bd3c9485f637 100644
> --- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> +++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> @@ -64,6 +64,10 @@ reusable (optional) - empty property
>        system can use that region to store volatile or cached data that
>        can be otherwise regenerated or migrated elsewhere.
>  
> +reserved-names (optional)
> +    - Provides a named tag to the client program to help pretty print/identify
> +      the reserved memory region.

*-names is normally on the client side. I'd like to keep that 
consistent.

Second, I don't see the need for this. The compatible is not enough?

Rob
