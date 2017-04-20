From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: introduce event tracepoints for dynamic device_node
 lifecyle
Date: Wed, 19 Apr 2017 22:13:13 -0700
Message-ID: <58F84369.3080304@gmail.com>
References: <1492475525-10827-1-git-send-email-tyreld@linux.vnet.ibm.com>
 <58F6AA35.2040902@gmail.com> <87efwp6v4e.fsf@concordia.ellerman.id.au>
 <1d51a229-612b-bf09-93d5-6e43b476e2cf@gmail.com> <58F83C66.7030806@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <58F83C66.7030806-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tyrel Datwyler <turtle.in.the.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Tyrel Datwyler <tyreld-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nfont-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org, mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/19/17 21:43, Frank Rowand wrote:
> On 04/19/17 16:27, Tyrel Datwyler wrote:
>> On 04/18/2017 06:31 PM, Michael Ellerman wrote:

< snip >

>>
>> To get that same info as far as I know is to add a dump_stack() after
>> each pr_debug.
> 
> Here is a patch that I have used.  It is not as user friendly in terms
> of human readable stack traces (though a very small user space program
> should be able to fix that).  The patch is cut and pasted into this
> email, so probably white space damaged.

< snip >

> +
> +	if (node) {
> +		int k;
> +		int refcount = refcount_read(&node->kobj.kref.refcount);
> +		pr_err("XXX get 0x%p %3d [0x%08lx 0x%08lx 0x%08lx 0x%08lx 0x%08lx 0x%08lx] ",
> +			node, refcount,

If this was a real patch, meant for people other than myself, the
pr_err() would instead be pr_debug().

-Frank

< snip >
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
