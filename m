From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 06/13] musb: Add support for the
 Allwinner sunxi musb controller
Date: Tue, 26 May 2015 10:48:02 -0500
Message-ID: <20150526154802.GL26599@saruman.tx.rr.com>
References: <1426878682-14521-1-git-send-email-hdegoede@redhat.com>
 <1426878682-14521-7-git-send-email-hdegoede@redhat.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DN8g+DOX2TxGxleI"
Return-path: <linux-sunxi+bncBC5M7T4HYEKRBMVMSKVQKGQE4VQS6OQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1426878682-14521-7-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--DN8g+DOX2TxGxleI
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Fri, Mar 20, 2015 at 08:11:15PM +0100, Hans de Goede wrote:
> This is based on initial code to get the Allwinner sunxi musb controller
> supported by Chen-Yu Tsai and Roman Byshko.
> 
> This adds support for the Allwinner sunxi musb controller in both host only
> and otg mode. Peripheral only mode is not supported, as no boards use that.
> 
> This has been tested on a cubietruck (A20 SoC) and an UTOO P66 tablet
> (A13 SoC) with a variety of devices in host mode and with the g_serial gadget
> driver in peripheral mode, plugging otg / host cables in/out a lot of times
> in all possible imaginable plug orders.
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

drivers/usb/musb/sunxi.c:28:11: error: unable to open 'linux/soc/sunxi/sunxi_sram.h'
scripts/Makefile.build:264: recipe for target 'drivers/usb/musb/sunxi.o' failed
make[2]: *** [drivers/usb/musb/sunxi.o] Error 1
make[2]: *** Waiting for unfinished jobs....
scripts/Makefile.build:403: recipe for target 'drivers/usb/musb' failed
make[1]: *** [drivers/usb/musb] Error 2
Makefile:1548: recipe for target 'drivers/usb/' failed
make: *** [drivers/usb/] Error 2

What is the dependency ?

-- 
balbi
--DN8g+DOX2TxGxleI--
