From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v03] powerpc/mobility: Fix node detach/rename problem
Date: Thu, 13 Dec 2018 13:57:16 +1100
Message-ID: <877egew2ur.fsf@concordia.ellerman.id.au>
References: <a2d46622-a957-dffe-04d1-8087bbf0f8b5@linux.vnet.ibm.com> <871s6oxkdf.fsf@concordia.ellerman.id.au> <CAL_Jsq+t--486MiSsHnKcVy=q2wVvJgUmtAV6Vy2WwSNKymELA@mail.gmail.com> <48aa028d-b786-7704-70ff-75a6d2321474@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <48aa028d-b786-7704-70ff-75a6d2321474@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: mwb@linux.vnet.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, tlfalcon@linux.vnet.ibm.com, minkim@us.ibm.com, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Frank Rowand <frowand.list@gmail.com> writes:
> On 12/11/18 8:07 AM, Rob Herring wrote:
>> On Tue, Dec 11, 2018 at 7:29 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
...
>>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>>> index 09692c9b32a7..d8e4534c0686 100644
>>> --- a/drivers/of/base.c
>>> +++ b/drivers/of/base.c
>>> @@ -1190,6 +1190,10 @@ struct device_node *of_find_node_by_phandle(phandle handle)
>>>                 if (phandle_cache[masked_handle] &&
>>>                     handle == phandle_cache[masked_handle]->phandle)
>>>                         np = phandle_cache[masked_handle];
>>> +
>>> +               /* If we find a detached node, remove it */
>>> +               if (of_node_check_flag(np, OF_DETACHED))
>>> +                       np = phandle_cache[masked_handle] = NULL;
>
> The bug you found exposes a couple of different issues, a little bit
> deeper than the proposed fix.  I'll work on a fuller fix tonight or
> tomorrow.

OK thanks.

>> I'm wondering if we should explicitly remove the node from the cache
>> when we set OF_DETACHED. Otherwise, it could be possible that the node
>> pointer has been freed already. Or maybe we need both?
>
> Yes, it should be explicitly removed.  I may also add in a paranoia check in
> of_find_node_by_phandle().

That seems best to me.

cheers
