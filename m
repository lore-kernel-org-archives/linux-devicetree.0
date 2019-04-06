From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-binding: mtd: physmap: Add example using addr-gpios property
Date: Sat, 06 Apr 2019 01:05:49 -0500
Message-ID: <5ca841be.1c69fb81.9bbef.2ef4@mx.google.com>
References: <20190329021322.6833-1-chris.packham@alliedtelesis.co.nz> <20190329021322.6833-3-chris.packham@alliedtelesis.co.nz>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190329021322.6833-3-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: bbrezillon@kernel.org, computersforpeace@gmail.com, dwmw2@infradead.org, marek.vasut@gmail.com, richard@nod.at, robh+dt@kernel.org, mark.rutland@arm.com, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 29 Mar 2019 15:13:22 +1300, Chris Packham wrote:
> Add an example showing how to use the addr-gpios property to deal with a
> system with limited IO space.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> Changes in v2:
> - None
> 
>  .../devicetree/bindings/mtd/mtd-physmap.txt      | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
