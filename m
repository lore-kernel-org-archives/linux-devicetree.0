From: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 4.19 12/33] MIPS: lantiq: update the clock alias'
 for the mainline PCIe PHY driver
Date: Sat, 5 Oct 2019 19:01:24 -0400
Message-ID: <20191005230124.GC25255@sasha-vm>
References: <20190929173424.9361-1-sashal@kernel.org>
 <20190929173424.9361-12-sashal@kernel.org>
 <CAFBinCCD7xTnektDhDa+wRsAWmyzMwgfou59Y3=Qf8b2utaciw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAFBinCCD7xTnektDhDa+wRsAWmyzMwgfou59Y3=Qf8b2utaciw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, john@phrozen.org, kishon@ti.com, ralf@linux-mips.org, robh+dt@kernel.org, Hauke Mehrtens <hauke@hauke-m.de>, mark.rutland@arm.com, ms@dev.tdt.de
List-Id: devicetree@vger.kernel.org

On Sun, Sep 29, 2019 at 07:40:28PM +0200, Martin Blumenstingl wrote:
>Hi Sasha,
>
>On Sun, Sep 29, 2019 at 7:34 PM Sasha Levin <sashal@kernel.org> wrote:
>>
>> From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>>
>> [ Upstream commit ed90302be64a53d9031c8ce05428c358b16a5d96 ]
>>
>> The mainline PCIe PHY driver has it's own devicetree node. Update the
>> clock alias so the mainline driver finds the clocks.
>the mainline PCIe PHY driver only made it into Linux 5.4
>I am pointing this out because OpenWrt uses an out-of-tree PCIe driver
>with Linux 4.19 and this patch will break that if we don't do
>additional work there
>
>thus I would like to understand why this got queued as backport for
>various -stable kernels

It went through the automatic selection process, where we attempt to
identify fixes that were not tagged for stable.

I've dropped this patch from all stable trees, thank you.

-- 
Thanks,
Sasha
