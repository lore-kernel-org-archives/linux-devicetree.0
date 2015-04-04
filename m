From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 0/5] ARM: sunxi: SRAM mapping support
Date: Sat, 4 Apr 2015 15:36:12 +0200
Message-ID: <20150404133612.GM14618@lukather>
References: <1427381625-6942-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LJm8egi4vkexsie5"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBNOT76UAKGQEATN4DAQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1427381625-6942-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--LJm8egi4vkexsie5
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Thu, Mar 26, 2015 at 03:53:40PM +0100, Hans de Goede wrote:
> Hi All,
> 
> Here is v2 of my cleaned up version of Maxime's sunxi SRAM controller driver.
> 
> Changes since v1:
> - Make the SUNXI_SRAM Kconfig option hidden, enabled by default if ARCH_SUNXI
> - Fix some typos in the comments in the dts file, both in the example in the
>   devicetree-binding documentation, as well as in the actual dts files
> - Drop the bogus change to drivers/net/ethernet/stmicro/stmmac/Kconfig
> 
> Since this is a prereq for my musb work, if there are no objections then I
> would like to see this go upstream soon.
> 
> Since it only touches sunxi files (and one Makefile), it is probably best if
> this all goes upstream through Maxime.

Merged patches 1-4. Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--LJm8egi4vkexsie5--
