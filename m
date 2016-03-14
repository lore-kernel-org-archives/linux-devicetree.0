From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: sun8i: Fix wrong Quad core /
 a33 compat for sun8i-a23-gt90h-v4
Date: Mon, 14 Mar 2016 19:51:34 +0100
Message-ID: <20160314185134.GD30977@lukather>
References: <1457973145-26203-1-git-send-email-hdegoede@redhat.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JwB53PgKC5A7+0Ej"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBOEQTS3QKGQET25JPGY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1457973145-26203-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--JwB53PgKC5A7+0Ej
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Mon, Mar 14, 2016 at 05:32:23PM +0100, Hans de Goede wrote:
> As the dts file name already implies sun8i-a23-gt90h-v4.dts is for
> an a23 equipped tablet. I don't know how the "Quad Core" or a33
> comaptible got in there, likely a copy and paste error.
> 
> Regardless this commit fixes this, note this is almost
> purely a cosmetical fix, for all things that matter at the
> machine compatible level the a23 and a33 are compatible.
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Applied all three, thanks

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--JwB53PgKC5A7+0Ej--
