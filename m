From: "Timo Sigurdsson" <public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org>
Subject: Re: [RFC] ARM: dts: sunxi: Add regulators and
 board-specific operating points for LeMaker BananaPi
Date: Tue, 28 Jul 2015 11:02:16 +0200 (CEST)
Message-ID: <20150728090216.892076C80D94@dd34104.kasserver.com>
References: <1437960486-2809-1-git-send-email-public_timo.s@silentcreek.de> <55B5E6DB.8020009@redhat.com> <20150727123653.36C046C8007E@dd34104.kasserver.com> <55B62A1B.6030601@redhat.com><CAGb2v65ApKvrj6K+kw43u=0q6=auTsmQjCXhibgZkW+vd5nDqA@mail.gmail.com>
Reply-To: public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCSJLSE35MGBBGMK3WWQKGQEEY4CXDA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAGb2v65ApKvrj6K+kw43u=0q6=auTsmQjCXhibgZkW+vd5nDqA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Chen-Yu Tsai schrieb am 27.07.2015 15:14:
>> ChenYu (in the CC), since you did most of the original work here, do
>> you know why we have an op at 0.9 volt, but none of our boards allow the
>> voltage to go that low in the regulator settings ?
> 
> I'm on vacation now, so apologies for the bad formatting.
> 
> The OPPs are from a common subset
> of the settings from the fex files available
> at the time. Some fex files actually set
> min and max voltage thus eliminating
> the highest and lowest OPPs.
> 
> At least that is how Maxime and I
> interpreted them.

IMHO for a common maximum opp that's a good approach. But for the lowest
frequency setting, it would seem more logical to me, to raise the voltage
to a point where all boards will run fine with them, unless those boards 
cannot handle the frequency regardless of the higher voltage.

Regards,

Timo
