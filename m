From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: introduce event tracepoints for dynamic device_node
 lifecyle
Date: Thu, 20 Apr 2017 12:34:46 -0700
Message-ID: <58F90D56.9070602@gmail.com>
References: <1492475525-10827-1-git-send-email-tyreld@linux.vnet.ibm.com>
 <58F6AA35.2040902@gmail.com> <87efwp6v4e.fsf@concordia.ellerman.id.au>
 <1d51a229-612b-bf09-93d5-6e43b476e2cf@gmail.com> <58F83C66.7030806@gmail.com>
 <64505d40-926d-b302-4ff3-dff71aa5018a@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <64505d40-926d-b302-4ff3-dff71aa5018a-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tyrel Datwyler <turtle.in.the.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Tyrel Datwyler <tyreld-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nfont-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org, mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/20/17 09:51, Tyrel Datwyler wrote:
> On 04/19/2017 09:43 PM, Frank Rowand wrote:
> 

< snip >


>> The call stack could easily be post-processed, for example using addr2line.
>> Here is the call stack for when the refcount incremented to 23 from 22 (or
>> more accurately, to 22 from 21):
>>
>> 0xc0d00e3c Line 857 of "init/main.c"
>> 0xc03017d0 Line 792 of "init/main.c"
>> 0xc0d3a234 Line 528 of "drivers/of/platform.c"
>> 0xc0810684 Line 503 of "drivers/of/platform.c"
>> 0xc081061c Line 267 of "include/linux/of.h"
>> 0xc080d928 Line 815 of "drivers/of/base.c"
>>
>> Which ends up being this code:
>>
>>    of_platform_default_populate_init()
>>       of_platform_default_populate()
>>          of_platform_populate()
>>             [[ of_find_node_by_path("/") ]]
>>                [[ of_find_node_opts_by_path(path, NULL) ]]
>>                   of_node_get(of_root)
>>
>> Note that some functions can be left out of the ARM call stack, with
>> a return going back more than one level.  The functions in the call
>> list above that are enclosed in '[[' and ']]' were found by source
>> inspection in those cases.
> 
> The same thing is encountered in ppc64 stack traces. I assume it is
> generally inlining of small functions, but I've never actually verified
> that theory. Probably should take the time to investigate, or just ask
> someone.

Yes, inlining small functions is one reason for this.

Another case I often find is that when function A calls function B calls
function C.  If the final statement of function B is 'return C()' then
there is no need for function C to return through function B, it can
instead return directly to function A.  (That is more a conceptual
hand-waving of the idea, not the actual way the compiler implements
it.  Take this with a grain of salt, I'm not a compiler guy.)

< snip >

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
