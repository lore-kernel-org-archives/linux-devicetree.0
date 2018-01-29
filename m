From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v2] of: use hash based search in of_find_node_by_phandle
Date: Mon, 29 Jan 2018 15:23:13 -0800
Message-ID: <2d877704-47c5-c1fc-1b89-976cd9b1ccaa@gmail.com>
References: <1516955496-17236-1-git-send-email-cpandya@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1516955496-17236-1-git-send-email-cpandya@codeaurora.org>
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
To: Chintan Pandya <cpandya@codeaurora.org>, robh+dt@kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Chintan,

On 01/26/18 00:31, Chintan Pandya wrote:
> of_find_node_by_phandle() takes a lot of time (1ms per
> call) to find right node when your intended device is
> too deeper in the fdt. Reason is, we search for each
> device serially in the fdt. See this,
> 
> struct device_node *__of_find_all_nodes(struct device_node *prev)
> {
>         struct device_node *np;
>         if (!prev) {
>                 np = of_root;
>         } else if (prev->child) {
>                 np = prev->child;
>         } else {
>                 /* Walk back up looking for a sibling, or the end of the structure */
>                 np = prev;
>                 while (np->parent && !np->sibling)
>                         np = np->parent;
>                 np = np->sibling; /* Might be null at the end of the tree */
>         }
>         return np;
> }
> 
> #define for_each_of_allnodes_from(from, dn) \
>         for (dn = __of_find_all_nodes(from); dn; dn = __of_find_all_nodes(dn))
> #define for_each_of_allnodes(dn) for_each_of_allnodes_from(NULL, dn)
> 
> Implement, device-phandle relation in hash-table so
> that look up can be faster, irrespective of where my
> device is defined in the DT.
> 
> There are ~6.7k calls to of_find_node_by_phandle() and
> total improvement observed during boot is 400ms.
> 
> Signed-off-by: Chintan Pandya <cpandya@codeaurora.org>
> ---
>  drivers/of/base.c  |  8 ++++++--

< snip >
 

I asked some questions in the version 1 thread and did not get
answers.  I am copying the 3 questions here.

(1)

>>>
>> Please give me a pointer to the code that is doing
>> this search.
>>
>> -Frank
> You can refer include/linux/of.h
>
> #define for_each_of_allnodes_from(from, dn) \
>         for (dn = __of_find_all_nodes(from); dn; dn = __of_find_all_nodes(dn))
> #define for_each_of_allnodes(dn) for_each_of_allnodes_from(NULL, dn)
>
> where __of_find_all_nodes() does
>
> struct device_node *__of_find_all_nodes(struct device_node *prev)
> {
>         struct device_node *np;
>         if (!prev) {
>                 np = of_root;
>         } else if (prev->child) {
>                 np = prev->child;
>         } else {
>                 /* Walk back up looking for a sibling, or the end of the structure */
>                 np = prev;
>                 while (np->parent && !np->sibling)
>                         np = np->parent;
>                 np = np->sibling; /* Might be null at the end of the tree */
>         }
>         return np;
> }
>

Let me restate my question.

Can you point me to the driver code that is invoking
the search?


(2)

And also the .dts devicetree source file that you are seeing
large overhead with.


(3) -- this one is less important, but if the info is easily
       available to you

Sorry about dribbling out questions instead of all at once....

What is the hardware you are testing this on?
Processor?
Cache size?
Memory size?
Processor frequency?
Any other attribute of the system that will help me understand
the boot performance you are seeing?


Thanks,

Frank
