From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re: [RFC PATCH] ARM: dts: sun8i: add simplefb node
 for H3
Date: Tue, 29 Nov 2016 22:43:23 +0100
Message-ID: <20161129214323.rsi7xyghffrkwyjd@lukather>
References: <20161128095900.27615-1-icenowy@aosc.xyz>
 <CAGb2v67akcT6z-xOdCzpLQRZbgNGh3E5akYEs1BvFNP1rH8UeA@mail.gmail.com>
 <496171480328390@web15g.yandex.ru>
 <CAGb2v66yQ2d=12P_MYyQXTfcZnNAMcb+0i=NEab4sNcJZUyL-w@mail.gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xmmyt5t54pstfsmp"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBBXN67AQKGQEM3P6MCA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAGb2v66yQ2d=12P_MYyQXTfcZnNAMcb+0i=NEab4sNcJZUyL-w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--xmmyt5t54pstfsmp
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Mon, Nov 28, 2016 at 06:24:24PM +0800, Chen-Yu Tsai wrote:
> On Mon, Nov 28, 2016 at 6:19 PM, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org> wrote:
> >
> >
> > 28.11.2016, 18:07, "Chen-Yu Tsai" <wens-jdAy2FN1RRM@public.gmane.org>:
> >> On Mon, Nov 28, 2016 at 5:59 PM, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org> wrote:
> >>>  As there's currently a fork of U-Boot which provides simplefb support
> >>
> >> Please add it when its finalized...
> >>
> >>>  for H3, a simplefb node can be added to the device tree.
> >>>
> >>>  Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> >>>  ---
> >>>
> >>>  I'm still not sure which pipeline should I use.
> >>
> >> You are supposed to add _all_ the pipelines that are available and
> >> supported by U-boot. U-boot is then supposed to enable and update
> >> the one it set up.
> >
> > I mean the pipeline string ;-)
> 
> Looks good to me. There's no separate frontend/backend in DE 2.0.

It looks good to me too.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--xmmyt5t54pstfsmp--
