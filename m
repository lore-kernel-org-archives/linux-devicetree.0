From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 0/4] of: remove *phandle properties from expanded
 device tree
Date: Thu, 15 Jun 2017 18:31:02 -0700
Message-ID: <594334D6.8040307@gmail.com>
References: <1497073632-22402-1-git-send-email-frowand.list@gmail.com>
 <1497571590.2897.88.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1497571590.2897.88.camel-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/15/17 17:06, Benjamin Herrenschmidt wrote:
> On Fri, 2017-06-09 at 22:47 -0700, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>> From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
>>
>> Remove "phandle" and "linux,phandle" properties from the internal
>> device tree.  The phandle will still be in the struct device_node
>> phandle field.
>>
>> This is to resolve the issue found by Stephen Boyd [1] when he changed
>> the type of struct property.value from void * to const void *.  As
>> a result of the type change, the overlay code had compile errors
>> where the resolver updates phandle values.
> 
> Piggy back on the powerpc breakage thread...
> 
> So various things in userspace will consume these. The main one is
> kexec which needs them to rebuild a fdt. So if you're going to do that
> you need to modify the sysfs code to expose a phandle attribute from
> the device node ->phandle.

Hi Ben,

Thanks for the comment.  My devicetree knowledge related to powerpc
is more limited than I would like, so any insights from you are
greatly appreciated.

/proc/device-tree is a documented ABI, so the patches do contain files
there for phandle.  (See the new function __of_add_phandle_sysfs() if
you want details.)  One difference from before is that if more than one of
"phandle", "linux,phandle", or "ibm,phandle" exist for a node, there will
only be one file "phandle" for the node under /proc/device-tree.  This
reflects the reality that the struct device_node phandle field has been
collapsing the three different properties into a single value.

For any interested parties, the current status (thanks to Guenter's
debugging efforts) is that the struct device_node type field is
NULL when it should contain a pointer to a type.  I am in the process
of setting up a qemu environment so I can debug the problem directly
instead of burdening Guenter with the extra work.  Rob is planning
to (or may have already) removed the patch series from the branch
that feeds into -next.

Thanks,

Frank
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
