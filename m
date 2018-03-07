Return-Path: <SRS0=lEEj=F5=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48400 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1754500AbeCGWO3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 7 Mar 2018 17:14:29 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w27MERlB046763
        for <devicetree@vger.kernel.org>; Wed, 7 Mar 2018 17:14:28 -0500
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2gjq0rursr-1
        (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
        for <devicetree@vger.kernel.org>; Wed, 07 Mar 2018 17:14:28 -0500
Received: from localhost
        by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <devicetree@vger.kernel.org> from <tyreld@linux.vnet.ibm.com>;
        Wed, 7 Mar 2018 17:14:22 -0500
Subject: Re: [PATCH] of: get of_root directly in place of
 of_find_node_by_path("/")
References: <1520041604-24482-1-git-send-email-tyreld@linux.vnet.ibm.com>
 <20180307203847.l6jfxgizrzzwfrbr@rob-hp-laptop>
From: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Date: Wed, 7 Mar 2018 14:14:18 -0800
MIME-Version: 1.0
In-Reply-To: <20180307203847.l6jfxgizrzzwfrbr@rob-hp-laptop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Message-Id: <756e7632-bc0a-ae5f-f383-fbd3f0bf9135@linux.vnet.ibm.com>
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: frowand.list@gmail.com, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 03/07/2018 12:38 PM, Rob Herring wrote:
> On Fri, Mar 02, 2018 at 08:46:44PM -0500, Tyrel Datwyler wrote:
>> There are a couple places in drivers/of where the root node is found
>> with a of_find_node_by_path("/") call. This call just returns
>> of_node_get(of_root) when the the path "/" is passed as a parameter.
>> So, lets fixup these instances to just do that instead.
>>
>> Signed-off-by: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
>> ---
>>  drivers/of/base.c     | 2 +-
>>  drivers/of/platform.c | 4 ++--
>>  2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>> index ad28de9..94c1b4d 100644
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
>> @@ -455,7 +455,7 @@ int of_machine_is_compatible(const char *compat)
>>  	struct device_node *root;
>>  	int rc = 0;
>>  
>> -	root = of_find_node_by_path("/");
>> +	root = of_node_get(of_root);
> 
> The former seems more readable to me. I'll wait and see if Frank has any 
> comments on this change.

Fair enough. I find them equally readable now that we have a well named/defined global, namely "of_root",  pointing at the device tree root. My primary goal was saving a function call, but I wasn't sure if anybody really cares enough. A quick check shows ~77 uses of "of_find_node_by_path("/")" in the kernel. Figured I'd start here and see what the consensus was.

-Tyrel

> 
> Rob
> 

