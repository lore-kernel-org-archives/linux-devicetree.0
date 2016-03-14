From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/5] ARM: dts: sunxi: Add the SPDIF to the
 A10 and A20
Date: Mon, 14 Mar 2016 19:52:43 +0100
Message-ID: <20160314185243.GE30977@lukather>
References: <1456589909-2428-1-git-send-email-codekipper@gmail.com>
 <1456589909-2428-4-git-send-email-codekipper@gmail.com>
 <20160313215043.GJ8418@lukather>
 <CAEKpxBm4bs7sNSbDjomdP6XS2ApvfDT-s942DBb3JWv1iOZJ0w@mail.gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Yb+qhiCg54lqZFXW"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB7EQTS3QKGQEJZIFFAI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAEKpxBm4bs7sNSbDjomdP6XS2ApvfDT-s942DBb3JWv1iOZJ0w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Andrea Venturi <ennesimamail.av-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--Yb+qhiCg54lqZFXW
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Mon, Mar 14, 2016 at 05:29:37PM +0100, Code Kipper wrote:
> >> +             spdif: spdif@01c21000 {
> >> +                     #sound-dai-cells = <0>;
> >> +                     compatible = "allwinner,sun4i-a10-spdif";
> >> +                     reg = <0x01c21000 0x40>;
> >
> > It only takes 64 bytes?
>
> Yep(just like the audio codec!)
> http://linux-sunxi.org/SPDIF#SUNXI_SPDIF_DEFAULT_VALUES

Yet the datasheet says it takes 1k in the memory map.

Please use that value instead.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--Yb+qhiCg54lqZFXW--
