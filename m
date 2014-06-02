From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH 1/2] pci: Add IORESOURCE_BIT entry for PCIe ECAM
 resources.
Date: Mon, 02 Jun 2014 16:09:45 +0100
Message-ID: <20140602150945.964D4C40381@trevor.secretlab.ca>
References: <20140530233034.GH1677@bart.dudau.co.uk>
	<1401496601-31983-1-git-send-email-Liviu.Dudau@arm.com>
	<1401496601-31983-2-git-send-email-Liviu.Dudau@arm.com>
	<4756033.LkcFQN0chs@wuerfel>
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <4756033.LkcFQN0chs@wuerfel>
Sender: linux-pci-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Liviu Dudau <Liviu.Dudau@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Kumar Gala <galak@codeaurora.org>, Rob Herring <robherring2@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kishon Vijay Abraham I <kishon@ti.com>
List-Id: devicetree@vger.kernel.org

On Sat, 31 May 2014 20:41:04 +0200, Arnd Bergmann <arnd@arndb.de> wrote:
> On Saturday 31 May 2014 01:36:40 Liviu Dudau wrote:
> > We would like to be able to describe PCIe ECAM resources as
> > IORESOURCE_MEM blocks while distinguish them from standard
> > memory resources. Add an IORESOURCE_BIT entry for this case.
> > 
> > Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
> 
> I still don't see any value in this at all. What is the advantage
> of doing this opposed to just having a standardized 'reg' property
> for a particular compatible string?

I'm inclined to agree. It doesn't seem appropriate to put config space
in ranges, and the host controller binding is responsible for
identifying how config space is memory mapped.

g.
