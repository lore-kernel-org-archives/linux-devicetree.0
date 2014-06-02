From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH 1/2] pci: Add IORESOURCE_BIT entry for PCIe ECAM resources.
Date: Mon, 2 Jun 2014 15:43:02 -0500
Message-ID: <95C66A63-9671-4AD5-9804-6647A305DB99@codeaurora.org>
References: <20140530233034.GH1677@bart.dudau.co.uk> <20140602162306.4AB0FC40476@trevor.secretlab.ca> <2F6515B1-48FE-4ED6-908E-CC1CAD7AF403@codeaurora.org> <4495090.ktpdXEyibD@wuerfel>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.2\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <4495090.ktpdXEyibD@wuerfel>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Grant Likely <grant.likely@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robherring2@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kishon Vijay Abraham I <kishon@ti.com>
List-Id: devicetree@vger.kernel.org


On Jun 2, 2014, at 2:15 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> On Monday 02 June 2014 13:09:08 Kumar Gala wrote:
>>> However, what do we do with the 2 cases that exist in upstream that
>>>> are using ranges for cfg space?
>>>=20
>>> Ignore them in the core code? Make the specific host controller han=
dle
>>> them I would think.
>>=20
>> I just meant, should we =91break=92 their DTs and move them from usi=
ng ranges to reg?
>=20
> dw-pcie is used on a lot of systems, I think we should make the commo=
n
> part of that driver always handle config space in a common way, and
> move out the part that parses the ranges property into the individual
> soc-specific glue drivers that want to keep optional backwards compat=
ibility
> with existing dtbs.
>=20
> Which one is the other driver?
>=20
> 	Arnd

Its imx6 and exynos, havent looked to see if dw-pcie is handling the pa=
rsing or not for them.

- k

--=20
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, host=
ed by The Linux Foundation
