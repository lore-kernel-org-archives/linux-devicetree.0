From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: sun8i: h3: Add dts file for
 Libre Computer Board ALL-H3-CC H3 ver.
Date: Tue, 5 Dec 2017 11:03:50 +0100
Message-ID: <20171205100350.2v3cxcwb7lde3ykw@flea.lan>
References: <20171205060615.14349-1-wens@csie.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pieb5dgr5mc4nf4n"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBHG6THIQKGQEMXWT65I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20171205060615.14349-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--pieb5dgr5mc4nf4n
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Tue, Dec 05, 2017 at 02:06:15PM +0800, Chen-Yu Tsai wrote:
> The Libre Computer Board ALL-H3-CC from Libre Technology is a Raspberry
> Pi B+ form factor single board computer based on the Allwinner H3 SoC.
> The board has 1GB DDR3 SDRAM, provided by 4 2Gb chips. The mounting holes
> and connectors are in the exact same position as on the Raspberry Pi B+.
> 
> Raspberry Pi B+ like peripherals supported on this board include:
> 
>   - Power input through micro-USB connector (without USB OTG)
>   - Native 100 Mbps ethernet using the internal PHY, as opposed to
>     USB-based on the RPi
>   - 4x USB 2.0 host ports, directly connected to the SoC, as opposed to
>     being connected through a USB 2.0 hub on the RPi
>   - TV and audio output on a 3.5mm TRRS jack
>   - HDMI output
>   - Micro-SD card slot
>   - Standard RPi B+ GPIO header, with the standard peripherals routed to
>     the same pins.
> 
>     * 5V, 3.3V power, and ground
>     * I2C0 on the H3 is routed to I2C1 pins on the RPi header
>     * I2C1 on the H3 is routed to I2C0 pins on the RPi header
>     * UART1 on the H3 is routed to UART0 pins on the RPi header
>     * SPI0 on the H3 is routed to SPI0 pins on the RPi header,
>       with GPIO pin PA17 replacing the missing Chip Select 1
>     * I2S1 on the H3 is routed to PCM pins on the RPi header
> 
>   - Additional peripherals from the H3 are available on different pins.
>     These include I2S0, JTAG, PWM1, SPDIF, SPI1, and UART3
> 
> In addition, there are a number of new features:
> 
>   - Console UART header
>   - Consumer IR receiver
>   - Camera interface (not compatible with RPi)
>   - Onboard microphone
>   - eMMC expansion module port
>   - Heatsink mounting holes
>   - Power button
> 
> The power button requires corresponding software for the embedded
> coprocessor to properly function.
> 
> This patch adds a dts file for this board that enables all "onboard"
> peripherals currently supported. This means no display or camera
> support.
> 
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Applied, thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--pieb5dgr5mc4nf4n--
