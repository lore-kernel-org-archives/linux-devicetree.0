From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH v4 00/14] fix some type infos and bugs for arm64/of numa
Date: Tue, 7 Jun 2016 14:58:53 +0100
Message-ID: <20160607135852.GA20477@arm.com>
References: <1465286898-13828-1-git-send-email-thunder.leizhen@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1465286898-13828-1-git-send-email-thunder.leizhen@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhen Lei <thunder.leizhen@huawei.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Ganapatrao Kulkarni <gkulkarni@caviumnetworks.com>, Robert Richter <rrichter@cavium.com>, David Daney <david.daney@cavium.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Zefan Li <lizefan@huawei.com>, Xinwei Hu <huxinwei@huawei.com>, Tianhong Ding <dingtianhong@huawei.com>, Hanjun Guo <guohanjun@huawei.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 07, 2016 at 04:08:04PM +0800, Zhen Lei wrote:
> v3 -> v4:
> 1. Packed three patches of Kefeng Wang, patch6-8.
> 2. Add 6 new patches(9-15) to enhance the numa on arm64.
> 
> v2 -> v3:
> 1. Adjust patch2 and patch5 according to Matthias Brugger's advice, to make the
>    patches looks more well. The final code have no change. 
> 
> v1 -> v2:
> 1. Base on https://lkml.org/lkml/2016/5/24/679

If you want bug fixes to land in 4.7, you'll need to base them on a
mainline kernel.

Will
