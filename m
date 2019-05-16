From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2] arm64: dts: allwinner: a64:
 orangepi-win: Add wifi and bluetooth nodes
Date: Thu, 16 May 2019 10:52:57 +0200
Message-ID: <20190516085257.tbli227f7mm3daac@flea>
References: <20190514205445.11591-1-jernej.skrabec@siol.net>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5iqdhuknfkakdubp"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB3OJ6TTAKGQEV65SXGI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190514205445.11591-1-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--5iqdhuknfkakdubp
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Tue, May 14, 2019 at 10:54:45PM +0200, Jernej Skrabec wrote:
> The AP6212 is based on the Broadcom BCM43430 or BCM43438. The WiFi side
> identifies as BCM43430, while the Bluetooth side identifies as BCM43438.
>
> WiFi is connected to mmc1 and the Bluetooth side is connected to UART1
> in a 4 wire configuration. Same as the WiFi side, due to being the same
> chip and package, DLDO2 provides overall power via VBAT, and DLDO4
> provides I/O power via VDDIO. The RTC clock output provides the LPO low
> power clock at 32.768 kHz.
>
> This patch enables WiFi and Bluetooth on OrangePi Win boards and adds
> missing LPO clock on the WiFi side. PCM connection also exists for
> Bluetooth audio, but it's not used here.
>
> Bluetooth UART speed is set to 1.5 MBaud in order to be able transmit
> audio. While module supports even higher speeds, currently sunxi clock
> driver doesn't support higher speed.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>

Queued for 5.3, thanks

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--5iqdhuknfkakdubp--
