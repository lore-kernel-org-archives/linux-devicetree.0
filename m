From: Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH V3 0/8] ARM: Add minimal Raspberry Pi 4 support
Date: Fri, 4 Oct 2019 03:03:00 +0200
Message-ID: <a49902c4-e66f-34d4-efad-a6b0b11fab58@gmx.net>
References: <1569672435-19823-1-git-send-email-wahrenst@gmx.net>
 <3853cd8425743b4991f5d599ec1c0fbbf4232f95.camel@suse.de>
 <d4774e5a-abc2-4c43-c97d-76600f74132d@gmx.net>
 <420c18a3-d458-8115-ef00-f1cb4febe3b0@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <420c18a3-d458-8115-ef00-f1cb4febe3b0@suse.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <mbrugger@suse.com>, Eric Anholt <eric@anholt.net>, Guillaume Gardet <Guillaume.Gardet@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, Rob Herring <robh+dt@kernel.org>, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

Am 04.10.19 um 00:42 schrieb Matthias Brugger:
>
> On 03/10/2019 19:24, Stefan Wahren wrote:
>> Hi Nicolas,
>>
>> Am 03.10.19 um 19:09 schrieb Nicolas Saenz Julienne:
>>> On Sat, 2019-09-28 at 14:07 +0200, Stefan Wahren wrote:
>>>> This series adds minimal support for the new Raspberry Pi 4, so we are able
>>>> to login via debug UART.
>>>>
>>>> Patch 1-2:   Fix some DT schema warnings
>>>> Patch 3-4:   Prepare DTS for the new SoC BMC2711
>>>> Patch 5-7:   Add Raspberry Pi 4 DTS support
>>>> Patch 8:     Update MAINTAINERS
>>>>
>>>> Unfortunately the Raspberry Pi Foundation didn't released a
>>>> peripheral documentation for the new SoC yet. So we only have a preliminary
>>>> datasheet [1] and reduced schematics [2].
>>>>
>>>> Known issues:
>>>> Since Linux 5.3-rc1 DMA doesn't work properly on that platform.
>>>> Nicolas Saenz Julienne investigates on that issue. As a temporary workaround
>>>> i reverted the following patch to test this series:
>>>>
>>>> 79a98672 "dma-mapping: remove dma_max_pfn"
>>>> 7559d612 "mmc: core: let the dma map ops handle bouncing"
>>> [ adding Matthias and Guillaume who first saw this ]
>>> [ also adding Adrian Hunter just in case ]
>>>
>>> Hi,
>>> we stubled upon a bug in RPi's sdhci-iproc while testing this series.
>>>
>>> It only shows-up on slow SD cards, the class 4 ones. On each SD operation we
>>> get the following warning:
>>>
>>> [    2.093328] mmc1: Got data interrupt 0x00000002 even though no data operation was in progress.
>>> [    2.102072] mmc1: sdhci: ============ SDHCI REGISTER DUMP ===========
>>> [    2.108603] mmc1: sdhci: Sys addr:  0x00000000 | Version:  0x00001002
>>> [    2.115134] mmc1: sdhci: Blk size:  0x00007200 | Blk cnt:  0x00000000
>>> [    2.121664] mmc1: sdhci: Argument:  0x00000000 | Trn mode: 0x00000033
>>> [    2.128195] mmc1: sdhci: Present:   0x1fff0000 | Host ctl: 0x00000017
>>> [    2.134725] mmc1: sdhci: Power:     0x0000000f | Blk gap:  0x00000080
>>> [    2.141255] mmc1: sdhci: Wake-up:   0x00000000 | Clock:    0x00000107
>>> [    2.147785] mmc1: sdhci: Timeout:   0x00000000 | Int stat: 0x00000000
>>> [    2.154314] mmc1: sdhci: Int enab:  0x03ff100b | Sig enab: 0x03ff100b
>>> [    2.160843] mmc1: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000000
>>> [    2.167373] mmc1: sdhci: Caps:      0x45ee6432 | Caps_1:   0x0000a525
>>> [    2.173902] mmc1: sdhci: Cmd:       0x00000c1a | Max curr: 0x00080008
>>> [    2.180432] mmc1: sdhci: Resp[0]:   0x00000b00 | Resp[1]:  0x00edc87f
>>> [    2.186961] mmc1: sdhci: Resp[2]:   0x325b5900 | Resp[3]:  0x00400e00
>>> [    2.193490] mmc1: sdhci: Host ctl2: 0x00000001
>>> [    2.197992] mmc1: sdhci: ADMA Err:  0x00000000 | ADMA Ptr: 0xec040208
>>> [    2.204521] mmc1: sdhci: ============================================
>>>
>>> Aside from the serial console noise the RPi still boots alright. But as it's
>>> printing one of these per SD operation which is a lot...
>>>
>>> I've been able to reproduce this both with arm and arn64 on multiple SD cards.
>>> Just copying the contents of a class 4 card into a class 10 one fixes the
>>> issue.
>>>
>>> Any ideas?
>> i saw this once during testing. AFAIR there has been some changes to
>> sdhci in the downstream tree, maybe they was related to this issue.
> I did a diff against drivers/mmc/host/sdhci-iproc.c of v5.4-rc1 and haven't
> found any significant changes:
> - compatible in the upstream driver is only bcm2711-emmc2 and not bcm2838-sdhci,
> but DTS uses the former one.
> - Upstream driver support probing via ACPI.
> - pltfm_host->clk gets only set if we probe via DTS
> - get_max_clock() is set to sdhci_iproc_get_max_clock() but this checks if
> pltfm_host->clk is set and in that case invokes sdhci_pltfm_clk_get_max_clock()
> (same function as the downstream driver).
>
> So AFAIKS nothing relevant here.

as i wrote about sdhci, i literally meant this driver [1]. But this
looks like a workaround only.

[1] -
https://github.com/raspberrypi/linux/commit/88b35d4338e238519bf4e6f73837b4ce44bfe4d6

>
> Regards,
> Matthias
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
