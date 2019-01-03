From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] ARM: dts: rockchip: rk3188: remove qos_cif1
Date: Thu, 03 Jan 2019 12:37:33 +0100
Message-ID: <2303683.qio212mU3e@phil>
References: <20190102193552.5853-1-jbx6244@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190102193552.5853-1-jbx6244@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Jonker <jbx6244@gmail.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 2. Januar 2019, 20:35:52 CET schrieb Johan Jonker:
> While the rk3066 does have 2 camera interfaces, the rk3188 does not, so
> there also isn't a QoS block for that non-existing interface, so remove it.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>

applied as fix for 4.21

Thanks
Heiko
