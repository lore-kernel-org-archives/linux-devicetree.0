From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 3/6] arm: dts: Add syscon-{reboot,
 poweroff} nodes for exynos5
Date: Fri, 20 Nov 2015 09:22:37 +0900
Message-ID: <564E67CD.3040807@samsung.com>
References: <1445333085-22837-1-git-send-email-alim.akhtar@samsung.com>
 <1445333085-22837-4-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1445333085-22837-4-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: kgene@kernel.org, javier@osg.samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 20.10.2015 18:24, Alim Akhtar wrote:
> This patch adds syscon-{reboot, poweroff} nodes to allow the
> generic syscon-{reboot, poweroff} driver to reset/poweroff exynos5 SoCs.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Reviewed-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Acked-by: Moritz Fischer <moritz.fischer@ettus.com>
> ---
>  arch/arm/boot/dts/exynos5.dtsi |   14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
