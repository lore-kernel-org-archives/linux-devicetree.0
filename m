From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 06/13] musb: Add support for the
 Allwinner sunxi musb controller
Date: Tue, 26 May 2015 12:06:02 -0500
Message-ID: <20150526170602.GQ26599@saruman.tx.rr.com>
References: <1426878682-14521-1-git-send-email-hdegoede@redhat.com>
 <1426878682-14521-7-git-send-email-hdegoede@redhat.com>
 <20150526154802.GL26599@saruman.tx.rr.com>
 <5564A10E.3040402@redhat.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Kuk/n493crKO4rgR"
Return-path: <linux-sunxi+bncBC5M7T4HYEKRBA6RSKVQKGQEOJPKU6I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5564A10E.3040402-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--Kuk/n493crKO4rgR
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Tue, May 26, 2015 at 06:36:30PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 05/26/2015 05:48 PM, Felipe Balbi wrote:
> >On Fri, Mar 20, 2015 at 08:11:15PM +0100, Hans de Goede wrote:
> >>This is based on initial code to get the Allwinner sunxi musb controller
> >>supported by Chen-Yu Tsai and Roman Byshko.
> >>
> >>This adds support for the Allwinner sunxi musb controller in both host only
> >>and otg mode. Peripheral only mode is not supported, as no boards use that.
> >>
> >>This has been tested on a cubietruck (A20 SoC) and an UTOO P66 tablet
> >>(A13 SoC) with a variety of devices in host mode and with the g_serial gadget
> >>driver in peripheral mode, plugging otg / host cables in/out a lot of times
> >>in all possible imaginable plug orders.
> >>
> >>Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >
> >drivers/usb/musb/sunxi.c:28:11: error: unable to open 'linux/soc/sunxi/sunxi_sram.h'
> >scripts/Makefile.build:264: recipe for target 'drivers/usb/musb/sunxi.o' failed
> >make[2]: *** [drivers/usb/musb/sunxi.o] Error 1
> >make[2]: *** Waiting for unfinished jobs....
> >scripts/Makefile.build:403: recipe for target 'drivers/usb/musb' failed
> >make[1]: *** [drivers/usb/musb] Error 2
> >Makefile:1548: recipe for target 'drivers/usb/' failed
> >make: *** [drivers/usb/] Error 2
> >
> >What is the dependency ?
> 
> Thanks you that you're working on this, the dependency is the sunxi sram
> controller driver which was supposed to get pulled for 4.1, but like many
> other ARM related pull-reqs did not get pulled. And now for 4.2 Arnd
> has decided that he does not like the driver even though it was
> ok for 4.1, and has not yet answered how else we should solve this...
> 
> Arnd, we would really like to move forward with musb support for sunxi
> which means we need a solution for the sram controller, can you please
> answer Maxime's latest mails on this, or accept the driver as is ?

all right, most of the other patches are in my testing/next (please have
a look when you have some extra time) so ony this patch will be pending
for v4.2.

-- 
balbi
--Kuk/n493crKO4rgR--
