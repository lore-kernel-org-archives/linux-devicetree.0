From: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Subject: Re: [PATCH] of: introduce event tracepoints for dynamic device_node
 lifecyle
Date: Wed, 19 Apr 2017 14:13:50 -0700
Message-ID: <5aa699db-255a-773b-7d60-3c6f05e88050@linux.vnet.ibm.com>
References: <1492475525-10827-1-git-send-email-tyreld@linux.vnet.ibm.com>
 <CAL_Jsq+GRkssqcn0wGzMgQRUtT-BO4zNDyYE7u1Cr5EhADK1SQ@mail.gmail.com>
 <CAOSf1CH8HgP0rKd0WCp87BADYcEGT5OCoq_yq+f3ZeoyTcXeng@mail.gmail.com>
 <87y3uw66y5.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87y3uw66y5.fsf@concordia.ellerman.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>, Oliver O'Halloran <oohall@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, rostedt@goodmis.org, Ingo Molnar <mingo@redhat.com>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

On 04/19/2017 03:13 AM, Michael Ellerman wrote:
> Oliver O'Halloran <oohall@gmail.com> writes:
> 
>> On Wed, Apr 19, 2017 at 2:46 AM, Rob Herring <robh+dt@kernel.org> wrote:
>>> On Mon, Apr 17, 2017 at 7:32 PM, Tyrel Datwyler
>>> <tyreld@linux.vnet.ibm.com> wrote:
>>>> This patch introduces event tracepoints for tracking a device_nodes
>>>> reference cycle as well as reconfig notifications generated in response
>>>> to node/property manipulations.
>>>>
>>>> With the recent upstreaming of the refcount API several device_node
>>>> underflows and leaks have come to my attention in the pseries (DLPAR) dynamic
>>>> logical partitioning code (ie. POWER speak for hotplugging virtual and physcial
>>>> resources at runtime such as cpus or IOAs). These tracepoints provide a
>>>> easy and quick mechanism for validating the reference counting of
>>>> device_nodes during their lifetime.
>>>
>>> Not really relevant for this patch, but since you are looking at
>>> pseries and refcounting, the refcounting largely exists for pseries.
>>> It's also hard to get right as this type of fix is fairly common. It's
>>> now used for overlays, but we really probably only need to refcount
>>> the overlays or changesets as a whole, not at a node level. If you
>>> have any thoughts on how a different model of refcounting could work
>>> for pseries, I'd like to discuss it.
>>
>> One idea I've been kicking around is differentiating short and long
>> term references to a node.
> 
> I actually did this a long time ago, but balked at the size of the patch
> to do the conversion. Let me see if I can find it lying around ...

It would be interesting to revisit this, and toss around any other ideas
anyone may have.

-Tyrel

> 
> cheers
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
