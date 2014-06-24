From: Nathan Fontenot <nfont-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org>
Subject: Re: OF_DYNAMIC node lifecycle
Date: Tue, 24 Jun 2014 15:10:55 -0500
Message-ID: <53A9DB4F.9060708@austin.ibm.com>
References: <CACxGe6tsXuLZT=h8S0yRPRPy6Hqz1xkX8G+ViY0cxEUuxZ1dsw@mail.gmail.com>	<53A30117.3010100@austin.ibm.com> <20140623144806.1348EC40A60@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140623144806.1348EC40A60-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tyrel Datwyler <tyreld-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, linuxppc-dev <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/23/2014 09:48 AM, Grant Likely wrote:
> On Thu, 19 Jun 2014 10:26:15 -0500, Nathan Fontenot <nfont-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org> wrote:
>> On 06/18/2014 03:07 PM, Grant Likely wrote:
>>> Hi Nathan and Tyrel,
>>>
>>> I'm looking into lifecycle issues on nodes modified by OF_DYNAMIC, and
>>> I'm hoping you can help me. Right now, pseries seems to be the only
>>> user of OF_DYNAMIC, but making OF_DYNAMIC work has a huge impact on
>>> the entire kernel because it requires all DT code to manage reference
>>> counting with iterating over nodes. Most users simply get it wrong.
>>> Pantelis did some investigation and found that the reference counts on
>>> a running kernel are all over the place. I have my doubts that any
>>> code really gets it right.
>>>
>>> The problem is that users need to know when it is appropriate to call
>>> of_node_get()/of_node_put(). All list traversals that exit early need
>>> an extra call to of_node_put(), and code that is searching for a node
>>> in the tree and holding a reference to it needs to call of_node_get().
>>>
>>> I've got a few pseries questions:
>>> - What are the changes being requested by pseries firmware? Is it only
>>> CPUs and memory nodes, or does it manipulate things all over the tree?
>>
>> The short answer, everything.
> 
> :-)
> 
>> For pseries the two big actions that can change the device tree are
>> adding/removing resources and partition migration.
>>
>> The most frequent updates to the device tree happen during resource
>> (cpu, memory, and pci/phb) add and remove. During this process we add
>> and remove the node and its properties from the device tree.
>> - For memory on newer systems this just involves updating the
>>   ibm,dynamic-reconfiguration-memory/ibm,dynamic-memory property. Older
>>   firmware levels add and remove the memroy@XXX nodes and their properties.
>> - For cpus the cpus/PowerPC,POWERXXXX nodes and its properties are added
>>   or removed
>> - For pci/phb the pci@XXXXX nodes and properties are added/removed.
>>
>> The less frequent operation of live partition migration (and suspend/resume)
>> can update just about anything in the device tree. When this occurs and the
>> systems starts after being migrated (or waking up after a suspend) we make
>> a call to firmware to get updates to the device tree for the new hardware
>> we are running on.
>>  
>>> - How frequent are the changes? How many changes would be likely over
>>> the runtime of the system?
>>
>> This can happen frequently.
> 
> Thanks, that is exactly the information that I want. I'm not so much
> concerned with the addition or removal of nodes/properties, which is
> actually pretty easy to handle. It is the lifecycle of allocations on
> dynamic nodes that causes heartburn.
> 
>>> - Are you able to verify that removed nodes are actually able to be
>>> freed correctly? Do you have any testcases for node removal?
>>
>> I have always tested this by doing resource add/remove, usually cpu and memory
>> since it is the easiest.
> 
> Is that just testing the functionality, or do you have tests that check
> if the memory gets freed?

In general it's just functionality testing.

> 
>>> I'm thinking very seriously about changing the locking semantics of DT
>>> code entirely so that most users never have to worry about
>>> of_node_get/put at all. If the DT code is switched to use rcu
>>> primitives for tree iteration (which also means making DT code use
>>> list_head, something I'm already investigating), then instead of
>>> trying to figure out of_node_get/put rules, callers could use
>>> rcu_read_lock()/rcu_read_unlock() to protect the region that is
>>> searching over nodes, and only call of_node_get() if the node pointer
>>> is needed outside the rcu read-side lock.
>>>
>>
>> This sounds good. I like just taking the rcu lock around accessing the DT.
>> Do we have many places where DT node pointers are held that require
>> keeping the of_node_get/put calls? If this did exist perhaps we could
>> update those places to look up the DT node every time instead of
>> holding on to the pointer. We could just get rid of the reference counting
>> altogether then.
> 
> There are a few, but I would be happy to restrict reference counting to
> only those locations. Most places will decode the DT data, and then
> throw away the reference. We /might/ even be able to do rcu_lock/unlock
> around the entire probe path which would make it transparent to all
> device drivers.
> 
>>> I'd really like to be rid of the node reference counting entirely, but
>>> I can't figure out a way of doing that safely, so I'd settle for
>>> making it a lot easier to get correct.
>>>
>>
>> heh! I have often thought about adding reference counting to device tree
>> properties.
> 
> You horrible, horrible man.

Yes. I are evil :)

After looking again the work needed to add reference counts to properties
would be huge. The few properties I am concerned with are specific to powerpc
so perhaps just adding an arch specific lock around updating those
properties would work.

-Nathan

> 
>> I don't really want to but there are some properties that can
>> get updated frequently (namely the one mentioned above for memory) that
>> can also get pretty big, especially on systems with a lot of memory. We
>> never free the memory for old versions of a device tree property. This is
>> a pretty minor issue though and probably best suited for a separate
>> discussion after resolving this. 
> 
> We might be able to do some in-place modification of properties if the
> size of the property doesn't change. That still leaves some nasty
> lifecycle issues that need to be resolved though. It would require
> swapping back and forth between memory for an old copy of the property
> and a new one. Yes, this should be a separate discussion.
> 
>>
>> Other than pseries, who else does dynamic device tree updating? Are we the
>> only ones?
> 
> Right now you're the only ones. Pantelis has a series that adds bulk
> changes to the device tree which are also removable (called overlays). I
> also have a GSoC student working on the selftest code which will
> dynamically add testcase data to the tree.
> 
> g.
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
