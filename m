From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/2] ARM: dts: sun4i: mk802 variant patches
Date: Wed, 9 Dec 2015 10:20:32 +0100
Message-ID: <20151209092032.GX27957@lukather>
References: <1449600534-5098-1-git-send-email-codekipper@gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y48FV0AvvvAm5Iyr"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBGXFT6ZQKGQEJ7LS24Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1449600534-5098-1-git-send-email-codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--Y48FV0AvvvAm5Iyr
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Tue, Dec 08, 2015 at 07:48:52PM +0100, codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> This patch series splits the mk802 dts into common include file which
> can be shared with the mk802+ device. The only difference that I can
> see between this and the original device is that it has an internal
> microphone.

Internal microphone that is not represented in the DT :)

> With that in mind we can either leave things as they are and enable
> the capture to the original mk802 dts or apply this patch to distinguish
> between the two devices.

Since there's exactly no difference between the two DTs, is there a
point at merging these patches?

Thanks,
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--Y48FV0AvvvAm5Iyr--
