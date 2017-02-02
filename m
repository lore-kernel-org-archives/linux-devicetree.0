From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 1/2] arm64: dts: exynos: Add USB 3.0 controller node
 for Exynos7
Date: Thu, 2 Feb 2017 19:49:47 +0200
Message-ID: <20170202174947.twehjebyseycperh@kozik-lap>
References: <1484721173-30474-1-git-send-email-pankaj.dubey@samsung.com>
 <CGME20170118063008epcas5p26a5a1fd73d843b2b08eae0fdb03b775c@epcas5p2.samsung.com>
 <1484721173-30474-2-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1484721173-30474-2-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, kgene@kernel.org, robh+dt@kernel.org, sanath@samsung.com, javier@osg.samsung.com, Vivek Gautam <gautamvivek1987@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 18, 2017 at 12:02:52PM +0530, Pankaj Dubey wrote:
> From: Vivek Gautam <gautamvivek1987@gmail.com>
> 
> Add USB 3.0 DRD controller device node, with its clock
> and phy information to enable the same on Exynos7.
> 
> Signed-off-by: Vivek Gautam <gautamvivek1987@gmail.com>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos7.dtsi | 34 +++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 

Thanks, applied.

Best regards,
Krzysztof
