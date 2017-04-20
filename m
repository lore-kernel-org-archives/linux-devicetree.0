From: Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH] of: introduce event tracepoints for dynamic device_node
 lifecyle
Date: Thu, 20 Apr 2017 09:37:04 -0400
Message-ID: <20170420093704.577f262d@gandalf.local.home>
References: <1492475525-10827-1-git-send-email-tyreld@linux.vnet.ibm.com>
        <58F6AA35.2040902@gmail.com>
        <87efwp6v4e.fsf@concordia.ellerman.id.au>
        <1d51a229-612b-bf09-93d5-6e43b476e2cf@gmail.com>
        <20170419223342.0bbe2593@grimm.local.home>
        <90e008a7-0660-99b9-edbe-6bf146268ba8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <90e008a7-0660-99b9-edbe-6bf146268ba8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tyrel Datwyler <turtle.in.the.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tyrel Datwyler <tyreld-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nfont-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 19 Apr 2017 22:24:58 -0700
Tyrel Datwyler <turtle.in.the.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> On 04/19/2017 07:33 PM, Steven Rostedt wrote:
> > On Wed, 19 Apr 2017 16:27:10 -0700
> > Tyrel Datwyler <turtle.in.the.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >   
> >> # echo stacktrace > /sys/kernel/debug/tracing/trace_options
> >> # cat trace | grep -A6 "/pci@800000020000018"  
> > 
> > Just to let you know that there is now stacktrace event triggers, where
> > you don't need to stacktrace all events, you can pick and choose. And
> > even filter the stack trace on specific fields of the event.  
> 
> This is great, and I did figure that out this afternoon. One thing I was
> still trying to determine though was whether its possible to set these
> triggers at boot? As far as I could tell I'm still limited to
> "trace_options=stacktrace" as a kernel boot parameter to get the stack
> for event tracepoints.

No not yet. But I'll add that to the todo list.

Thanks,

-- Steve
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
