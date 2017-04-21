From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] of: introduce event tracepoints for dynamic device_node lifecyle
Date: Fri, 21 Apr 2017 11:57:19 +1000
Message-ID: <87vapyttds.fsf@concordia.ellerman.id.au>
References: <1492475525-10827-1-git-send-email-tyreld@linux.vnet.ibm.com> <58F6AA35.2040902@gmail.com> <87efwp6v4e.fsf@concordia.ellerman.id.au> <1d51a229-612b-bf09-93d5-6e43b476e2cf@gmail.com> <58F83C66.7030806@gmail.com> <64505d40-926d-b302-4ff3-dff71aa5018a@gmail.com> <58F90D56.9070602@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <58F90D56.9070602@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>, Tyrel Datwyler <turtle.in.the.kernel@gmail.com>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, robh+dt@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, nfont@linux.vnet.ibm.com, rostedt@goodmis.org, mingo@redhat.com
List-Id: devicetree@vger.kernel.org

Frank Rowand <frowand.list@gmail.com> writes:

> On 04/20/17 09:51, Tyrel Datwyler wrote:
>> On 04/19/2017 09:43 PM, Frank Rowand wrote:
...
>>> Which ends up being this code:
>>>
>>>    of_platform_default_populate_init()
>>>       of_platform_default_populate()
>>>          of_platform_populate()
>>>             [[ of_find_node_by_path("/") ]]
>>>                [[ of_find_node_opts_by_path(path, NULL) ]]
>>>                   of_node_get(of_root)
>>>
>>> Note that some functions can be left out of the ARM call stack, with
>>> a return going back more than one level.  The functions in the call
>>> list above that are enclosed in '[[' and ']]' were found by source
>>> inspection in those cases.
>> 
>> The same thing is encountered in ppc64 stack traces. I assume it is
>> generally inlining of small functions, but I've never actually verified
>> that theory. Probably should take the time to investigate, or just ask
>> someone.
>
> Yes, inlining small functions is one reason for this.
>
> Another case I often find is that when function A calls function B calls
> function C.  If the final statement of function B is 'return C()' then
> there is no need for function C to return through function B, it can
> instead return directly to function A.

It's called "Tail call optimisation", and that's more or less a good
description.

cheers
