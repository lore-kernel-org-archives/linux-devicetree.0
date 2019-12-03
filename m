Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 699D9C43215
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 11:28:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4BDEB2080A
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 11:28:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725907AbfLCL2h (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Dec 2019 06:28:37 -0500
Received: from foss.arm.com ([217.140.110.172]:40702 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725773AbfLCL2h (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 3 Dec 2019 06:28:37 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D17AA30E;
        Tue,  3 Dec 2019 03:28:34 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 11BDA3F68E;
        Tue,  3 Dec 2019 03:28:33 -0800 (PST)
Subject: Re: [PATCH v5 06/14] coresight: cti: Add device tree support for v8
 arch CTI
To:     Mike Leach <mike.leach@linaro.org>
Cc:     Coresight ML <coresight@lists.linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20191119231912.12768-1-mike.leach@linaro.org>
 <20191119231912.12768-7-mike.leach@linaro.org>
 <b2f640d3-c320-82d4-7399-172846820589@arm.com>
 <CAJ9a7VgkgoUTL0+_3kj53go_CKtAH3fO5xF9UNDPPz1se1SKSw@mail.gmail.com>
From:   Suzuki Kuruppassery Poulose <suzuki.poulose@arm.com>
Message-ID: <ffda8aff-0904-7292-e2f1-93833b936c49@arm.com>
Date:   Tue, 3 Dec 2019 11:28:32 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAJ9a7VgkgoUTL0+_3kj53go_CKtAH3fO5xF9UNDPPz1se1SKSw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 03/12/2019 10:59, Mike Leach wrote:
> Hi Suzuki,
> 
> On Fri, 29 Nov 2019 at 11:33, Suzuki Kuruppassery Poulose
> <suzuki.poulose@arm.com> wrote:
>>
>> On 19/11/2019 23:19, Mike Leach wrote:
>>> The v8 architecture defines the relationship between a PE, its optional ETM
>>> and a CTI. Unlike non-architectural CTIs which are implementation defined,
>>> this has a fixed set of connections which can therefore be represented as a
>>> simple tag in the device tree.
>>>
>>> This patch defines the tags needed to create an entry for this PE/ETM/CTI
>>> relationship, and provides functionality to implement the connection model
>>> in the CTI driver.
>>>
>>> Signed-off-by: Mike Leach <mike.leach@linaro.org>
>>> ---


>>> +#ifdef CONFIG_OF
>>> +/*
>>> + * CTI can be bound to a CPU, or a system device.
>>> + * CPU can be declared at the device top level or in a connections node
>>> + * so need to check relative to node not device.
>>> + */
>>> +static int of_cti_get_cpu_at_node(const struct device_node *node)
>>> +{
>>> +     int cpu;
>>> +     struct device_node *dn;
>>> +
>>> +     if (node == NULL)
>>> +             return -1;
>>> +
>>> +     dn = of_parse_phandle(node, "cpu", 0);
>>> +     /* CTI affinity defaults to no cpu */
>>> +     if (!dn)
>>> +             return -1;
>>> +     cpu = of_cpu_node_to_id(dn);
>>> +     of_node_put(dn);
>>> +
>>> +     /* No Affinity  if no cpu nodes are found */
>>> +     return (cpu < 0) ? -1 : cpu;
>>> +}
>>> +
>>> +static const char *of_cti_get_node_name(const struct device_node *node)
>>> +{
>>> +     if (node)
>>> +             return node->full_name;
>>> +     return "unknown";
>>> +}
>>> +#else
>>> +static int of_cti_get_cpu_at_node(const struct device_node *node)
>>> +{
>>> +     return -1;
>>> +}
>>> +
>>> +static const char *of_cti_get_node_name(const struct device_node *node)
>>> +{
>>> +     return "unknown";
>>> +}
>>> +#endif
>>> +
>>> +static int cti_plat_get_cpu_at_node(struct fwnode_handle *fwnode)
>>> +{
>>
>> You may simply reuse coresight_get_cpu() below, instead of adding this
>> duplicate set of functions. See below.
>>
>>
> 
> No we can't. coresight_get_cpu gets the 'cpu' entry relative to the
> device node, this gets the 'cpu' relative to the supplied node.
> This is very important for the case where a none v8 architected PE is
> attached to a CTI. This will use the devicetree form:-
> 
> cti@<addr> {
>      [ some stuff  ]
>     trig_conns@1 {
>            cpu = <&CPU0>
>            [trigger signal  connection info for this cpu]
>     }
> }
> 
> trig_conns is a child node and we must look for 'cpu' relative to it.

Ok. May be we could refactor the function to find the 'CPU' node
relative to the given "fwnode" and let the coresight_get_cpu() use it ?

int coresight_get_cpu(struct device *dev)
{
	return coresight_get_fwnode_cpu(dev_fwnode(dev));
}

That way it is clear what we are dealing with. i.e, fwnode of any level
(device or an intermediate node).

>>> +     csdev = cti_get_assoc_csdev_by_fwnode(cs_fwnode);
>>> +     if (csdev)
>>> +             assoc_name = dev_name(&csdev->dev);
>>
>> Does it make sense to defer the probing until the ETM device  turn up ?
>> Its fine either way.
>>
> 
> Not really as the ETM is optional but the PE still has a CTI.

Ah, you're right. Please ignore my comment.

Kind regards
Suzuki
