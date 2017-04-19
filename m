From: "Oliver O'Halloran" <oohall-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: introduce event tracepoints for dynamic device_node lifecyle
Date: Wed, 19 Apr 2017 12:30:50 +1000
Message-ID: <CAOSf1CH8HgP0rKd0WCp87BADYcEGT5OCoq_yq+f3ZeoyTcXeng@mail.gmail.com>
References: <1492475525-10827-1-git-send-email-tyreld@linux.vnet.ibm.com> <CAL_Jsq+GRkssqcn0wGzMgQRUtT-BO4zNDyYE7u1Cr5EhADK1SQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+GRkssqcn0wGzMgQRUtT-BO4zNDyYE7u1Cr5EhADK1SQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Tyrel Datwyler <tyreld-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Nathan Fontenot <nfont-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 19, 2017 at 2:46 AM, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Mon, Apr 17, 2017 at 7:32 PM, Tyrel Datwyler
> <tyreld-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org> wrote:
>> This patch introduces event tracepoints for tracking a device_nodes
>> reference cycle as well as reconfig notifications generated in response
>> to node/property manipulations.
>>
>> With the recent upstreaming of the refcount API several device_node
>> underflows and leaks have come to my attention in the pseries (DLPAR) dynamic
>> logical partitioning code (ie. POWER speak for hotplugging virtual and physcial
>> resources at runtime such as cpus or IOAs). These tracepoints provide a
>> easy and quick mechanism for validating the reference counting of
>> device_nodes during their lifetime.
>
> Not really relevant for this patch, but since you are looking at
> pseries and refcounting, the refcounting largely exists for pseries.
> It's also hard to get right as this type of fix is fairly common. It's
> now used for overlays, but we really probably only need to refcount
> the overlays or changesets as a whole, not at a node level. If you
> have any thoughts on how a different model of refcounting could work
> for pseries, I'd like to discuss it.

One idea I've been kicking around is differentiating short and long
term references to a node. I figure most leaks are due to a missing
of_node_put() within a stack frame so it might be possible to use the
ftrace infrastructure to detect and emit warnings if a short term
reference is leaked. Long term references are slightly harder to deal
with, but they're less common so we can add more detailed reference
tracking there (devm_of_get_node?).

Oliver
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
