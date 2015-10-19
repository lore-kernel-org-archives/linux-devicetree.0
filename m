From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun7i: Enable USB DRC on pcDuino
 v3 Nano
Date: Mon, 19 Oct 2015 20:05:13 +0200
Message-ID: <20151019180513.GW2711@lukather>
References: <1445119709-1689-1-git-send-email-ats@offog.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Er97KPJOrxRt+yKZ"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBZPBSSYQKGQE6GPV3KY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1445119709-1689-1-git-send-email-ats-G+91BasbrijYtjvyW6yDsg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Adam Sampson <ats-G+91BasbrijYtjvyW6yDsg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--Er97KPJOrxRt+yKZ
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Sat, Oct 17, 2015 at 11:08:29PM +0100, Adam Sampson wrote:
> The OTG arrangement on the LinkSprite pcDuino v3 Nano is the same as the
> pcDuino 1/2/3: the OTG port's 5V line is connected directly to the 5V
> bus (it's not switchable), and the OTG port's ID pin is connected to PH4
> on the A20.
> 
> Tested successfully in both host and device modes.
> 
> Signed-off-by: Adam Sampson <ats-G+91BasbrijYtjvyW6yDsg@public.gmane.org>

Applied, thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--Er97KPJOrxRt+yKZ--
