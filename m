From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/2] pci: Add IORESOURCE_BIT entry for PCIe ECAM resources.
Date: Mon, 02 Jun 2014 21:15:46 +0200
Message-ID: <4495090.ktpdXEyibD@wuerfel>
References: <20140530233034.GH1677@bart.dudau.co.uk> <20140602162306.4AB0FC40476@trevor.secretlab.ca> <2F6515B1-48FE-4ED6-908E-CC1CAD7AF403@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2F6515B1-48FE-4ED6-908E-CC1CAD7AF403@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: Grant Likely <grant.likely@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robherring2@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kishon Vijay Abraham I <kishon@ti.com>
List-Id: devicetree@vger.kernel.org

On Monday 02 June 2014 13:09:08 Kumar Gala wrote:
> > However, what do we do with the 2 cases that exist in upstream that
> >> are using ranges for cfg space?
> >=20
> > Ignore them in the core code? Make the specific host controller han=
dle
> > them I would think.
>=20
> I just meant, should we =E2=80=98break=E2=80=99 their DTs and move th=
em from using ranges to reg?

dw-pcie is used on a lot of systems, I think we should make the common
part of that driver always handle config space in a common way, and
move out the part that parses the ranges property into the individual
soc-specific glue drivers that want to keep optional backwards compatib=
ility
with existing dtbs.

Which one is the other driver?

	Arnd
