From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun6i: Add a dts file for the
 Mele A1000G quad top set box
Date: Tue, 2 Jun 2015 17:58:16 +0200
Message-ID: <20150602155816.GC23777@lukather>
References: <1433170979-13725-1-git-send-email-hdegoede@redhat.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1RftZa7o64Huaoir"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBA5GW6VQKGQE3AIAQTI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1433170979-13725-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--1RftZa7o64Huaoir
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Mon, Jun 01, 2015 at 05:02:59PM +0200, Hans de Goede wrote:
> The Mele A1000G-quad and the Mele M9 have the same PCB, sofar we've been using
> the same dts for both models. Unfortunately this does not work for the otg
> controller, on the M9 this is routed to a micro-usb connector on the outside,
> while as on the A1000G-quad it is connected to an usb to sata bridge
> (which is not populated on the M9 pcb).
> 
> This commit adds a new dts for the Mele-A1000G-quad to allow using
> different otg controller settings on the 2 boards.
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile                                        | 1 +
>  arch/arm/boot/dts/{sun6i-a31-m9.dts => sun6i-a31-a1000g-quad.dts} | 4 ++--

Didn't we say that we were trying to set the vendor name in the DTs
now, at least for the new ones?

I can fix this and apply it if it's ok for you.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--1RftZa7o64Huaoir--
