From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re: [PATCH v2] ARM: dts: sunxi: Add regulators for
 LeMaker BananaPi
Date: Tue, 18 Aug 2015 17:33:34 +0200
Message-ID: <20150818153334.GG2547@lukather>
References: <1438532305-5884-1-git-send-email-public_timo.s@silentcreek.de>
 <20150803094723.GD2564@lukather>
 <55BF688D.5010905@redhat.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BzCohdixPhurzSK4"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBUFAZWXAKGQE53YYOTQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55BF688D.5010905-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Timo Sigurdsson <public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
List-Id: devicetree@vger.kernel.org

--BzCohdixPhurzSK4
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Mon, Aug 03, 2015 at 03:11:41PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 03-08-15 11:47, Maxime Ripard wrote:
> >On Sun, Aug 02, 2015 at 06:18:25PM +0200, Timo Sigurdsson wrote:
> >>sun7i-a20-bananapi.dts doesn't contain regulator nodes for the AXP209 PMU
> >>driver, so add them to allow for voltage-scaling with cpufreq-dt.
> >>
> >>Signed-off-by: Timo Sigurdsson <public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org>
> >>---
> >>Changes since v1 (RFC):
> >>
> >>- Dropped the changes to the cpufreq operating points and renamed the patch
> >>accordingly
> >>- Limited the CPU voltage range so it doesn't exceed the SOC specifications
> >>---
> >>  arch/arm/boot/dts/sun7i-a20-bananapi.dts | 35 ++++++++++++++++++++++++++++----
> >>  1 file changed, 31 insertions(+), 4 deletions(-)
> >>
> >>diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi.dts b/arch/arm/boot/dts/sun7i-a20-bananapi.dts
> >>index 9f7b472..74382f3 100644
> >>--- a/arch/arm/boot/dts/sun7i-a20-bananapi.dts
> >>+++ b/arch/arm/boot/dts/sun7i-a20-bananapi.dts
> >>@@ -92,6 +92,10 @@
> >>  	status = "okay";
> >>  };
> >>
> >>+&cpu0 {
> >>+	cpu-supply = <&reg_dcdc2>;
> >>+};
> >>+
> >>  &ehci0 {
> >>  	status = "okay";
> >>  };
> >>@@ -119,13 +123,9 @@
> >>  	status = "okay";
> >>
> >>  	axp209: pmic@34 {
> >>-		compatible = "x-powers,axp209";
> >>  		reg = <0x34>;
> >>  		interrupt-parent = <&nmi_intc>;
> >>  		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> >>-
> >>-		interrupt-controller;
> >>-		#interrupt-cells = <1>;
> >>  	};
> >>  };
> >>
> >>@@ -182,6 +182,33 @@
> >>  	};
> >>  };
> >>
> >>+#include "axp209.dtsi"
> >>+
> >>+&reg_dcdc2 {
> >>+	regulator-always-on;
> >>+	regulator-min-microvolt = <1000000>;
> >>+	regulator-max-microvolt = <1400000>;
> >>+	regulator-name = "vdd-cpu";
> >>+};
> >>+
> >>+&reg_dcdc3 {
> >>+	regulator-always-on;
> >>+	regulator-min-microvolt = <1000000>;
> >>+	regulator-max-microvolt = <1400000>;
> >>+	regulator-name = "vdd-int-dll";
> >>+};
> >>+
> >>+&reg_ldo1 {
> >>+	regulator-name = "vdd-rtc";
> >>+};
> >>+
> >>+&reg_ldo2 {
> >>+	regulator-always-on;
> >>+	regulator-min-microvolt = <3000000>;
> >>+	regulator-max-microvolt = <3000000>;
> >>+	regulator-name = "avcc";
> >>+};
> >
> >What regulator provides the 3.3V regulator used in the rest of this DT
> >then (MMC, GMAC) ?
> 
> A separate fixed regulator, like most (all?) other axp209 using boards,
> e.g. the cubieboard has a TCS4199 regulator for this, and the banana
> boards use a XL8206/UP1746 for this, according to the schematics I
> have.

Ack.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--BzCohdixPhurzSK4--
