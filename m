From: Srinivas KANDAGATLA <srinivas.kandagatla@st.com>
Subject: Re: DT: of_platform_populate Vs of_platform_bus_probe.
Date: Thu, 01 Nov 2012 10:10:13 +0000
Message-ID: <50924A85.1080907@st.com>
References: <50913BC3.7090103@st.com> <5091420D.8050603@gmail.com>
Reply-To: srinivas.kandagatla@st.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5091420D.8050603@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 31/10/12 15:21, Rob Herring wrote:
> On 10/31/2012 09:54 AM, Srinivas KANDAGATLA wrote:
>> Hi All, 
>> I have few queries on of_platform_populate and of_platform_bus_probe functions.
>>
>> Use-case is, I want to explicitly register platform devices from some nodes at post-core or late-init level(like child@1).
>> And I don't want of_platform_populate to register platform devices for that node again, so I pass "simple-bus" in match-table.
>> Problem is that exiting code for of_platform_populate probes it.
>>
>> Looking at the function documentation, which states
>> of_platform_bus_probe will only create children of the root which are
>> selected by the @matches argument.
>>
>> of_platform_populate walks the device tree and creates devices from
>> nodes.  It differs in that it follows the modern convention of requiring
>> all device nodes to have a 'compatible' property, and it is suitable for
>> creating devices which are children of the root node.
>>
>> Lets say If we call of_platform_populate(NULL, match_table, NULL, NULL)
>> on a device trees like the below with
>> struct of_device_id match_table[] = {
>>     { .compatible = "simple-bus", }
>>     {}
>> };
>>
>> parent@0{
>>     compatible    = "xxx,parent1", "simple-bus";
>>     ...
>>     child@0 {
>>         compatible    = "xxx,child0", "simple-bus";
> Well simple-bus here is generally not right unless you want to create
> devices for children of child@0.
>
>>         ...
>>     };
>>     child@1 {
>>         compatible    = "xxx,child1";
>>         ...
>>     };
>>     child@2 {
>>         compatible    = "xxx,child2", "simple-bus";
>>         ...
>>     };
>> };
>>
>> of_platform_bus_probe would create platform-devices for parent@0,
>> child@0 and child@2
>> where as
>> of_platform_populate would create platform-devices for parent@0,
>> child@0, child@1 and child@2 nodes.
>>
>> So the question is
>> why do we need to have @matches argument to of_platform_populate in the
>> first place, if it creates all the devices by walking the dt nodes?
> The matches is for matching buses, not child devices. 

> It is assumed you
> want to create devices for all 1st level children.
Thankyou Rob,
my issue solved with the above understanding.
I was creating device nodes without any parent, which is why
of_platform_populate is probing them.

>> It is bit confusing, As some platforms use of_platform_populate(NULL,
>> of_default_bus_match_table, NULL, NULL) assuming that only matching
>> nodes will end up having platform device.
>> Also
>> some platforms use of_platform_bus_probe(NULL, match_table, NULL), 
>> where match table is of_default_bus_match_table.
> There should be no new users of of_platform_bus_probe. It is there for
> historical reasons on PPC.
>
>> Am not 100% sure what is the right solution, but I think lot of platforms would want behavior like of_platform_bus_probe which takes lookups aswell.
>> If the suggestion is to use of_platform_bus_probe, Which I can't use as It does not take Auxdata(lookups).
> of_platform_populate is what you should use.
>
> Rob
>
>
