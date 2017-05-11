From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: Re: [PATCH 2/2] of: reserved_mem: fix 'const' annotation
Date: Thu, 11 May 2017 17:59:01 +0200
Message-ID: <CAExDi1Q4xAxYWEtTA25FOoGB9Y3=pi4CxmuUpMiAe_+OVUErGg@mail.gmail.com>
References: <20170511122458.3862716-1-arnd@arndb.de> <20170511122458.3862716-2-arnd@arndb.de>
 <CAL_Jsq+MHx8Vgj9g4-p3Xs57LNpZB-20opbq2xk9jz-K-57iSw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+MHx8Vgj9g4-p3Xs57LNpZB-20opbq2xk9jz-K-57iSw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Frank Rowand <frowand.list@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 11, 2017 at 4:50 PM, Rob Herring <robh+dt@kernel.org> wrote:
> On Thu, May 11, 2017 at 7:24 AM, Arnd Bergmann <arnd@arndb.de> wrote:
>> It's the pointer that is supposed to be const, not the return
>> type of the function.
>>
>> drivers/of/of_reserved_mem.c: In function '__reserved_mem_init_node':
>> drivers/of/of_reserved_mem.c:200:7: error: type qualifiers ignored on function return type [-Werror=ignored-qualifiers]
>>    int const (*initfn)(struct reserved_mem *rmem) = i->data;
>>
>> Fixes: 17a70355ea57 ("of: fix sparse warnings in fdt, irq, reserved mem, and resolver code")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>>  drivers/of/of_reserved_mem.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
>> index 4dec07ea510f..3f03ec004829 100644
>> --- a/drivers/of/of_reserved_mem.c
>> +++ b/drivers/of/of_reserved_mem.c
>> @@ -197,7 +197,7 @@ static int __init __reserved_mem_init_node(struct reserved_mem *rmem)
>>         const struct of_device_id *i;
>>
>>         for (i = __reservedmem_of_table; i < &__rmem_of_table_sentinel; i++) {
>> -               int const (*initfn)(struct reserved_mem *rmem) = i->data;
>> +               int (* const initfn)(struct reserved_mem *rmem) = i->data;
>
> Why did you move the const here? That doesn't seem to help with sparse.

The original sparse warning was:
    ../drivers/of/of_reserved_mem.c:200:50: warning: incorrect type in
initializer (different modifiers)
    ../drivers/of/of_reserved_mem.c:200:50:    expected int (
*[usertype] initfn )( ... )
    ../drivers/of/of_reserved_mem.c:200:50:    got void const *const data
right?
And we're talking about a function (pointer) type.
Functions return a rvalue thus qualifiers are irrelevant for them,
so having 'int const (*initfn)(...)' instead of 'int (*initfn)()' should
solve nothing.

Same for the others patch in this series.

-- Luc Van Oostenryck
