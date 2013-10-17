From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH V2] ARM: dts: Exynos5420: Add device nodes for GScaler
 blocks
Date: Thu, 17 Oct 2013 15:58:08 +0200
Message-ID: <1654668.cjaYLCemzK@amdc1227>
References: <1381989300-21818-1-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1381989300-21818-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, devicetree@vger.kernel.org, khw0178.kim@samsung.com, cpgs@samsung.com
List-Id: devicetree@vger.kernel.org

Hi Leela,

On Thursday 17 of October 2013 11:25:00 Leela Krishna Amudala wrote:
> Adds G-Scaler device nodes to the DT device list
> 
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
> 
> Changes since V1:
> 	- Changed the patch subject
> 	- Changed the node name to video-scaler 
> 	  suggested by Tomasz Figa <t.figa@samsung.com>
> 
> Note: G-scaler probe test done on Kgene's for-next branch.
> 
>  arch/arm/boot/dts/exynos5420.dtsi |   20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
