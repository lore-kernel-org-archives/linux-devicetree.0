From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/6] media: dt-bindings: media: sun6i: Separate H3
 compatible from A31
Date: Tue, 11 Dec 2018 20:33:55 -0600
Message-ID: <20181212023355.GA7324@bogus>
References: <20181130075849.16941-1-wens@csie.org>
 <20181130075849.16941-2-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181130075849.16941-2-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 30 Nov 2018 15:58:44 +0800, Chen-Yu Tsai wrote:
> The CSI controller found on the H3 (and H5) is a reduced version of the
> one found on the A31. It only has 1 channel, instead of 4 channels for
> time-multiplexed BT.656. Since the H3 is a reduced version, it cannot
> "fallback" to a compatible that implements more features than it
> supports.
> 
> Split out the H3 compatible as a separate entry, with no fallback.
> 
> Fixes: b7eadaa3a02a ("media: dt-bindings: media: sun6i: Add A31 and H3
> 		      compatibles")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  Documentation/devicetree/bindings/media/sun6i-csi.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
