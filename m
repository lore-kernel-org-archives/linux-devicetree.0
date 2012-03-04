From: Michael Walle <michael@walle.cc>
Subject: Re: [PATCH 3/4] ARM: kirkwood: convert rtc-mv to fdt.
Date: Sun, 4 Mar 2012 15:59:23 +0100
Message-ID: <201203041559.23810.michael@walle.cc>
References: <cover.1330625877.git.jason@lakedaemon.net>
 <2c985a303f3b9b0cfcead25634b7e1db68d34ee3.1330625878.git.jason@lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <2c985a303f3b9b0cfcead25634b7e1db68d34ee3.1330625878.git.jason@lakedaemon.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, Jason Cooper <jason@lakedaemon.net>, arnd@arndb.de
List-Id: devicetree@vger.kernel.org

Am Donnerstag 01 M=E4rz 2012, 19:20:54 schrieb Jason Cooper:
> The comment at mach-kirkwood/common.c:469, says this device is in every
> kirkwood board.  So, it is placed in kirkwood.dtsi.
> =

> Signed-off-by: Jason Cooper <jason@lakedaemon.net>
> ---
>  arch/arm/boot/dts/kirkwood.dtsi   |    6 ++++++
>  arch/arm/mach-kirkwood/board-dt.c |    1 -
>  arch/arm/mach-kirkwood/common.c   |    2 +-
>  arch/arm/mach-kirkwood/common.h   |    1 -
>  drivers/rtc/rtc-mv.c              |   19 +++++++++++++++++++
>  5 files changed, 26 insertions(+), 3 deletions(-)
> =

> diff --git a/arch/arm/boot/dts/kirkwood.dtsi
> b/arch/arm/boot/dts/kirkwood.dtsi index 771c6bb..5fb185c 100644
> --- a/arch/arm/boot/dts/kirkwood.dtsi
> +++ b/arch/arm/boot/dts/kirkwood.dtsi
> @@ -2,5 +2,11 @@
> =

>  / {
>  	compatible =3D "marvell,kirkwood";
> +
> +	rtc@f1010300 {
> +		compatible =3D "marvell,rtc";
what about the names used here?

in my older patch series i flagged all converted devices with two =

compatibility names. Eg:

       { .compatible =3D "marvell,orion5x-rtc", },
       { .compatible =3D "marvell,kirkwood-rtc", },

IMHO marvell,rtc is i little too general, i guess marvell won't have only o=
ne =

rtc ;)

Other opinions?

-- =

Michael
