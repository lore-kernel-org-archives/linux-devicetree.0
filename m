From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] ARM: dts: imx6qdl-nitrogen6_som2: fix PCIe reset
Date: Thu, 17 Aug 2017 08:02:36 -0700
Message-ID: <20170817150236.GA8358@kroah.com>
References: <20170817135010.3042-1-gary.bisson@boundarydevices.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170817135010.3042-1-gary.bisson@boundarydevices.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gary Bisson <gary.bisson@boundarydevices.com>
Cc: shawnguo@kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 17, 2017 at 03:50:10PM +0200, Gary Bisson wrote:
> Previous value was a bad copy of nitrogen6_max device tree.
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  arch/arm/boot/dts/imx6qdl-nitrogen6_som2.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
