From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re: [PATCH 4/5] ARM: dts: sun5i: Add dts file for
 the Empire Electronix D709 tablet
Date: Mon, 4 Jan 2016 11:11:21 +0100
Message-ID: <20160104101121.GC11722@lukather>
References: <1450611782-9494-1-git-send-email-hdegoede@redhat.com>
 <1450611782-9494-4-git-send-email-hdegoede@redhat.com>
 <CAGb2v65daCCOWf7EXDkNWnxv1idXHXesOp6Et_0h-o+9drdeMA@mail.gmail.com>
 <5677D87A.90805@redhat.com>
 <20151221161132.GA30359@lukather>
 <567854D5.7030601@redhat.com>
 <CAGb2v67+XpYwUFAVSGEGAfJ0bzubQ87Ebaf5W5Ze619mEE6uUA@mail.gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iFRdW5/EC4oqxDHL"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBTMKVG2AKGQE6XXH4VI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v67+XpYwUFAVSGEGAfJ0bzubQ87Ebaf5W5Ze619mEE6uUA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--iFRdW5/EC4oqxDHL
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Tue, Dec 22, 2015 at 12:29:24PM +0800, Chen-Yu Tsai wrote:
> >>> So this means enabled the sdio controller (should be safe on all
> >>> boards?)  and enabling 2 regulators to power the wifi-chip. I
> >>> think it will be safe to do this even on boards where those
> >>> regulators are not used, what do you think ?
> >>
> >> Wouldn't that introduce some useless power drain on those boards?
> >
> >
> > If nothing is attached to those regulators (which I expect to be
> > the case when they are not used to power wifi) then I would expect
> > the drain to be minimal, my biggest worry is some board having
> > tied these to ground, but I don't think that is very likely.
> 
> AFAIK the AXP datasheets mention that unused DCDC outputs should be left
> floating. Not sure if this applies to LDO outputs as well. But any used
> outputs would have a bypass capacitor.
> 
> From the board designs I've seen, this seems to be the common case.
> I'm not an electrical engineer, but I think we're covered here.

Ok, I guess we're good then.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--iFRdW5/EC4oqxDHL--
