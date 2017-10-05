From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 11/11] arm: allwinner: Correct unit name in devicetree
 binding example
Date: Thu, 5 Oct 2017 17:34:01 -0500
Message-ID: <20171005223401.wme5av4hzcc3lzgn@rob-hp-laptop>
References: <20170928014928.2272-1-stefan.bruens@rwth-aachen.de>
 <5b7a8fb3-21bb-417c-9471-1330dd379fd9@rwthex-w2-a.rwth-ad.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5b7a8fb3-21bb-417c-9471-1330dd379fd9@rwthex-w2-a.rwth-ad.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan =?iso-8859-1?Q?Br=FCns?= <stefan.bruens@rwth-aachen.de>
Cc: linux-sunxi@googlegroups.com, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Andre Przywara <andre.przywara@arm.com>, linux-kernel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vinod.koul@intel.com>, dmaengine@vger.kernel.org, Code Kipper <codekipper@gmail.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 28, 2017 at 03:49:28AM +0200, Stefan Brüns wrote:
> Unit-names must not start with a leading 0.
> 
> Signed-off-by: Stefan Brüns <stefan.bruens@rwth-aachen.de>
> 
> ---
> 
> Changes in v4:
> - Split minor fix in devicetree example from patch 6/10
> 
> Changes in v3: None
> Changes in v2: None
> 
>  Documentation/devicetree/bindings/dma/sun6i-dma.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
