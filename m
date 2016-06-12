From: Hanjun Guo <guohanjun@huawei.com>
Subject: Re: [PATCH v4 00/14] fix some type infos and bugs for arm64/of numa
Date: Sun, 12 Jun 2016 15:09:46 +0800
Message-ID: <575D0ABA.2010503@huawei.com>
References: <1465286898-13828-1-git-send-email-thunder.leizhen@huawei.com>
 <20160607135852.GA20477@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160607135852.GA20477@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Will Deacon <will.deacon@arm.com>, Zhen Lei <thunder.leizhen@huawei.com>
Cc: devicetree <devicetree@vger.kernel.org>, Zefan Li <lizefan@huawei.com>, David Daney <david.daney@cavium.com>, Catalin Marinas <catalin.marinas@arm.com>, Xinwei Hu <huxinwei@huawei.com>, linux-kernel <linux-kernel@vger.kernel.org>, Robert Richter <rrichter@cavium.com>, Rob Herring <robh+dt@kernel.org>, Tianhong Ding <dingtianhong@huawei.com>, Grant Likely <grant.likely@linaro.org>, Ganapatrao Kulkarni <gkulkarni@caviumnetworks.com>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Will,

On 2016/6/7 21:58, Will Deacon wrote:
> On Tue, Jun 07, 2016 at 04:08:04PM +0800, Zhen Lei wrote:
>> v3 -> v4:
>> 1. Packed three patches of Kefeng Wang, patch6-8.
>> 2. Add 6 new patches(9-15) to enhance the numa on arm64.
>>
>> v2 -> v3:
>> 1. Adjust patch2 and patch5 according to Matthias Brugger's advice, to make the
>>    patches looks more well. The final code have no change. 
>>
>> v1 -> v2:
>> 1. Base on https://lkml.org/lkml/2016/5/24/679
> If you want bug fixes to land in 4.7, you'll need to base them on a
> mainline kernel.
>

Rafael queued ARM64 ACPI NUMA support for 4.8, and this patch set is based
on that with no urgent bugfixes, can this patch set be queued for 4.8?

Thanks
Hanjun
