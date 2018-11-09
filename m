From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v6 5/9] dt-bindings: ARM: document marvell,ecc-enable binding
Date: Fri, 9 Nov 2018 12:40:06 +0100
Message-ID: <CAK8P3a3PNvBhyQw0bfGxKmxj+KeJB2_TXtDx2R1BpjTCYNqVkA@mail.gmail.com>
References: <20181109070349.20464-1-chris.packham@alliedtelesis.co.nz> <20181109070349.20464-6-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181109070349.20464-6-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>, Borislav Petkov <bp@alien8.de>, jlu@pengutronix.de, Gregory CLEMENT <gregory.clement@bootlin.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, linux-edac@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 9, 2018 at 8:04 AM Chris Packham
<chris.packham@alliedtelesis.co.nz> wrote:
>
> Add documentation for the marvell,ecc-enable and marvell,ecc-disable
> properties which can be used to enable/disable ECC on the Marvell aurora
> cache.
>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---

Why do you need both enable and disable? Wouldn't one of them be enough here?

      Arnd
