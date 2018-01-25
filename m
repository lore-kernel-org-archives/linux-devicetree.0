From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v2 0/1] of: easier debugging for node life cycle
 issues
Date: Wed, 24 Jan 2018 22:55:13 -0800
Message-ID: <00fc90ee-de26-f819-9c81-27d06918564d@gmail.com>
References: <20180121143117.19805-1-wsa+renesas@sang-engineering.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180121143117.19805-1-wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>
Cc: Tyrel Datwyler <tyreld-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Steve,

On 01/21/18 06:31, Wolfram Sang wrote:
> I got a bug report for a DT node refcounting problem in the I2C subsystem. This
> patch was a huge help in validating the bug report and the proposed solution.
> So, I thought I bring it to attention again. Thanks Tyrel, for the initial
> work!
> 
> Note that I did not test the dynamic updates, only of_node_{get|put} so far. I
> read that Tyrel checked dynamic updates extensively with this patch. And since
> DT overlays are also used within our Renesas dev team, this will help there, as
> well.
> 
> Tested on a Renesas Salvator-XS board (R-Car H3).
> 
> Changes since RFC v1:
> 	* rebased to v4.15-rc8
> 	* fixed commit abbrev and one of the sysfs paths in commit desc
> 	* removed trailing space and fixed pointer declaration in code
> 
> I consider all the remaining checkpatch issues irrelevant for this patch.
> 
> So what about applying it?
> 
> Kind regards,
> 
>    Wolfram
> 
> 
> Tyrel Datwyler (1):
>   of: introduce event tracepoints for dynamic device_node lifecyle
> 
>  drivers/of/dynamic.c      | 32 ++++++----------
>  include/trace/events/of.h | 93 +++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 105 insertions(+), 20 deletions(-)
>  create mode 100644 include/trace/events/of.h
> 

Off the top of your head, can you tell me know early in the boot
process a trace_event can be called and successfully provide the
data to someone trying to debug early boot issues?

Also, way back when version 1 of this patch was being discussed,
a question about stacktrace triggers:

     >>> # echo stacktrace > /sys/kernel/debug/tracing/trace_options
     >>> # cat trace | grep -A6 "/pci@800000020000018"  
     >>
     >> Just to let you know that there is now stacktrace event triggers, where
     >> you don't need to stacktrace all events, you can pick and choose. And
     >> even filter the stack trace on specific fields of the event.  
     >
     > This is great, and I did figure that out this afternoon. One thing I was
     > still trying to determine though was whether its possible to set these
     > triggers at boot? As far as I could tell I'm still limited to
     > "trace_options=stacktrace" as a kernel boot parameter to get the stack
     > for event tracepoints.

     No not yet. But I'll add that to the todo list.

     Thanks,

     -- Steve

Is this still on your todo list, or is it now available?

Thanks,

Frank
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
