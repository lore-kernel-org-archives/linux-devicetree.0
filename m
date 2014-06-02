From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/2] pci: Add IORESOURCE_BIT entry for PCIe ECAM resources.
Date: Mon, 02 Jun 2014 22:44:19 +0200
Message-ID: <5976198.MmsV3dNjlq@wuerfel>
References: <20140530233034.GH1677@bart.dudau.co.uk> <4495090.ktpdXEyibD@wuerfel> <95C66A63-9671-4AD5-9804-6647A305DB99@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <95C66A63-9671-4AD5-9804-6647A305DB99@codeaurora.org>
Sender: linux-pci-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: Grant Likely <grant.likely@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robherring2@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kishon Vijay Abraham I <kishon@ti.com>
List-Id: devicetree@vger.kernel.org

On Monday 02 June 2014 15:43:02 Kumar Gala wrote:
> Its imx6 and exynos, havent looked to see if dw-pcie is handling
> the parsing or not for them.

Ok, so they are both dw-pcie variants.

	Arnd 
