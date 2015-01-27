From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3] ARM: dts: sun7i: Add dts file for
 pcDuino 3 Nano board
Date: Tue, 27 Jan 2015 19:41:02 +0100
Message-ID: <20150127184102.GL7200@lukather>
References: <1422383265-6393-1-git-send-email-ats@offog.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4ybNbZnZ8tziJ7D6"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBNFZT6TAKGQE7SM7TJY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1422383265-6393-1-git-send-email-ats-G+91BasbrijYtjvyW6yDsg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Adam Sampson <ats-G+91BasbrijYtjvyW6yDsg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--4ybNbZnZ8tziJ7D6
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Tue, Jan 27, 2015 at 06:27:45PM +0000, Adam Sampson wrote:
> Add support for the LinkSprite pcDuino 3 Nano board. This is a low-cost
> Allwinner A20 board with Arduino-style GPIO headers; it features 1G RAM,
> 4G NAND flash, 1 micro-SD, 2 USB sockets, 1 micro USB socket for OTG and
> another for power in, HDMI, SATA, 5V power for SATA devices, gigabit
> Ethernet, an IR receiver, 3.5mm audio out and a MIPI camera connector.
> 
> For more details, see: http://linux-sunxi.org/LinkSprite_pcDuino3_Nano
> 
> Changes in v3:
> - rename LEDs to pcduino3-nano:green:usr[12]
> - remove optional features on Arduino headers (i2c2, spi0, uart2)
> 
> Signed-off-by: Adam Sampson <ats-G+91BasbrijYtjvyW6yDsg@public.gmane.org>

Applied, thanks.

Note that it will probably only show up in 3.21. The pull requests for
3.20 have been sent this week end, and unless something major and
unexpected shows up, I won't send others.

Thanks,
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--4ybNbZnZ8tziJ7D6--
