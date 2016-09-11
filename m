From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [BISECTED REGRESSION] v4.8-rc: DT/OCTEON driver probing broken
Date: Sun, 11 Sep 2016 14:34:15 +0200
Message-ID: <bb9ca373-2018-f795-59f0-00e34336e16e@leemhuis.info>
References: <20160816150056.GD18731@ak-desktop.emea.nsn-net.net>
 <0336fae0-1717-2f90-c221-6ef69f7024ee@leemhuis.info>
 <20160828122239.GA14316@raspberrypi.musicnaut.iki.fi>
 <CAL_Jsq+mmBH+HVLubj1_rQ0T60zfQj_Dbz41EVe7v_Mj_u2Vug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+mmBH+HVLubj1_rQ0T60zfQj_Dbz41EVe7v_Mj_u2Vug@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Michal Simek <monstr@monstr.eu>, Paul Burton <paul.burton@imgtec.com>
Cc: Aaro Koskinen <aaro.koskinen@nokia.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>, Ralf Baechle <ralf@linux-mips.org>, David Daney <david.daney@cavium.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi! On 30.08.2016 00:39, Rob Herring wrote:
> On Sun, Aug 28, 2016 at 7:22 AM, Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
>> On Sun, Aug 28, 2016 at 12:34:06PM +0200, Thorsten Leemhuis wrote:
>> There is a fix proposal here:
>>         https://patchwork.linux-mips.org/patch/14041/
>> There is still few other boards remaining that use of_platform_bus_probe()
>> from device_initcall, but who knows, maybe they are not affected.
>> arch/microblaze/kernel/platform.c
> xlnx,compound is going to fail to probe. I'm adding this to the default.
> 
>> arch/mips/mti-malta/malta-dt.c
> This should be fine. It does probe for "isa", but nothing in mainline
> is using that. We can add it to the default when it does.
> 
>> arch/mips/netlogic/xlp/dt.c
> Should be okay with default.
> 
>> arch/x86/platform/olpc/olpc_dt.c
> This one needs fixing.

Rob, did anything happen on this front? This issue is still on the list
of regression for 4.8, and it seems to me nothing happened in the past
ten days -- or is this discussed somewhere else?.

Ciao, Thorsten
