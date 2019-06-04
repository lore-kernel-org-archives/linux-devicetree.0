From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v3 5/7] dmaengine: sun6i: Add support for H6 DMA
Date: Tue, 4 Jun 2019 17:58:51 +0530
Message-ID: <20190604122851.GD15118@vkoul-mobl>
References: <20190527201459.20130-1-peron.clem@gmail.com>
 <20190527201459.20130-6-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190527201459.20130-6-peron.clem@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>
List-Id: devicetree@vger.kernel.org

On 27-05-19, 22:14, Clément Péron wrote:
> From: Jernej Skrabec <jernej.skrabec@siol.net>
> 
> H6 DMA has more than 32 supported DRQs, which means that configuration
> register is slightly rearranged. It also needs additional clock to be
> enabled.
> 
> Add support for it.

Applied, thanks

-- 
~Vinod
