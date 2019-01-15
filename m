From: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH v2 0/2] Support for eMMC in AM65x-evm
Date: Tue, 15 Jan 2019 08:29:48 -0600
Message-ID: <20190115142948.3fq2i6vav7jn4ulq@kahuna>
References: <20190110073355.3382-1-faiz_abbas@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190110073355.3382-1-faiz_abbas@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Faiz Abbas <faiz_abbas@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, robh+dt@kernel.org, t-kristo@ti.com
List-Id: devicetree@vger.kernel.org

On 13:03-20190110, Faiz Abbas wrote:
> The following patches add eMMC support on TI's AM65x-evm.
> 
> v2:
>  1. The SD card node is under debug for some usecases.
>     Only upstreaming eMMC support for now.
>  2. Rebased to latest mainline.
>  3. Removed status = "disabled" from dtsi patch
>  4. Fixed node name to not include '_'s
> 
> Faiz Abbas (2):
>   arm64: dts: ti: k3-am654: Add Support for MMC/SD
>   arm64: dts: ti: k3-am654-base-board: Add MMC/SD support

Once the $subject changes in the above two patches (should be emmc
instead of MMC/SD):

Acked-by: Nishanth Menon <nm@ti.com>

> 
>  arch/arm64/boot/dts/ti/k3-am65-main.dtsi      | 13 ++++++++++
>  .../arm64/boot/dts/ti/k3-am654-base-board.dts | 25 +++++++++++++++++++
>  2 files changed, 38 insertions(+)
> 
> -- 
> 2.19.2
> 

-- 
Regards,
Nishanth Menon
