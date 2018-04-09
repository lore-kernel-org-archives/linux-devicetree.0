From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: linux-next: build failure after merge of the nvdimm tree
Date: Mon, 9 Apr 2018 10:11:22 -0700
Message-ID: <CAPcyv4icJ8DRgaBfsJc22AtBz2EOJLK9mGkM_4fi6wLD7L9-OA@mail.gmail.com>
References: <20180409131619.0bc5fb45@canb.auug.org.au> <CAOSf1CHToZ5+k90n_sgh_9ezJjXpx21E5-K66TWkdU7t7kUiEw@mail.gmail.com>
 <CAOSf1CGjFOPPQPYNA=uLFJnVyNXQnsoBb8rm2qFi8uuUHmw8ZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOSf1CGjFOPPQPYNA=uLFJnVyNXQnsoBb8rm2qFi8uuUHmw8ZA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Oliver <oohall@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Device Tree <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 9, 2018 at 12:34 AM, Oliver <oohall@gmail.com> wrote:
> On Mon, Apr 9, 2018 at 1:38 PM, Oliver <oohall@gmail.com> wrote:
>> On Mon, Apr 9, 2018 at 1:16 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>> Hi Dan,
>>>
>>> After merging the nvdimm tree, today's linux-next build (x86_64
>>> allmodconfig) failed like this:
>>>
>>> ERROR: "of_node_to_nid" [drivers/nvdimm/of_pmem.ko] undefined!
>>>
>>> Caused by commit
>>>
>>>   717197608952 ("libnvdimm: Add device-tree based driver")
>>>
>>> X86 seems to not have a version of of_node_to_nid() even though CONFIG_OF
>>> and CONFIG_NUMA are both 'y' in this build.
>>
>> It's a side effect of a driver selecting CONFIG_OF accidently. There's
>> a patch to fix this in the drm-misc-next tree:
>>
>> https://lkml.org/lkml/2018/4/3/17
>>
>>> I have used the nvdimm tree from next-20180406 for today.
>>
>> That works too.
>
> Hmm, on closer inspection this is actually a bug in the of driver. The
> patch above fixes the specific problem that we hit on ia64 due to
> CONFIG_OF being selected by accident, but the underlying issue will
> affect any platform that doesn't provide an implementation of
> of_node_to_nid().
>
> The fundamental problem is that the various actual implementations of
> of_node_to_nid (ppc, sparc and the generic one in of_numa.c) export
> the symbol. While the fallback implementation does not because it is
> defined as a weak symbol. As a result we'll get this build failure iff
> there's a call to of_node_to_nid() in a module.
>
> The one-line fix is just to delete the call to of_node_to_nid() in
> of_pmem.c. I have a patch that adds a Kconfig options and removes the
> weak symbol games. That needs Acks from the ppc, sparc and DT
> maintainers though so it'll take longer to organise.

How about just marking OF_PMEM as bool for the time being until all of
these other reworks land upstream?
