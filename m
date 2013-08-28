From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH 1/1] of: fdt: fix memory initialization for expanded DT
Date: Wed, 28 Aug 2013 21:24:00 +0100
Message-ID: <CACxGe6sZHoLjgg+2kDZWOWen0JgGMT-fRbfTBQzffmnhNctrvQ@mail.gmail.com>
References: <5208C04A.5000303@gmail.com> <20130828202100.9134B3E0B6B@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130828202100.9134B3E0B6B@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Wladislav Wiebe <wladislav.kw@gmail.com>, Rob Herring <rob.herring@calxeda.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 28, 2013 at 9:21 PM, Grant Likely <grant.likely@linaro.org> wrote:
> On Mon, 12 Aug 2013 13:00:26 +0200, Wladislav Wiebe <wladislav.kw@gmail.com> wrote:
>> Already existing property flags are filled wrong for properties created from
>> initial FDT. This could cause problems if this DYNAMIC device-tree functions
>> are used later, i.e. properties are attached/detached/replaced. Simply dumping
>> flags from the running system show, that some initial static (not allocated via
>> kzmalloc()) nodes are marked as dynamic.
>>
>> I putted some debug extensions to property_proc_show(..) :
>> ..
>> +       if (OF_IS_DYNAMIC(pp))
>> +               pr_err("DEBUG: xxx : OF_IS_DYNAMIC\n");
>> +       if (OF_IS_DETACHED(pp))
>> +               pr_err("DEBUG: xxx : OF_IS_DETACHED\n");
>>
>> when you operate on the nodes (e.g.: ~$ cat /proc/device-tree/*some_node*) you
>> will see that those flags are filled wrong, basically in most cases it will dump
>> a DYNAMIC or DETACHED status, which is in not true.
>> (BTW. this OF_IS_DETACHED is a own define for debug purposes which which just
>> make a test_bit(OF_DETACHED, &x->_flags)
>>
>> If nodes are dynamic kernel is allowed to kfree() them. But it will crash
>> attempting to do so on the nodes from FDT -- they are not allocated via
>> kzmalloc().
>>
>> Signed-off-by: Wladislav Wiebe <wladislav.kw@gmail.com>
>> ---
>>  drivers/of/fdt.c |    2 ++
>>  1 files changed, 2 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
>> index 6bb7cf2..b10ba00 100644
>> --- a/drivers/of/fdt.c
>> +++ b/drivers/of/fdt.c
>> @@ -392,6 +392,8 @@ static void __unflatten_device_tree(struct boot_param_header *blob,
>>       mem = (unsigned long)
>>               dt_alloc(size + 4, __alignof__(struct device_node));
>>
>> +     memset((void *)mem, 0, size);
>> +
>
> It seems to me that this would be a problem for any call to the early
> allocation function; early_init_dt_alloc_memory_arch(). There is at
> least one other call to the allocator via of_alias_scan(). I think this
> patch is okay for now (I'll add the missing hunk), but it should be
> revisited.

Oops, I see that Rob has already applied it. I'll post the other
change needed and post as a follow-on patch. Sorry for the noise.

g.
