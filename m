From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v3 3/4] arm64: dts: rockchip: Define drive-impedance-ohm for RK3399's emmc-phy.
Date: Wed, 27 Mar 2019 13:46:52 +0100
Message-ID: <3316794.yJZ3nBLoSG@phil>
References: <20190322113456.16324-1-christoph.muellner@theobroma-systems.com> <20190322113456.16324-3-christoph.muellner@theobroma-systems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190322113456.16324-3-christoph.muellner@theobroma-systems.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Muellner <christoph.muellner@theobroma-systems.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, shawn.lin@rock-chips.com, Philipp Tomsich <philipp.tomsich@theobroma-systems.com>, Kishon Vijay Abraham I <kishon@ti.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Matthias Brugger <mbrugger@suse.com>, Brian Norris <briannorris@chromium.org>, Klaus Goger <klaus.goger@theobroma-systems.com>, Douglas Anderson <dianders@chromium.org>, Viresh Kumar <viresh.kumar@linaro.org>, Ezequiel Garcia <ezequiel@collabora.com>, Randy Li <ayaka@soulik.info>, Tony Xie <tony.xie@rock-chips.com>, Vicente Bergas <vicencb@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Freitag, 22. März 2019, 12:34:52 CET schrieb Christoph Muellner:
> A previous patch introduced the property 'drive-impedance-ohm'
> for the RK3399's emmc phy node. This patch sets this value
> explicitly to the default value of 50 Ohm.
> 
> Signed-off-by: Christoph Muellner <christoph.muellner@theobroma-systems.com>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@theobroma-systems.com>

applied patches 3+4 for 5.2

Thanks
Heiko
