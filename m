From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH v2 03/12] PCI: aardvark: Add PHY support
Date: Mon, 17 Dec 2018 20:27:42 +0200
Message-ID: <87zht480v5.fsf@tkos.co.il>
References: <20181212102142.16053-1-miquel.raynal@bootlin.com> <20181212102142.16053-4-miquel.raynal@bootlin.com> <20181214014701.373b220b@nic.cz> <20181214015712.31f749ea@nic.cz> <20181217170724.58421a29@xps13>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20181217170724.58421a29@xps13>
Sender: linux-kernel-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Marek Behun <marek.behun@nic.cz>, Nadav Haklai <nadavh@marvell.com>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, linux-pci@vger.kernel.org, Gregory Clement <gregory.clement@bootlin.com>, linux-kernel@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Miquel,

Miquel Raynal writes:
> Marek Behun <marek.behun@nic.cz> wrote on Fri, 14 Dec 2018 01:57:12
> +0100:
>
>> On Fri, 14 Dec 2018 01:47:01 +0100
>> Marek Behun <marek.behun@nic.cz> wrote:
>> 
>> > are there already patches for the A37xx comphy driver?  
>
> Please try the latest patches on top of phy -next (with PHY interface
> mode), available there [1]. You can pick only the COMPHY patches, but
> keep them over the phy -next branch.
>
> Please note that for the SMC calls to succeed you must use a recent
> ATF. Personally I used to work with the 'atf-v1.5-devel' branch of
> Marvell's misl-atf repository but it is not available anymore. If you
> already have a clone, then you are good to go, otherwise it might be
> great if someone from Marvell could share a public Github link?

The latest ATF from Marvell is at the 'atf-v1.5-armada-18.09' branch at

  https://github.com/MarvellEmbeddedProcessors/atf-marvell

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
