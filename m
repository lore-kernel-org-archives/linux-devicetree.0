From: "Timo Sigurdsson" <public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sunxi: Raise minimum CPU voltage
 for sun7i-a20 to a level all boards can supply
Date: Tue,  4 Aug 2015 10:51:30 +0200 (CEST)
Message-ID: <20150804085130.602FA6C83EF9@dd34104.kasserver.com>
References: <1438543386-7253-1-git-send-email-public_timo.s@silentcreek.de> <CAGRGNgV6b9yt2HnB2x2Wyc05KEahoX-Y+mVhxsryztcfA36H1g@mail.gmail.com> <CAGb2v67o-=_cL2RWfXJ+3C86zfQ_1b5DYRi3_zwvwy6su6+gdw@mail.gmail.com> <CAGRGNgXH90m9h0DDejd5MTf8enduGFQ8dPKrRhmc8Z6y_PaC1w@mail.gmail.com> <20150803090352.621CC6C80865@dd34104.kasserver.com><20150803093420.GC2564@lukather>
Reply-To: public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCSJLSE35MGBBE72QGXAKGQEYO7TP6I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20150803093420.GC2564@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: wens-jdAy2FN1RRM@public.gmane.org, julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, monnier-CRDzTM1onBSWkKpYnGOUKg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Maxime,

Maxime Ripard schrieb am 03.08.2015 11:34:

> On Mon, Aug 03, 2015 at 11:03:52AM +0200, Timo Sigurdsson wrote:
>> Julian Calaby schrieb am 03.08.2015 06:22:
>> > My only real objection here is are there boards that can go down to
>> > 0.9v and if so, won't this change make them less power efficient in
>> > the almost-idle case? And are those power savings enough to justify
>> > not accepting this patch?
>> 
>> It will probably make those boards less power efficient, yes. On the
>> other hand, boards that have their CPU regulator set to min. 1.0V might
>> also draw more power because the lowest frequency is not available, 
>> even though the savings due to frequency are likely to be lower than
>> the savings due to voltage.
> 
> Guys, isn't this whole discussion a bit moot? We're not doing any kind
> of power management but cpufreq, so maybe there's a lot more to do
> before we actually can have these kind of arguments?
> 
> Plus this OPP has never been used anyway, so this patch is not going
> to increase the power consumption either.

You are right. When I wrote that, I was under the impression that the
Olinuxino Lime 2 board at least used this setting since it has has a cpu
regulator defined to go as low as 0.7V. But now I checked again and see
the regulator is not referenced in the cpu node, so I guess cpufreq
doesn't use it. So, this discussion was really hypothetical and more
importantly, as you mentioned, it's an out-of-spec opp that shouldn't
be supported anyway.

Thanks,

Timo
