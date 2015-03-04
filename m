From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: sun7i: dt: Add new MK808C device
Date: Wed, 4 Mar 2015 21:34:00 +0100
Message-ID: <20150304203400.GR4911@lukather>
References: <1425131004-8551-1-git-send-email-codekipper@gmail.com>
 <20150303071342.GB4713@lukather>
 <CAEKpxB=-vtjMckh3ZHoy0mezE9U1EtKzmttdXRD5ZNztZvB_ag@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CPn8Wy5ME997YUMW"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB56Y3WTQKGQET6FAIPA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAEKpxB=-vtjMckh3ZHoy0mezE9U1EtKzmttdXRD5ZNztZvB_ag-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--CPn8Wy5ME997YUMW
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Tue, Mar 03, 2015 at 09:22:32PM +0100, Code Kipper wrote:
> >> +
> >> +/ {
> >> +     model = "mk808c";
> >> +     compatible = "mk808c", "allwinner,sun7i-a20";
> >
> > the compatible must be of the format "vendor,device". Please add the
> > vendor name.
> 
> Ahhh....I've searched high and low for a vendors name. I listed it as
> unknown on the wiki page,
> would 'odm' be considered valid?

Not really. Another mk808c device might very well be made by some
other odm.

Don't your device has any brand on the case or the PCB?

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--CPn8Wy5ME997YUMW--
