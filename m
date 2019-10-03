From: Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH V3 0/8] ARM: Add minimal Raspberry Pi 4 support
Date: Thu, 3 Oct 2019 19:24:55 +0200
Message-ID: <d4774e5a-abc2-4c43-c97d-76600f74132d@gmx.net>
References: <1569672435-19823-1-git-send-email-wahrenst@gmx.net>
 <3853cd8425743b4991f5d599ec1c0fbbf4232f95.camel@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <3853cd8425743b4991f5d599ec1c0fbbf4232f95.camel@suse.de>
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
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Matthias Brugger <mbrugger@suse.com>, Guillaume Gardet <Guillaume.Gardet@arm.com>, Adrian Hunter <adrian.hunter@intel.com>
Cc: devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Nicolas,

Am 03.10.19 um 19:09 schrieb Nicolas Saenz Julienne:
> On Sat, 2019-09-28 at 14:07 +0200, Stefan Wahren wrote:
>> This series adds minimal support for the new Raspberry Pi 4, so we are able
>> to login via debug UART.
>>
>> Patch 1-2:   Fix some DT schema warnings
>> Patch 3-4:   Prepare DTS for the new SoC BMC2711
>> Patch 5-7:   Add Raspberry Pi 4 DTS support
>> Patch 8:     Update MAINTAINERS
>>
>> Unfortunately the Raspberry Pi Foundation didn't released a
>> peripheral documentation for the new SoC yet. So we only have a preliminary
>> datasheet [1] and reduced schematics [2].
>>
>> Known issues:
>> Since Linux 5.3-rc1 DMA doesn't work properly on that platform.
>> Nicolas Saenz Julienne investigates on that issue. As a temporary workaround
>> i reverted the following patch to test this series:
>>
>> 79a98672 "dma-mapping: remove dma_max_pfn"
>> 7559d612 "mmc: core: let the dma map ops handle bouncing"
> [ adding Matthias and Guillaume who first saw this ]
> [ also adding Adrian Hunter just in case ]
>
> Hi,
> we stubled upon a bug in RPi's sdhci-iproc while testing this series.
>
> It only shows-up on slow SD cards, the class 4 ones. On each SD operation we
> get the following warning:
>
> [    2.093328] mmc1: Got data interrupt 0x00000002 even though no data operation was in progress.
> [    2.102072] mmc1: sdhci: ============ SDHCI REGISTER DUMP ===========
> [    2.108603] mmc1: sdhci: Sys addr:  0x00000000 | Version:  0x00001002
> [    2.115134] mmc1: sdhci: Blk size:  0x00007200 | Blk cnt:  0x00000000
> [    2.121664] mmc1: sdhci: Argument:  0x00000000 | Trn mode: 0x00000033
> [    2.128195] mmc1: sdhci: Present:   0x1fff0000 | Host ctl: 0x00000017
> [    2.134725] mmc1: sdhci: Power:     0x0000000f | Blk gap:  0x00000080
> [    2.141255] mmc1: sdhci: Wake-up:   0x00000000 | Clock:    0x00000107
> [    2.147785] mmc1: sdhci: Timeout:   0x00000000 | Int stat: 0x00000000
> [    2.154314] mmc1: sdhci: Int enab:  0x03ff100b | Sig enab: 0x03ff100b
> [    2.160843] mmc1: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000000
> [    2.167373] mmc1: sdhci: Caps:      0x45ee6432 | Caps_1:   0x0000a525
> [    2.173902] mmc1: sdhci: Cmd:       0x00000c1a | Max curr: 0x00080008
> [    2.180432] mmc1: sdhci: Resp[0]:   0x00000b00 | Resp[1]:  0x00edc87f
> [    2.186961] mmc1: sdhci: Resp[2]:   0x325b5900 | Resp[3]:  0x00400e00
> [    2.193490] mmc1: sdhci: Host ctl2: 0x00000001
> [    2.197992] mmc1: sdhci: ADMA Err:  0x00000000 | ADMA Ptr: 0xec040208
> [    2.204521] mmc1: sdhci: ============================================
>
> Aside from the serial console noise the RPi still boots alright. But as it's
> printing one of these per SD operation which is a lot...
>
> I've been able to reproduce this both with arm and arn64 on multiple SD cards.
> Just copying the contents of a class 4 card into a class 10 one fixes the
> issue.
>
> Any ideas?
i saw this once during testing. AFAIR there has been some changes to
sdhci in the downstream tree, maybe they was related to this issue.
>
> Regards,
> Nicolas
>
