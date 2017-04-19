From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: introduce event tracepoints for dynamic device_node
 lifecyle
Date: Tue, 18 Apr 2017 20:12:08 -0700
Message-ID: <58F6D588.2050402@gmail.com>
References: <1492475525-10827-1-git-send-email-tyreld@linux.vnet.ibm.com>
 <58F6AA35.2040902@gmail.com> <20170418224657.1b7ed057@grimm.local.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170418224657.1b7ed057-2kNGR76GQU9OHLTnHDQRgA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>
Cc: Tyrel Datwyler <tyreld-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nfont-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org, mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/18/17 19:46, Steven Rostedt wrote:
> On Tue, 18 Apr 2017 17:07:17 -0700
> Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
> 
>> As far as I know, there is no easy way to combine trace data and printk()
>> style data to create a single chronology of events.  If some of the
>> information needed to debug an issue is trace data and some is printk()
>> style data then it becomes more difficult to understand the overall
>> situation.
> 
> You mean like:
> 
>  # echo 1 > /sys/kernel/debug/tracing/events/printk/console/enable
> 
> Makes all printks also go into the ftrace ring buffer.

Thanks!  I was hoping there was going to be an easy answer like this.


> -- Steve
> 
>>
>> If Rob wants to convert printk() style data to trace data (and I can't
>> convince him otherwise) then I will have further comments on this specific
>> patch.
>>
> .
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
