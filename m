From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/5] Documentation: dt: mtd: add chip support for "jedec,
 spi-nor"
Date: Mon, 12 Dec 2016 11:09:03 -0600
Message-ID: <20161212170903.ixr6iu4c5txzreub@rob-hp-laptop>
References: <1481188984-43683-1-git-send-email-yao.yuan@freescale.com>
 <1481188984-43683-4-git-send-email-yao.yuan@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1481188984-43683-4-git-send-email-yao.yuan@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yuan Yao <yao.yuan@freescale.com>
Cc: shawnguo@kernel.org, mark.rutland@arm.com, computersforpeace@gmail.com, dwmw2@infradead.org, devicetree@vger.kernel.org, yao.yuan@nxp.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 08, 2016 at 05:23:02PM +0800, Yuan Yao wrote:
> From: Yuan Yao <yao.yuan@nxp.com>

The compatible string is wrong in the subject.

> 
> "sst25wf040b" and "en25s64" are also chip compatible with SPI NOR flash.
> 
> Signed-off-by: Yuan Yao <yao.yuan@nxp.com>
> ---
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 2 ++
>  1 file changed, 2 insertions(+)

Otherwise,

Acked-by: Rob Herring <robh@kernel.org>
