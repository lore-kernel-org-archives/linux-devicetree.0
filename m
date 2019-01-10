From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v5 1/5] arm64: dts: rockchip: Add DT for NanoPC-T4
Date: Thu, 10 Jan 2019 14:37:06 +0100
Message-ID: <3242500.qteudgsQcv@phil>
References: <cover.1546981251.git.robin.murphy@arm.com>
 <a92dd6f978b2b026557ca681610400c83ebf59b2.1546981251.git.robin.murphy@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <a92dd6f978b2b026557ca681610400c83ebf59b2.1546981251.git.robin.murphy@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Robin Murphy <robin.murphy@arm.com>
Cc: linux-rockchip@lists.infradead.org, tomeu.vizoso@collabora.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 8. Januar 2019, 22:57:23 CET schrieb Robin Murphy:
> From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> 
> This adds a device tree for the NanoPC-T4 SBC, which is based on the
> Rockchip RK3399 SoC and marketed by FriendlyELEC.
> 
> Known working:
> 
> - Serial
> - Ethernet
> - HDMI
> - USB 2.0
> 
> All of the interesting stuff is in a .dtsi because there are at least
> two other boards that share most of it: NanoPi M4 and NanoPi NEO4.
> 
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> [rm: various further cleanup]
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

nobody complained, the binding was reviewed and all looks good
so I've gone forward and applied this one for 5.1 already.

Thanks
Heiko
