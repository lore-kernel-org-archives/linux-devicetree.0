From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/2] ARM: dts: sun7i: Add uart4 support
 for BananaPro, disable uart2
Date: Fri, 22 May 2015 21:24:40 +0200
Message-ID: <20150522192440.GH8557@lukather>
References: <1432305184-8589-1-git-send-email-hdegoede@redhat.com>
 <1432305184-8589-2-git-send-email-hdegoede@redhat.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kr14OxHsRwZHHqxS"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBEEF72VAKGQE54XUZ4A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1432305184-8589-2-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Michael Ring <mail-u1jPNj63thkWnkcawLe0jA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--kr14OxHsRwZHHqxS
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Fri, May 22, 2015 at 04:33:04PM +0200, Hans de Goede wrote:
> From: Michael Ring <mail-u1jPNj63thkWnkcawLe0jA@public.gmane.org>
> 
> The BananaPro uses uart4 for the default rx/tx pins on the 40 pins connector,
> so enable uart4.
> 
> Uart2 is also available at the bananapro io-pins, but like on the bananapi
> the primary function of the pins is to act as gpios, see:
> http://forum.lemaker.org/forum.php?mod=viewthread&tid=10852
> 
> Remove the uart2 node, people who want to use uart2 can do so with a
> devicetree-overlay.
> 
> Signed-off-by: Michael Ring <mail-u1jPNj63thkWnkcawLe0jA@public.gmane.org>
> [hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org: Remove uart2 node]
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Applied both, thanks!

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--kr14OxHsRwZHHqxS--
