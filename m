From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: ARM: dts: sun8i: h3: Enable dwmac-sun8i on the
 Beelink X2
Date: Wed, 4 Jul 2018 09:44:08 +0200
Message-ID: <20180704074408.sx4ek6lvbaiyj5ut@flea>
References: <20180630062720.24225-1-codekipper@gmail.com>
 <20180703145020.hkct43ccbpteleht@flea>
 <CAEKpxBmCLF8PMQ2h2qghfMEMktQYdDZEPaFRLvN8-uzDr0mi9g@mail.gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="npzyb65xtj6uxonq"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBW7V6HMQKGQEWTVCKRQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAEKpxBmCLF8PMQ2h2qghfMEMktQYdDZEPaFRLvN8-uzDr0mi9g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--npzyb65xtj6uxonq
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Tue, Jul 03, 2018 at 07:19:16PM +0200, Code Kipper wrote:
> On 3 July 2018 at 16:50, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> > Hi,
> >
> > On Sat, Jun 30, 2018 at 08:27:20AM +0200, codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> >> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >>
> >> The enabling of the emac was reverted when stability issues were
> >> discovered.
> >
> > What stability issues exactly? Have they been fixed? If so, by which
> > commit?
> 
> They were fixed by 4904337fe34f (ARM: dts: sunxi: Restore EMAC changes
> (boards)) but this board was missed.

Please add that to the commit log, and what the issue was.

Maxime

-- 
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--npzyb65xtj6uxonq--
