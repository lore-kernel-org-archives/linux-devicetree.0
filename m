From: "Timo Sigurdsson" <public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org>
Subject: Re: [RFC] ARM: dts: sunxi: Add regulators and
 board-specific operating points for LeMaker BananaPi
Date: Tue, 28 Jul 2015 16:57:52 +0200 (CEST)
Message-ID: <20150728145752.43F676C81B65@dd34104.kasserver.com>
References: <1437960486-2809-1-git-send-email-public_timo.s@silentcreek.de> <55B5E6DB.8020009@redhat.com> <20150727120918.191F76C82FB4@dd34104.kasserver.com> <55B62768.6040403@redhat.com> <20150728090209.1D7BC6C80542@dd34104.kasserver.com><20150728125500.GB2564@lukather>
Reply-To: public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCSJLSE35MGBB4NQ32WQKGQE44CEDCA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20150728125500.GB2564@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Maxime Ripard schrieb am 28.07.2015 14:55:
>> > I plan to submit this for 4.3.
>>
>> Ok, then I guess we can drop my patch.
> 
> Please don't.

Ok.

> It was used in mainline, and reverted because it was not stable
> enough.

Well, the explanation given was, it was not stable because of the missing
regulator support. I don't know whether anyboady actually ever reported
it wouldn't run fine at 1008MHz with 1.45V. So the actual point should be
whether we wan't voltages that are out of the specified range in the
official kernel. The consensus seems to be no, with good reasons for that.
So, I won't object this.

> There's a lot of things we do differently in mainline, it's one of
> them. If someone can provide an OPP for 1008MHz that is stable for all
> the boards and within the operating limits of the SoC, I'd be totally
> fine with that, but we didn't find it so far.
> 
>> For those who don't want to use that setting, it's easier to
>> limit the maximum in userspace compared to compiling a new device
>> tree blob.
> 
> Except that the kernel should not rely on the userspace to be stable
> and harmless for the hardware. It should just work reliably by itself.

Same as above.

Regards,

Timo
