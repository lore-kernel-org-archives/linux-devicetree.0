From: Chintan Pandya <cpandya@codeaurora.org>
Subject: Re: [PATCH v2] of: use hash based search in of_find_node_by_phandle
Date: Fri, 26 Jan 2018 20:44:22 +0530
Message-ID: <aa84e40d-5032-1d1d-6146-391ca1e5e528@codeaurora.org>
References: <1516955496-17236-1-git-send-email-cpandya@codeaurora.org>
 <f08592cf-5e49-e631-c481-e166b741f25e@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f08592cf-5e49-e631-c481-e166b741f25e@prevas.dk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>, robh+dt@kernel.org, frowand.list@gmail.com, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


> I'm probably missing something obvious, but: Aren't phandles in practice
> small consecutive integers assigned by dtc? If so, why not just have a
> smallish static array mapping the small phandle values directly to
> device node, instead of adding a pointer to every struct device_node? Or
> one could determine the size of the array dynamically (largest seen
> phandle value, capping at something sensible, e.g. 1024).
Haven't noticed this earlier !! If following is known or true, we can avoid
using hash-table and save per device_node hlish_node.

     1. How to know max phandle value without traversing tree once? In 
my case,
        max is 1263.
     2. Although, I haven't observed collision but is it like every 
device_node
        is associated with unique phandle value ?
> In either case, one would still need to keep the code doing the
> whole-tree traversal for handling large phandle values, but I think the
> above should make lookup O(1) in most cases.
I would refrain doing this because that will make this API inconsistent 
in terms
of time taken by different nodes. I see that people do change their device
placing in DT and that changes time taken in of_* APIs for them but 
affecting
others.

> Alternatively, one could just count the number of nodes with a phandle,
> allocate an array of that many pointers (so the memory use is certainly
> no more than if adding a pointer to each device_node), and sort it by
> phandle, so one can do lookup using a binary search.
>
> Rasmus
This is certainly doable if current approach is not welcomed due to
addition on hlish_node in device_node.

Chintan Pandya

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
