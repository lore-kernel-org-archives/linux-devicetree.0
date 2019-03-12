From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] arm64: dts: rockchip: Add Nanopi NEO4 initial support
Date: Tue, 12 Mar 2019 11:51:09 +0100
Message-ID: <14002714.JsTqZNVDqa@phil>
References: <20190308181202.11607-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190308181202.11607-1-jagan@amarulasolutions.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Akash Gajjar <akash@openedev.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Freitag, 8. M=E4rz 2019, 19:12:02 CET schrieb Jagan Teki:
> FriendlyElec NanoPi NEO4 is known to be a revision 4 based
> NanoPi4 series of boards.
> =

> Most of know peripherals are shared between Nanopi M4 vs NEO4, except
> - 1GB DDR3
> - USB Host ports
> - Missing DSI port
> - USB 2.0 Host with USB2PHY0 (no USB2PH1)
> =

> Add support for it, by reusing existing rk3399-nanopi4.dtsi
> =

> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> Signed-off-by: Akash Gajjar <akash@openedev.com>

applied for 5.2

Thanks
Heiko
