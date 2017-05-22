From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/6] clk: sunxi-ng: a83t: Fix audio PLL
 divider offset
Date: Mon, 22 May 2017 09:45:27 +0200
Message-ID: <20170522074527.4ru2oad4neyiblnp@flea.lan>
References: <20170522062552.19026-1-wens@csie.org>
 <20170522062552.19026-3-wens@csie.org>
 <20170522072047.bffdbwkz2nqvhums@flea.lan>
 <CAGb2v65SUR2NvGOFFgzUpDh_9Dm6SAhzwC31KBOqFZubOhkK9w@mail.gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ckazgmfm5xncmord"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBIVORLEQKGQESQ2MY3I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAGb2v65SUR2NvGOFFgzUpDh_9Dm6SAhzwC31KBOqFZubOhkK9w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--ckazgmfm5xncmord
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Mon, May 22, 2017 at 03:35:57PM +0800, Chen-Yu Tsai wrote:
> On Mon, May 22, 2017 at 3:20 PM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > On Mon, May 22, 2017 at 02:25:48PM +0800, Chen-Yu Tsai wrote:
> >> The divider of the audio PLL has an offset of 1.
> >> Fix this in the driver.
> >>
> >> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> >
> > Applied, thanks!
> 
> So even with this patch applied, the audio is still slow and off pitch.
> It's even worse without this patch...
> 
> Maybe it's time we added a special class of clks for the audio PLL
> to deal with sigma-delta modulation of the divider?

I'm not sure how feasible that would be and what it would look like,
but you can give it a shot yes.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--ckazgmfm5xncmord--
