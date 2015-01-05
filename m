From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 12/13] ARM: dts: sun6i: Add sun6i-a31s.dtsi
Date: Mon, 5 Jan 2015 10:08:25 +0100
Message-ID: <20150105090825.GA31311@lukather>
References: <1418836704-15689-1-git-send-email-hdegoede@redhat.com>
 <1418836704-15689-13-git-send-email-hdegoede@redhat.com>
 <20141219183450.GZ4820@lukather>
 <54954E77.4070302@redhat.com>
 <20141221223941.GC4820@lukather>
 <549820A4.9090900@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB2VJVGSQKGQE4YU35QA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <549820A4.9090900-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Mon, Dec 22, 2014 at 02:46:12PM +0100, Hans de Goede wrote:
> On 21-12-14 23:39, Maxime Ripard wrote:
> >On Sat, Dec 20, 2014 at 11:24:55AM +0100, Hans de Goede wrote:
> >>Hi,
> >>
> >>On 19-12-14 19:34, Maxime Ripard wrote:
> >>>On Wed, Dec 17, 2014 at 06:18:23PM +0100, Hans de Goede wrote:
> >>>>Add a dtsi file for A31s based boards.
> >>>>
> >>>>Since the  A31s is the same die as the A31 in a different package, this dtsi
> >>>>simply includes sun6i-a31.dtsi and then overrides the pinctrl compatible to
> >>>>reflect the different package, everything else is identical.
> >>>>
> >>>>Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >>>>---
> >>>>Changes in v2:
> >>>>-include sun6i-a31.dtsi and override the pinctrl compatible, rather then
> >>>>  copying everything
> >>>>---
> >>>>  arch/arm/boot/dts/sun6i-a31s.dtsi | 62 +++++++++++++++++++++++++++++++++++++++
> >>>>  1 file changed, 62 insertions(+)
> >>>>  create mode 100644 arch/arm/boot/dts/sun6i-a31s.dtsi
> >>>>
> >>>>diff --git a/arch/arm/boot/dts/sun6i-a31s.dtsi b/arch/arm/boot/dts/sun6i-a31s.dtsi
> >>>>new file mode 100644
> >>>>index 0000000..d0bd2b9
> >>>>--- /dev/null
> >>>>+++ b/arch/arm/boot/dts/sun6i-a31s.dtsi
> >>>>@@ -0,0 +1,62 @@
> >>>>+/*
> >>>>+ * Copyright 2014 Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >>>>+ *
> >>>>+ * This file is dual-licensed: you can use it either under the terms
> >>>>+ * of the GPL or the X11 license, at your option. Note that this dual
> >>>>+ * licensing only applies to this file, and not this project as a
> >>>>+ * whole.
> >>>>+ *
> >>>>+ *  a) This library is free software; you can redistribute it and/or
> >>>>+ *     modify it under the terms of the GNU General Public License as
> >>>>+ *     published by the Free Software Foundation; either version 2 of the
> >>>>+ *     License, or (at your option) any later version.
> >>>>+ *
> >>>>+ *     This library is distributed in the hope that it will be useful,
> >>>>+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> >>>>+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >>>>+ *     GNU General Public License for more details.
> >>>>+ *
> >>>>+ *     You should have received a copy of the GNU General Public
> >>>>+ *     License along with this library; if not, write to the Free
> >>>>+ *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
> >>>>+ *     MA 02110-1301 USA
> >>>>+ *
> >>>>+ * Or, alternatively,
> >>>>+ *
> >>>>+ *  b) Permission is hereby granted, free of charge, to any person
> >>>>+ *     obtaining a copy of this software and associated documentation
> >>>>+ *     files (the "Software"), to deal in the Software without
> >>>>+ *     restriction, including without limitation the rights to use,
> >>>>+ *     copy, modify, merge, publish, distribute, sublicense, and/or
> >>>>+ *     sell copies of the Software, and to permit persons to whom the
> >>>>+ *     Software is furnished to do so, subject to the following
> >>>>+ *     conditions:
> >>>>+ *
> >>>>+ *     The above copyright notice and this permission notice shall be
> >>>>+ *     included in all copies or substantial portions of the Software.
> >>>>+ *
> >>>>+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> >>>>+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> >>>>+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> >>>>+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> >>>>+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> >>>>+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> >>>>+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> >>>>+ *     OTHER DEALINGS IN THE SOFTWARE.
> >>>>+ */
> >>>>+
> >>>>+/*
> >>>>+ * The A31s is the same die as the A31 in a different package, this is
> >>>>+ * reflected by it having different pinctrl compatible everything else is
> >>>>+ * identical.
> >>>>+ */
> >>>>+
> >>>>+/include/ "sun6i-a31.dtsi"
> >>>>+
> >>>>+/ {
> >>>>+	soc@01c00000 {
> >>>>+		pio: pinctrl@01c20800 {
> >>>>+			compatible = "allwinner,sun6i-a31s-pinctrl";
> >>>>+		};
> >>>>+	};
> >>>>+};
> >>>
> >>>Given your previous changes, you should also update the enable-method.
> >>
> >>I've not added a new compatible for the enable-method, given that
> >>this is the exact same die, so the 2 are 100?% compatible, just like you
> >>insisted that "allwinner,sun4i-a10-mod0-clk" should be used for the ir-clk
> >>since it was 100% compatible to that I believe that the enable method
> >>should use the existing compatible and not invent a new one for something
> >>which is 100% compatible.
> >
> >Yeah, you have a point and I agree, but your patch 3 does add a
> >CPU_METHOD_OF_DECLARE for the A31s.
> 
> Ah right, it does, my bad.
> 
> >Since I was going to push the branch now that 3.19-rc1 is out, do you
> >want me to edit your patch before doing so?
> 
> Yes, please drop the addition of the extra CPU_METHOD_OF_DECLARE, or let
> me know if you want a new version instead.

I just modified it, and pushed it, no need to resend it.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--GvXjxJ+pjyke8COw--
