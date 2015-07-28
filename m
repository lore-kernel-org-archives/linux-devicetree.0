From: "Timo Sigurdsson" <public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org>
Subject: Re: [RFC] ARM: dts: sunxi: Add regulators and
 board-specific operating points for LeMaker BananaPi
Date: Tue, 28 Jul 2015 11:02:09 +0200 (CEST)
Message-ID: <20150728090209.1D7BC6C80542@dd34104.kasserver.com>
References: <1437960486-2809-1-git-send-email-public_timo.s@silentcreek.de><55B5E6DB.8020009@redhat.com> <20150727120918.191F76C82FB4@dd34104.kasserver.com><55B62768.6040403@redhat.com>
Reply-To: public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCSJLSE35MGBBEUK3WWQKGQELI7G4GA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <55B62768.6040403-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: wens-jdAy2FN1RRM@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Hans de Goede schrieb am 27.07.2015 14:43:
>>> I've a simular patch here:
>>>
>>> https://github.com/jwrdegoede/linux-sunxi/commit/6a30b7d5be6012b81e5e1439a444e41c0ac1afc1
>>>
>>> I did not submit this upstream yet as it is part of a series to enable the
>>> otg
>>> controller on the bananapi which needs axp-usb-power-supply support for which
>>> the actual powersupply driver changes are still pending.
>> Oops, I see. Are you planning to submit this for 4.3 or later?
> 
> I plan to submit this for 4.3.
Ok, then I guess we can drop my patch.

>>> IMHO we should just stick with the standard operating points unless we know
>>> that there are stability issues with them (such as e.g. on the A10 OlinuxIno
>>> Lime).
>> I'd be fine with that as I don't have any stability issues with the lower
>> voltages. What about the 1008MHz operating point that I "reintroduced"? It was
>> dropped here [1]  because there was no regulator support.
> 
> That is in essence an overclocked setting, the max CPU voltage officially is
> 1.4V, I do not think that we should provide any overclocked settings in the
> official dts files. If people really want to overclock they will have to
> modify there dts themselves IMHO.

Personally, I would be fine with that. Even though I think, it might be good to
have them in the official files just for convenience and because people who are 
used to the sunxi-3.4 kernels are used to having the 1008MHz opp (and it was in
mainline for a short while, too). For those who don't want to use that setting,
it's easier to limit the maximum in userspace compared to compiling a new
device tree blob. But I do understand your point, so I guess it's just
something that maintainers have to make a decision for. As I said, either way
is fine for me.

> > Can this be reenabled
>> on board level (which means overriding the defaults inherited from
>> sun7i-a20.dtsi) or should this be done at SOC level for all boards (which
>> means we have to add regulator nodes for all boards in the first place)?
> 
> Technically this is possible, but I do not think that it is a good idea.

I guess the same applies here, too. It's something maintainers should have a
common understanding on. I don't know how much variation there is among the
A20 boards in terms of frequencies and voltages. If there is a lot, I'd say
it would be desireable to have board-specific opp. The downside I see in my
approach is that it impacts readability of the dts(i) files when settings
are overridden further down the tree.

Thanks and regards,

Timo
