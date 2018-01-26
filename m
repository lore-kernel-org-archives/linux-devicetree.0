From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: Re: [PATCH v2] of: use hash based search in of_find_node_by_phandle
Date: Fri, 26 Jan 2018 11:57:02 +0100
Message-ID: <f08592cf-5e49-e631-c481-e166b741f25e@prevas.dk>
References: <1516955496-17236-1-git-send-email-cpandya@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1516955496-17236-1-git-send-email-cpandya@codeaurora.org>
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
To: Chintan Pandya <cpandya@codeaurora.org>, robh+dt@kernel.org, frowand.list@gmail.com, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2018-01-26 09:31, Chintan Pandya wrote:
> Implement, device-phandle relation in hash-table so
> that look up can be faster, irrespective of where my
> device is defined in the DT.
> 
> There are ~6.7k calls to of_find_node_by_phandle() and
> total improvement observed during boot is 400ms.

I'm probably missing something obvious, but: Aren't phandles in practice
small consecutive integers assigned by dtc? If so, why not just have a
smallish static array mapping the small phandle values directly to
device node, instead of adding a pointer to every struct device_node? Or
one could determine the size of the array dynamically (largest seen
phandle value, capping at something sensible, e.g. 1024).

In either case, one would still need to keep the code doing the
whole-tree traversal for handling large phandle values, but I think the
above should make lookup O(1) in most cases.

Alternatively, one could just count the number of nodes with a phandle,
allocate an array of that many pointers (so the memory use is certainly
no more than if adding a pointer to each device_node), and sort it by
phandle, so one can do lookup using a binary search.

Rasmus
