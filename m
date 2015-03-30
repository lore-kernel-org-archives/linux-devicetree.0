From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 0/5] ARM: sunxi: SRAM mapping support
Date: Mon, 30 Mar 2015 16:26:53 -0700
Message-ID: <20150330232653.GC23664@lukather>
References: <1427381625-6942-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="up2r7mkFEYHJ3y+X"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB5VZ5KUAKGQES7S5MZI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1427381625-6942-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--up2r7mkFEYHJ3y+X
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

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

I'm (obviously) fine with all the changes. Arnd, can I merge it
through my tree and send a pull request, or do you want to handle the
drivers/soc patches yourself?

Thanks,
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--up2r7mkFEYHJ3y+X--
