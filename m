From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 3/3] ARM: dts: sun4i: Enable USB DRC on pcDuino1/2
Date: Sun, 11 Oct 2015 19:06:35 +0200
Message-ID: <20151011170635.GR2278@lukather>
References: <1444388979-12072-1-git-send-email-siarhei.siamashka@gmail.com>
 <1444388979-12072-4-git-send-email-siarhei.siamashka@gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="84mZ5ifxO1MoKVCL"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBHFO5KYAKGQE72J5Y5I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1444388979-12072-4-git-send-email-siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Siarhei Siamashka <siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Zoltan HERPAI <wigyori-1V5s5g7wVVk@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--84mZ5ifxO1MoKVCL
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Fri, Oct 09, 2015 at 02:09:39PM +0300, Siarhei Siamashka wrote:
> Enable the otg/drc usb controller on the pcDuino1/2 board. Note
> that the pcDuino1 FEX file from the vendor contains the following
> information in the [usbc0] section:
>     usb_id_gpio = port:PH04<0><1><default><default>
>     usb_det_vbus_gpio = port:PH05<0><0><default><default>
>     usb_drv_vbus_gpio = port:PB09<1><0><default><0>
> While the pcDuino2 FEX has:
>     usb_id_gpio = port:PH04<0><1><default><default>
>     usb_det_vbus_gpio = port:PH05<0><0><default><default>
>     usb_drv_vbus_gpio = port:PD02<1><0><default><0>
> 
> The ID pin is indeed PH4. The PD2 pin can be used to switch power
> on/off for the USB Type A receptacle on pcDuino2, but it has nothing
> to do with the MicroUSB OTG receptacle. The VBUS pin of the MicroUSB
> receptacle is always connected to 5V according to the schematics
> (both pcDuino1 and pcDuino2) and confirmed by doing some tests on
> pcDuino2. The PH5 pin is just one of the pins on the J8 expansion
> header and has nothing to do with USB OTG. The PB9 pin is pulled
> up and connected to the N_VBUSEN pin of AXP209 PMIC, while the
> VBUS pin of AXP209 only has a capacitor between it and the
> ground (this pin is not used for anything else).
> 
> To sum it up. Only the ID pin (PH4) has a real use. And 5V voltage
> is always served to the MicroUSB OTG receptacle no matter what is
> the state of the PB9/PD2 pins.
> 
> This patch has been tested on pcDuino2 to work fine in a host role
> with a USB keyboard connected via an OTG cable. It also works fine
> in a device role (cdc_ether) with a regular Micro-B cable connected
> to a desktop PC.
> 
> Signed-off-by: Siarhei Siamashka <siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Applied, thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--84mZ5ifxO1MoKVCL--
