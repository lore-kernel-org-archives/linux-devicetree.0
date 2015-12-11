From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: sun7i: Olimex A20-SOM-EVB:
 Add LRADC keys
Date: Fri, 11 Dec 2015 09:22:07 +0100
Message-ID: <20151211082207.GK27957@lukather>
References: <1449779521-754-1-git-send-email-merker@debian.org>
 <1449779521-754-2-git-send-email-merker@debian.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y3hCyKCCnioDaTIs"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBMMPVKZQKGQECZR6VDQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1449779521-754-2-git-send-email-merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--Y3hCyKCCnioDaTIs
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Thu, Dec 10, 2015 at 09:31:59PM +0100, Karsten Merker wrote:
> The Olimex A20-SOM-EVB is an evaluation board for the Olimex
> A20-SOM system-on-module.  It provides a set of android-style
> buttons (labeled "VOL+", "VOL-", "MENU", "SEARCH", "HOME", "ESC"
> and "ENTER") which are connected to a low-resolution ADC via a
> resistor network.
> 
> This patch adds appropriate button definitions to the board
> dts. The voltages assigned to the keys are specified in the
> board schematics published by the manufacturer.
> 
> Signed-off-by: Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>

Applied 1 and 2, thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--Y3hCyKCCnioDaTIs--
