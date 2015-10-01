From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5] ARM: sun7i: dt: Add new Olimex A20 EVB device
Date: Thu, 1 Oct 2015 15:09:32 +0200
Message-ID: <20151001130932.GJ7104@lukather>
References: <1443634479-18111-1-git-send-email-codekipper@gmail.com>
 <20151001120630.GH7104@lukather>
 <CAEKpxB=ytV17o5uO6srDbJSrvNe66EeRERF-Ow=HuzE4=z1qag@mail.gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CeC2K4acttR/mmFn"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBKXBWSYAKGQETPSINJQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAEKpxB=ytV17o5uO6srDbJSrvNe66EeRERF-Ow=HuzE4=z1qag-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--CeC2K4acttR/mmFn
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Thu, Oct 01, 2015 at 02:54:07PM +0200, Code Kipper wrote:
> >> +&reg_dcdc2 {
> >> +     regulator-always-on;
> >> +     regulator-min-microvolt = <1000000>;
> >> +     regulator-max-microvolt = <1425000>;
> >
> > You also changed that since v4, for an unknown reason, and without
> > mentionning it in the changelog...
>
> AAARRRGGGGHHHHHHHHHHH....could you kindly fix this for me?....pllllleeeasseee.

If that's the only change you made, sure...

But you should pay more attention and / or polish your git
workflow. Having part of codes from several versions ago poping back
is definitely not good.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--CeC2K4acttR/mmFn--
