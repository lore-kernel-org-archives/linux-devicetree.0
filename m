From: "Timo Sigurdsson" <public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sunxi: Raise minimum CPU voltage
 for sun7i-a20 to a level all boards can supply
Date: Mon,  3 Aug 2015 10:37:51 +0200 (CEST)
Message-ID: <20150803083751.1BCF56C80391@dd34104.kasserver.com>
References: <1438543386-7253-1-git-send-email-public_timo.s@silentcreek.de><CAGRGNgV6b9yt2HnB2x2Wyc05KEahoX-Y+mVhxsryztcfA36H1g@mail.gmail.com>
Reply-To: public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCSJLSE35MGBBYGQ7SWQKGQEATIFLVI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAGRGNgV6b9yt2HnB2x2Wyc05KEahoX-Y+mVhxsryztcfA36H1g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Julian,

Julian Calaby schrieb am 03.08.2015 01:35:
>> sun7i-a20.dtsi contains an cpufreq operating point at 0.9 volts. Most A20
>> boards
>> (or all?), however, do not allow the voltage to go below 1.0V. Thus, raise the
>> voltage for the lowest operating point to 1.0V so all boards can actually use
>> it.
> 
> Surely it wouldn't be added here if some could supply 0.9v.

Maybe. I just know some boards don't (e.g. Cubieboard 2, Cubietruck, BananaPi)
and don't know of any that does. But that's not my point. I think that a common
minimum operating point, defined on the SOC level, should be defined in a way
that works on all boards.

> 
> Is the code that uses this smart enough to sensibly switch between two
> operating points with the same frequency and different voltages? If
> so, maybe just add a 144MHz @ 1.0v operating point?

I never tried and I probably won't have time to test that before the weekend.
The current behaviour is this, though: On boards that set their minimum CPU
voltage to 1.0V, the lowest operating point will simply not be available to
the user.

> (Alternatively, would it make sense to modify the code that uses this
> to use frequencies with voltages specified that are lower than can be
> supplied with the lowest voltage it can?)

Considering OPPv2 is in the works, maybe not?


Thanks,

Timo
