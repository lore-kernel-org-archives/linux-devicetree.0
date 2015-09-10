From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Subject: Re: [PATCH v2 0/1] of: to support binding numa node to specified
 device
Date: Thu, 10 Sep 2015 19:06:14 +0800
Message-ID: <55F16426.5010801@huawei.com>
References: <1440475702-7720-1-git-send-email-thunder.leizhen@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1440475702-7720-1-git-send-email-thunder.leizhen@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel <linux-kernel@vger.kernel.org>
Cc: Zefan Li <lizefan@huawei.com>, Xinwei Hu <huxinwei@huawei.com>, Tianhong Ding <dingtianhong@huawei.com>, Hanjun Guo <guohanjun@huawei.com>
List-Id: devicetree@vger.kernel.org

Sorry, missed version number in title.


On 2015/8/25 12:08, Zhen Lei wrote:
> Changelog:
> v1 -> v2:
> In patch v1, binding numa node to specified device only take effect for dt-nodes
> directly of root. Patch v2 removed this limitation, we can binding numa node to
> any specified device in devicetree.
> 
> Zhen Lei (1):
>   of: to support binding numa node to specified device in devicetree
> 
>  drivers/base/core.c |  2 +-
>  drivers/of/device.c | 11 ++++++-----
>  2 files changed, 7 insertions(+), 6 deletions(-)
> 
