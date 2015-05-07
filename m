From: Bintian <bintian.wang@huawei.com>
Subject: Re: [PATCH v4 0/5] arm64,hi6220: Enable Hisilicon Hi6220 SoC
Date: Thu, 7 May 2015 17:29:03 +0800
Message-ID: <554B305F.4080907@huawei.com>
References: <1430827599-11560-1-git-send-email-bintian.wang@huawei.com>
 <20150507090210.GB22115@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20150507090210.GB22115@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Will Deacon <will.deacon@arm.com>
Cc: Mark Rutland <Mark.Rutland@arm.com>, "dan.zhao@hisilicon.com" <dan.zhao@hisilicon.com>, "btw@mail.itp.ac.cn" <btw@mail.itp.ac.cn>, Catalin Marinas <Catalin.Marinas@arm.com>, "wangbinghui@hisilicon.com" <wangbinghui@hisilicon.com>, "tyler.baker@linaro.org" <tyler.baker@linaro.org>, "huxinwei@huawei.com" <huxinwei@huawei.com>, "haojian.zhuang@linaro.org" <haojian.zhuang@linaro.org>, "yanhaifeng@gmail.com" <yanhaifeng@gmail.com>, "rob.herring@linaro.org" <rob.herring@linaro.org>, "mturquette@linaro.org" <mturquette@linaro.org>, "arnd@arndb.de" <arnd@arndb.de>, "khilman@kernel.org" <khilman@kernel.org>, "victor.lixin@hisilicon.com" <victor.lixin@hisilicon.com>, "xuwei5@hisilicon.com" <xuwei5@hisilicon.com>, "jh80.chung@samsung.com" <jh80.chung@samsung.com>, "sledge.yanwei@huawei.com" <sledge.yanwei@huawei.com>, "kong.kongxinwei@hisilicon.com" <kong.kongxinwei@hisilicon.co>
List-Id: devicetree@vger.kernel.org

Hi Will,

On 2015/5/7 17:02, Will Deacon wrote:
> Hi Bintian,
>
> On Tue, May 05, 2015 at 01:06:34PM +0100, Bintian Wang wrote:
>> Hi6220 is one mobile solution of Hisilicon, this patchset contains
>> initial support for Hi6220 SoC and HiKey development board, which
>> supports octal ARM Cortex A53 cores. Initial support is minimal and
>> includes just the arch configuration, clock driver, device tree
>> configuration.
>>
>> PSCI is enabled in device tree and there is no problem to boot all the
>> octal cores, and the CPU hotplug is also working now, you can download
>> and compile the latest firmware based on the following link to run this
>> patch set:
>> https://github.com/96boards/documentation/wiki/UEFI
>>
>> Changes v4:
>> * Rebase to kernel 4.1-rc1
>> * Delete "arm,cortex-a15-gic" from the gic node in dts
>
> I gave these patches a go on top of -rc2 using the ATF and UEFI you link to
> above.
>
> The good news is that the thing booted and all the cores entered at EL2.
> Thanks!
Really thank you very much for testing this patch set.

>
> The bad news is that running hackbench quickly got the *heatsink*
> temperature to 73 degress C and rising (measured with an infrared
> thermometer).
This patch set is just for booting the small system, if you want to
test the temperature, I think you should using the HiKey released
version (https://www.96boards.org/).

This patch is just for the small system, and not include those drivers
for adjusting the CPU frequency, thermal control and so on. After this
patch is merged, all those drivers will be submitted later.

>
> So my question is, does this SoC have an automatic thermal cut out? Whilst
> I'm all for merging enabling code into the kernel, if it really relies on
> the kernel to stop it from catching fire, maybe it's not a great idea
> putting these patches into people's hands just yet.
Hikey is a low cost board, I think it doesn't have an automatic thermal
cut out; I always use HiKey to test my patch, in the normal case, 
temperature is not a problem.

Thanks,

Bintian
>
> Will
>
> .
>
