From: public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org
Subject: Re: [linux-sunxi] [RFC] ARM: dts: sunxi: Add regulators and board-specific operating points for LeMaker BananaPi
Date: Mon, 27 Jul 2015 14:09:18 +0200 (CEST)
Message-ID: <20150727120918.191F76C82FB4@dd34104.kasserver.com>
References: <1437960486-2809-1-git-send-email-public_timo.s@silentcreek.de><55B5E6DB.8020009@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55B5E6DB.8020009-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: wens-jdAy2FN1RRM@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Hans de Goede schrieb am 27.07.2015 10:07:

> I've a simular patch here:
> 
> https://github.com/jwrdegoede/linux-sunxi/commit/6a30b7d5be6012b81e5e1439a444e41c0ac1afc1
> 
> I did not submit this upstream yet as it is part of a series to enable the otg
> controller on the bananapi which needs axp-usb-power-supply support for which
> the actual powersupply driver changes are still pending.
Oops, I see. Are you planning to submit this for 4.3 or later?

> As you can see other then you adding the cpu operating points are patches are
> identical, which is good :)
Yep, that and you chose a slightly higher maximum voltage for the CPU.

> IMHO we should just stick with the standard operating points unless we know
> that there are stability issues with them (such as e.g. on the A10 OlinuxIno
> Lime).
I'd be fine with that as I don't have any stability issues with the lower
voltages. What about the 1008MHz operating point that I "reintroduced"? It was
dropped here [1] because there was no regulator support. Can this be reenabled
on board level (which means overriding the defaults inherited from
sun7i-a20.dtsi) or should this be done at SOC level for all boards (which
means we have to add regulator nodes for all boards in the first place)?


Regards,

Timo


[1] https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=370a9b5fb04a0d5cc7b7699c788616d6976f4476
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
