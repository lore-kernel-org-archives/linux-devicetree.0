From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] ARM: dts: rockchip: Add dp83867 CLK_OUT muxing
Date: Mon, 05 Mar 2018 18:04:48 +0100
Message-ID: <8543411.nbQLj7Vctj@diego>
References: <1520253911-46218-1-git-send-email-d.schultz@phytec.de>
 <3530074.WSbKf9j6h0@phil> <cecf3c08-d43d-c340-c5ff-30e41e338469@phytec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cecf3c08-d43d-c340-c5ff-30e41e338469@phytec.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Daniel Schultz <d.schultz@phytec.de>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, w.egorov@phytec.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Daniel,

Am Montag, 5. M=E4rz 2018, 16:57:13 CET schrieb Daniel Schultz:
> On 03/05/2018 03:15 PM, Heiko Stuebner wrote:
> > Am Montag, 5. M=E4rz 2018, 13:45:11 CET schrieb Daniel Schultz:
> >> The CLK_O_SEL default is synchronous to XI input clock, which is 25 MH=
z.
> >> Set CLK_O_SEL to channel A transmit clock so we have 125 MHz on CLK_OU=
T.
> >> =

> >> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
> >> ---
> >> =

> >> The binding will be added with the next merge of net-next:
> >> https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git/com=
mit
> >> /?id=3D9708fb630d19ee51ae3aeb3a533e3010da0e8570
> https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git/log/Do=
cum
> entation/devicetree/bindings/net/ti,dp83867.txt
> =

> If I search in the master branch, I get the patch. Did I searched wrong?

no ... seems I was just blind :-)

Heiko


> > I did find the commit, but no related change of the dp83867 dt binding
> > document [0], including a review by dt-maintainers.
> > =

> > While your property does not look overly complicated, the binding
> > should be updated nontheless.
> > =

> > =

> > Heiko
> > =

> > [0]
> > https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git/log/=
Do
> > cumentation/devicetree/bindings/net/ti,dp83867.txt?id=3D9708fb630d19ee5=
1ae3a
> > eb3a533e3010da0e8570> =

> >>   arch/arm/boot/dts/rk3288-phycore-som.dtsi | 1 +
> >>   1 file changed, 1 insertion(+)
> >> =

> >> diff --git a/arch/arm/boot/dts/rk3288-phycore-som.dtsi
> >> b/arch/arm/boot/dts/rk3288-phycore-som.dtsi index bdd80aa..e60535d
> >> 100644
> >> --- a/arch/arm/boot/dts/rk3288-phycore-som.dtsi
> >> +++ b/arch/arm/boot/dts/rk3288-phycore-som.dtsi
> >> @@ -141,6 +141,7 @@
> >> =

> >>   			ti,tx-internal-delay =3D <DP83867_RGMIIDCTL_2_00_NS>;
> >>   			ti,fifo-depth =3D <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> >>   			enet-phy-lane-no-swap;
> >> =

> >> +			ti,clk-output-sel =3D <DP83867_CLK_O_SEL_CHN_A_TCLK>;
> >> =

> >>   		};
> >>   	=

> >>   	};
> >>   =

> >>   };
