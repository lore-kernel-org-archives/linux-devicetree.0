From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 0/3] add dwc2 support for px30
Date: Mon, 24 Sep 2018 15:47:12 +0200
Message-ID: <102522978.rGKrA9VWk8@phil>
References: <20180802130133.4898-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180802130133.4898-1-heiko@sntech.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-usb@vger.kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, balbi@kernel.org, gregkh@linuxfoundation.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, cl@rock-chips.com, hminas@synopsys.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 2. August 2018, 15:01:30 CEST schrieb Heiko Stuebner:
> This is split out from the series adding the px30 support, due to
> the dwc2 binding change not having landed yet in a maintainer tree.
> 
> The Acked binding change should go through some usb tree, while
> I'll pick up the dts changes once that has happened.
> 
> The binding itself is unchanged.
> 
> 
> Heiko Stuebner (2):
>   arm64: dts: rockchip: add dwc2 otg controller on px30
>   arm64: dts: rockchip: enable dwc2-based otg controller on px30-evb
> 
> Liang Chen (1):
>   dt-bindings: usb: dwc2: add description for px30

applied all 3 patches for 4.20 now.
