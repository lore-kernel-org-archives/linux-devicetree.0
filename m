From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/3] ARM: dts: sun4i: Allow to use the
 PH6 pin for GPIO on pcDuino1/2
Date: Sun, 11 Oct 2015 18:47:55 +0200
Message-ID: <20151011164755.GP2278@lukather>
References: <1444388979-12072-1-git-send-email-siarhei.siamashka@gmail.com>
 <1444388979-12072-2-git-send-email-siarhei.siamashka@gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jh06fhy6YTawvwPV"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBPFF5KYAKGQEQM47TDI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1444388979-12072-2-git-send-email-siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

--jh06fhy6YTawvwPV
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Fri, Oct 09, 2015 at 02:09:37PM +0300, Siarhei Siamashka wrote:
> The pcDuino1 board does not use any power switches at all for its
> two USB host ports and the VBUS pins are always connected to 5V.
> 
> The pcDuino2 board uses the RT9701GB power switch for its single
> USB host port, but the USB_EN pin (PD2) is pulled up with a 10K
> resistor. So that the USB power is still enabled by default,
> resulting in the same behaviour as pcDuino1 if nobody touches
> the PD2 pin. This minor difference is going to be handled in a
> follow-up patch, introducing a separate dts file for pcDuino2.
> 
> The primary reason for this fix is that the current dts file
> unnecessarily meddles with the PH3 and PH6 pins. But the PH6 pin
> is available on the Arduino-compatible expansion header and may
> have a better use for other purposes. This patch fixes the
> problem and now the PH6 pin can be used with the GPIO sysfs
> interface. Tested on a pcDuino2 board with a multimeter:
> 
>     echo 230 > /sys/class/gpio/export
>     echo "out" > /sys/class/gpio/gpio230/direction
>     echo 0 > /sys/class/gpio/gpio230/value
>     echo 1 > /sys/class/gpio/gpio230/value
> 
> USB still works as expected too.
> 
> Signed-off-by: Siarhei Siamashka <siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Applied, thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--jh06fhy6YTawvwPV--
