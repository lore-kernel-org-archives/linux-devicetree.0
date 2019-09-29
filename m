From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH AUTOSEL 4.19 12/33] MIPS: lantiq: update the clock alias'
 for the mainline PCIe PHY driver
Date: Sun, 29 Sep 2019 19:40:28 +0200
Message-ID: <CAFBinCCD7xTnektDhDa+wRsAWmyzMwgfou59Y3=Qf8b2utaciw@mail.gmail.com>
References: <20190929173424.9361-1-sashal@kernel.org> <20190929173424.9361-12-sashal@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190929173424.9361-12-sashal@kernel.org>
Sender: stable-owner@vger.kernel.org
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, john@phrozen.org, kishon@ti.com, ralf@linux-mips.org, robh+dt@kernel.org, Hauke Mehrtens <hauke@hauke-m.de>, mark.rutland@arm.com, ms@dev.tdt.de
List-Id: devicetree@vger.kernel.org

Hi Sasha,

On Sun, Sep 29, 2019 at 7:34 PM Sasha Levin <sashal@kernel.org> wrote:
>
> From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> [ Upstream commit ed90302be64a53d9031c8ce05428c358b16a5d96 ]
>
> The mainline PCIe PHY driver has it's own devicetree node. Update the
> clock alias so the mainline driver finds the clocks.
the mainline PCIe PHY driver only made it into Linux 5.4
I am pointing this out because OpenWrt uses an out-of-tree PCIe driver
with Linux 4.19 and this patch will break that if we don't do
additional work there

thus I would like to understand why this got queued as backport for
various -stable kernels


Martin
