From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] arm64: dts: rockchip: add usb3 controller node for RK3328
 SoCs
Date: Thu, 14 Mar 2019 20:21:12 +0100
Message-ID: <3517438.8SjcAmMXWL@diego>
References: <20190314182035.7101-1-papadakospan@gmail.com>
 <5530020.nRYjYCbPGH@diego> <1552590510.1381.1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1552590510.1381.1@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "Leonidas P. Papadakos" <papadakospan@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, william.wu@rock-chips.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi again :-)

Am Donnerstag, 14. M=E4rz 2019, 20:08:30 CET schrieb Leonidas P. Papadakos:
> I must say with my testing, I never really have any disconnects. My
> drive generally works

It's not any disconnects, it is really when you unplug the device from
the root port that the =


> Surely it's better that it works somewhat than not at all.
> Maybe we could include the patches and revert them later if a solution
> arrises?
> =

> Or is that against the Linux way of doing things?

The main issue is
               compatible =3D "rockchip,rk3328-dwc3", "rockchip,rk3399-dwc3=
";

because:
(1) On the devicetree-side you declare that they are compatible which may
    or may not conflict with needed later changes
(2) On the kernel-driver-side with the current status the rk3328-dwc3
    will get ignored and rk3399-dwc3 used to bind to the generic dt-dwc3
    driver.
    From looking at the Rockchip code in the vendor kernel we may very well
    need a separate driver to handle the big issue which creates the issue
    which driver will bind to the dt-node. It will be either the generic one
    binding to the rk3399-dwc3 or the special one binding to rk3328-dwc3.
    And sadly it will probably depend on which module gets loaded first.

And devicetrees are supposed to be backwards compatible so a newer
kernel should keep working with an old devicetree.

A possible way forward would be to introduce a separate compatible for
rk3328 (both in the binding doc and the generic dwc3 driver), so that
we get only a
               compatible =3D "rockchip,rk3328-dwc3";

Which then even can move easily into a new driver if necessary without
causing issues for existing devicetrees.

Heiko
