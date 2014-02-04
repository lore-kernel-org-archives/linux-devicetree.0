From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] arm64: Add architecture support for PCI
Date: Tue, 04 Feb 2014 20:21:38 +0100
Message-ID: <4118142.2mQ5BlBdTZ@wuerfel>
References: <1391453028-23191-1-git-send-email-Liviu.Dudau@arm.com> <8676627.b6SYsazoah@wuerfel> <20140204191055.GC25695@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140204191055.GC25695@obsidianresearch.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, linux-pci <linux-pci@vger.kernel.org>, Liviu Dudau <Liviu.Dudau@arm.com>, LKML <linux-kernel@vger.kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 04 February 2014 12:10:55 Jason Gunthorpe wrote:
> 
> For instance to support peer-to-peer IO you need to have a consisent,
> non-overlapping set of bus/device/function/tag to uniquely route TLPs
> within the chip. Cross domain TLP routing in HW is non-trivial.

Yes, that is a good reason.

> IOMMUs (and SR-IOv) rely on the BDF to identify the originating device
> for each TLP. Multiple domains means a much more complex IOMMU
> environment.

I fear we already have to support complex IOMMU setups on ARM,
whether there are multiple PCI domains or not. But it would be
nice in theory not to require it.

> Failure to integrate on-chip devices into the PCI world also means
> thing like SR-IOv won't work sanely with on-chip devices.

I'd consider this a feature ;)

But you are probably right: people will do SR-IOV whether we like
it or not, and they will try to do it on non-PCI devices too,
and great suffering will be involved.

	Arnd
