From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v03] powerpc/mobility: Fix node detach/rename problem
Date: Thu, 13 Dec 2018 13:56:38 +1100
Message-ID: <87a7law2vt.fsf@concordia.ellerman.id.au>
References: <a2d46622-a957-dffe-04d1-8087bbf0f8b5@linux.vnet.ibm.com> <871s6oxkdf.fsf@concordia.ellerman.id.au> <CAL_Jsq+t--486MiSsHnKcVy=q2wVvJgUmtAV6Vy2WwSNKymELA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+t--486MiSsHnKcVy=q2wVvJgUmtAV6Vy2WwSNKymELA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: mwb@linux.vnet.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, tlfalcon@linux.vnet.ibm.com, minkim@us.ibm.com, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Rob Herring <robh+dt@kernel.org> writes:
> On Tue, Dec 11, 2018 at 7:29 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
...
>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>> index 09692c9b32a7..d8e4534c0686 100644
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
>> @@ -1190,6 +1190,10 @@ struct device_node *of_find_node_by_phandle(phandle handle)
>>                 if (phandle_cache[masked_handle] &&
>>                     handle == phandle_cache[masked_handle]->phandle)
>>                         np = phandle_cache[masked_handle];
>> +
>> +               /* If we find a detached node, remove it */
>> +               if (of_node_check_flag(np, OF_DETACHED))
>> +                       np = phandle_cache[masked_handle] = NULL;
>
> I'm wondering if we should explicitly remove the node from the cache
> when we set OF_DETACHED. Otherwise, it could be possible that the node
> pointer has been freed already.

Yeah good point.

> Or maybe we need both?

That's probably best, it could even be a WARN_ON() if we find one in
of_find_node_by_phandle().

cheers
