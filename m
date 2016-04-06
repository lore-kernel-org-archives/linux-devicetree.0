From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: Re: [PATCH] ARM: dts: ls1021a: add SCFG MSI dts node
Date: Wed, 06 Apr 2016 14:00:16 +0200
Message-ID: <28653783.sxLdysvvje@ws-stein>
References: <1459940527-26437-1-git-send-email-Minghuan.Lian@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459940527-26437-1-git-send-email-Minghuan.Lian@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Minghuan Lian <Minghuan.Lian@nxp.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>, Stuart Yoder <stuart.yoder@nxp.com>, Yang-Leo Li <leoyang.li@nxp.com>
List-Id: devicetree@vger.kernel.org

On Wednesday 06 April 2016 19:02:07, Minghuan Lian wrote:
> Add SCFG MSI dts node and add msi-parent property to PCIe dts node
> that points to the corresponding MSI node.
> 
> Signed-off-by: Minghuan Lian <Minghuan.Lian@nxp.com>
> ---
>  arch/arm/boot/dts/ls1021a.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Tested-by: Alexander Stein <alexander.stein@systec-electronic.com>

Best regards,
Alexander
