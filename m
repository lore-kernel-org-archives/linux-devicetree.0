From: Bintian <bintian.wang@huawei.com>
Subject: Re: [PATCH v9 4/6] Documentation: DT: PL011: hi6220: add compatible
 string for Hisilicon designed UART
Date: Tue, 2 Jun 2015 19:46:07 +0800
Message-ID: <556D977F.3000904@huawei.com>
References: <1432950661-23060-1-git-send-email-bintian.wang@huawei.com> <1432950661-23060-5-git-send-email-bintian.wang@huawei.com> <CACRpkdav_5x6RC9F++ErvqGyxDCF-=kap7-jCsO4zZ6QGVLfBQ@mail.gmail.com> <556D8B98.2040703@huawei.com> <20150602112424.GC2067@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150602112424.GC2067@n2100.arm.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?B?UGF3ZcWCIE1vbGw=?= <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kevin Hilman <khilman@linaro.org>, Mike Turquette <mturquette@linaro.org>, Rob Herring <rob.herring@linaro.org>, Zhangfei Gao <zhangfei.gao@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Xu Wei <xuwei5@hisilicon.com>, Jaehoon Chung <jh80.chung@samsung.com>, Olof Johansson <olof@lixom.net>, yanhaifeng@gmail.com, Ste
List-Id: devicetree@vger.kernel.org

Hello Russell,

On 2015/6/2 19:24, Russell King - ARM Linux wrote:
> On Tue, Jun 02, 2015 at 06:55:20PM +0800, Bintian wrote:
>> On 2015/6/2 16:59, Linus Walleij wrote:
>>> On Sat, May 30, 2015 at 3:50 AM, Bintian Wang <bintian.wang@huawei.com> wrote:
>>>
>>>> Hisilicon does some performance enhancements based on PL011(e.g. larger
>>>> FIFO length), so add one compatible string "hisilicon,hi6220-uart" for
>>>
>>> That compatible string in the commit message is not even
>>> the same as in the patch.
>> The UART0 is PL011 compatible, the UART1/2 have some performance
>> enhancements features, so based on Mark's suggestion and I add this
>> compatible string just for future use.
>
> Please don't submit it with this series.
>
> This patch should not be part of this series, it should be part of the
> series which modifies the PL011 driver, so it can be reviewed along with
> those changes.
I agree with you and it's OK to me to remove this patch now.

Could you help to ack the reset patches or I should send the version 10
without this patch?

>
> Until then, I'm going to NAK this patch.
>
> The thing that worries me though is that the subject line says this
> is a "Hisilicon *designed* UART".  If Hisilicon _designed_ this UART,
> presumably they have changed the *vendor* field of the UART ID _not_
> to indicate that ARM Ltd designed it?
 >
> If they've merely modified the parameters, and given the ARM Ltd PL011
> a larger fifo, then there isn't really much of a problem - we've been
> here before, except the vendor has had a real vendor ID for the field
> (in the case of ST), plus we've had different FIFO lengths for ARM
> hardware too (32 bytes instead of 16 for revision 3 and above.)
I think there is problem with my subject description, it's ARM designed
indeed and Hisilicon just did some performance enhancements but not for
UART0 in hi6220.

> Lastly, if you're not having to modify the PL011 driver in any way,
> you don't need to have a compatible.  In any case, you _shouldn't_ for
> AMBA devices.  AMBA does not match drivers based on OF compatible
> strings, so using OF compatible strings with the AMBA bus is just wrong.
> The AMBA compatible strings are there so that the generic OF code knows
> how to create the devices.
Right.

Thank you Russell.

BR,

Bintian
