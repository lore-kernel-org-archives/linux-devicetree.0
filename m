From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 5/9] dt-bindings: ARM: document marvell,ecc-enable
 binding
Date: Sun, 11 Nov 2018 16:35:39 -0600
Message-ID: <20181111223539.GA27390@bogus>
References: <20181109070349.20464-1-chris.packham@alliedtelesis.co.nz>
 <20181109070349.20464-6-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181109070349.20464-6-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux@armlinux.org.uk, bp@alien8.de, arnd@arndb.de, jlu@pengutronix.de, gregory.clement@bootlin.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Fri,  9 Nov 2018 20:03:45 +1300, Chris Packham wrote:
> Add documentation for the marvell,ecc-enable and marvell,ecc-disable
> properties which can be used to enable/disable ECC on the Marvell aurora
> cache.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     Changes in v6:
>     - new (split binding doc from implementation).
> 
>  Documentation/devicetree/bindings/arm/l2c2x0.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
