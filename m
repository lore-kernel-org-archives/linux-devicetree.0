From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: rk3399: rock960: Rename vcc_sys
 into vcc5v0_sys
Date: Tue, 12 Mar 2019 11:38:36 +0100
Message-ID: <2025500.4so6M6JK9C@phil>
References: <20190311150332.19492-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190311150332.19492-1-jagan@amarulasolutions.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Akash Gajjar <akash@openedev.com>, linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Montag, 11. M=E4rz 2019, 16:03:30 CET schrieb Jagan Teki:
> It is always better practice to follow regulator naming conventions
> as per the schematics for future references.
> =

> So, rename vcc_sys into vcc5v0_sys as per rk3399 power diagram of
> rock960 schematics.
> =

> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> Signed-off-by: Akash Gajjar <akash@openedev.com>

I've double-checked both rock960 and ficus schematics to verify
and applied both patch 1+2 for 5.2

Thanks
Heiko
