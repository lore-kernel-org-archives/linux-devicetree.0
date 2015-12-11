From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: sun7i: Add Itead Ibox support
Date: Fri, 11 Dec 2015 11:59:30 +0100
Message-ID: <20151211105930.GM27957@lukather>
References: <1449599344-15544-1-git-send-email-codekipper@gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="d6Ruhs/CrrKSNzcV"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBE6ZVKZQKGQE26RU2RI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1449599344-15544-1-git-send-email-codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--d6Ruhs/CrrKSNzcV
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Tue, Dec 08, 2015 at 07:29:03PM +0100, codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> The Itead Ibox is a multi board device based on the Allwinner A20 SoC.
> It contains the A20 Itead Core module and a base board for the external
> interfaces.
> 
> The core module comes with 4GB NAND and 1GB DDR RAM.
> 
> The base board to which the core board is connected provides 3 USB 2.0 Host
> ports, 1 USB 2.0 OTG, 1 uSD slot, 10/100 Ethernet port, HDMI, IR receiver,
> SPDIF and a 32-pin GPIO header. This header expands the features of core
> board by exposing the VGA pins, audio In/Out pins, SATA, SPI, I2C, UARTS,
> USB-OTG and power.
> 
> As there is an A10 version of the Itead Core Module and at least one other
> base board to support then this patch partitions the device tree files with
> some consideration that these variants may be added later.
> 
> Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile                     |   1 +
>  arch/arm/boot/dts/sun7i-a20-itead-core.dtsi    |  83 ++++++++++++++++++
>  arch/arm/boot/dts/sun7i-a20-itead-ibox.dts     |  98 ++++++++++++++++++++++
>  arch/arm/boot/dts/sunxi-itead-core-common.dtsi | 111 +++++++++++++++++++++++++
>  4 files changed, 293 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun7i-a20-itead-core.dtsi
>  create mode 100644 arch/arm/boot/dts/sun7i-a20-itead-ibox.dts
>  create mode 100644 arch/arm/boot/dts/sunxi-itead-core-common.dtsi

So, it looks like you're doing several things in this patch:

1) Create a common DTSI for all itead core variants
   (sunxi-itead-core-common.dtsi)

2) Create an A20 variant of the itead core
3) Add support for a board using the A20 itead core.

Please make three different patches for this, and converting the A10
itead board would be a good idea too.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--d6Ruhs/CrrKSNzcV--
