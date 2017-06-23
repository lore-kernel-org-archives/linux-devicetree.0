From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3] vsprintf: Add %p extension "%pOF" for device tree
Date: Fri, 23 Jun 2017 10:38:08 -0700
Message-ID: <1498239488.24295.20.camel@perches.com>
References: <20170622204445.14930-1-robh@kernel.org>
         <20170623173053.636-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170623173053.636-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2017-06-23 at 12:30 -0500, Rob Herring wrote:
> From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> 
> 90% of the usage of device node's full_name is printing it out in a
> kernel message. However, storing the full path for every node is
> wasteful and redundant. With a custom format specifier, we can generate
> the full path at run-time and eventually remove the full path from every
> node.
> 
> For instance typical use is:
> 	pr_info("Frobbing node %s\n", node->full_name);
> 
> Which can be written now as:
> 	pr_info("Frobbing node %pOF\n", node);
> 
> '%pO' is the base specifier to represent kobjects with '%pOF'
> representing struct device_node. Currently, struct device_node is the
> only supported type of kobject.
> 
> More fine-grained control of formatting includes printing the name,
> flags, path-spec name and others, explained in the documentation entry.
> 
> Originally written by Pantelis, but pretty much rewrote the core
> function using existing string/number functions. The 2 passes were
> unnecessary and have been removed. Also, updated the checkpatch.pl
> check. The unittest code was written by Grant Likely.
> 
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
> v3:
> - Fix missing documentation updates using '%pOF' as the device_node 
>   specifier.
> - Update the commit msg and documentation to clearly define '%pO' is the
>   base specifier for kobjects.
> - Rework device_node_gen_full_name() to avoid creating an array of node
>   pointers on the stack.

Thanks Rob.

This all seems sensible to me now.

If you want:

Acked-by: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>

cheers, Joe

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
