From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/2] bmips: add device tree example for BCM6358
Date: Mon, 4 Apr 2016 00:16:15 -0500
Message-ID: <20160404051615.GL17806@rob-hp-laptop>
References: <1456054881-26787-1-git-send-email-noltari@gmail.com>
 <1459677376-10449-1-git-send-email-noltari@gmail.com>
 <1459677376-10449-2-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-mips-bounce@linux-mips.org>
Content-Disposition: inline
In-Reply-To: <1459677376-10449-2-git-send-email-noltari@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, jogo@openwrt.org, cernekee@gmail.com
List-Id: devicetree@vger.kernel.org

On Sun, Apr 03, 2016 at 11:56:16AM +0200, =C1lvaro Fern=E1ndez Rojas wr=
ote:
> This adds a device tree example for SFR Neufbox4 (Sercomm version), w=
hich
> also serves as a real example for brcm,bcm6358-leds.
>=20
> Signed-off-by: =C1lvaro Fern=E1ndez Rojas <noltari@gmail.com>
> ---
>  v3: Device tree fixes
>   - Use interrupt-controller instead of periph_intc.
>   - Use led@# instead of naming the LEDs.
>  v2: Remove led0 alias and use stdout-path only
>=20
>  .../devicetree/bindings/mips/brcm/soc.txt          |   2 +-
>  arch/mips/bmips/Kconfig                            |   4 +
>  arch/mips/boot/dts/brcm/Makefile                   |   2 +
>  arch/mips/boot/dts/brcm/bcm6358.dtsi               | 111 +++++++++++=
++++++++++
>  arch/mips/boot/dts/brcm/bcm96358nb4ser.dts         |  46 +++++++++
>  5 files changed, 164 insertions(+), 1 deletion(-)
>  create mode 100644 arch/mips/boot/dts/brcm/bcm6358.dtsi
>  create mode 100644 arch/mips/boot/dts/brcm/bcm96358nb4ser.dts

Acked-by: Rob Herring <robh@kernel.org>
