From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2] ARM: dts: rockchip: remove disable-wp from rv1108-elgin-r1 emmc node
Date: Tue, 12 Mar 2019 09:29:21 +0100
Message-ID: <8230885.i9KLFSsvLL@phil>
References: <20190219130317.2817-1-jbx6244@gmail.com> <20190310151928.2344-1-jbx6244@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190310151928.2344-1-jbx6244@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Jonker <jbx6244@gmail.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Sonntag, 10. März 2019, 16:19:28 CET schrieb Johan Jonker:
> The mmc.txt didn't explicitly say disable-wp is for SD card slot only,
> but that is what it was designed for in the first place.
> Remove all disable-wp from emmc or sdio controllers.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

applied for 5.2

Thanks
Heiko
