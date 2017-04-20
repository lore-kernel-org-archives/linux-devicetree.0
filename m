From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: introduce event tracepoints for dynamic device_node
 lifecyle
Date: Wed, 19 Apr 2017 21:47:56 -0700
Message-ID: <58F83D7C.10000@gmail.com>
References: <1492475525-10827-1-git-send-email-tyreld@linux.vnet.ibm.com>
 <58F6AA35.2040902@gmail.com> <87efwp6v4e.fsf@concordia.ellerman.id.au>
 <1d51a229-612b-bf09-93d5-6e43b476e2cf@gmail.com>
 <20170419223342.0bbe2593@grimm.local.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170419223342.0bbe2593-2kNGR76GQU9OHLTnHDQRgA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>, Tyrel Datwyler <turtle.in.the.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Tyrel Datwyler <tyreld-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nfont-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/19/17 19:33, Steven Rostedt wrote:
> On Wed, 19 Apr 2017 16:27:10 -0700
> Tyrel Datwyler <turtle.in.the.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
>> # echo stacktrace > /sys/kernel/debug/tracing/trace_options
>> # cat trace | grep -A6 "/pci@800000020000018"
> 
> Just to let you know that there is now stacktrace event triggers, where
> you don't need to stacktrace all events, you can pick and choose. And
> even filter the stack trace on specific fields of the event.
> 
>  # cd /sys/kernel/debug/tracing
>  # echo "stacktrace if common_pid == $$ && reason == 3" \
>    > events/tlb/tlb_flush/trigger
> 
>  # cat trace
>             bash-1103  [003] ...1  1290.100133: tlb_flush: pages:-1 reason:local mm shootdown (3)
>             bash-1103  [003] ...2  1290.100140: <stack trace>
>  => copy_process.part.39
>  => _do_fork
>  => SyS_clone
>  => do_syscall_64
>  => return_from_SYSCALL_64
> 
> -- Steve
> .
> 

Thanks for chiming in.

The power and flexibility of the trace tools is quite amazing
I need to make room in my schedule to catch up on what has been
added in the last several years.

-Frank
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
