From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [linux-sunxi] [RFC] ARM: dts: sunxi: Add regulators and
 board-specific operating points for LeMaker BananaPi
Date: Mon, 27 Jul 2015 14:54:51 +0200
Message-ID: <55B62A1B.6030601@redhat.com>
References: <1437960486-2809-1-git-send-email-public_timo.s@silentcreek.de><55B5E6DB.8020009@redhat.com>
 <20150727123653.36C046C8007E@dd34104.kasserver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150727123653.36C046C8007E-RzmsueL7+k6AvxNu/8lEInnhMCiq3JZZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: wens-jdAy2FN1RRM@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 27-07-15 14:36, public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org wrote:
> Hi again,
>
> one more thing...
>
> Hans de Goede schrieb am 27.07.2015 10:07:
>> IMHO we should just stick with the standard operating points unless we know
>> that there are stability issues with them (such as e.g. on the A10 OlinuxIno
>> Lime).
>
> If we stick to the standard operating points, shouldn't we honor their voltages
> as well? If we set the minimum voltage for dcdc2 to 1.0V (as you did) or 1.05V
> (as I did), this means that the lowest operating point of 144MHz@0.9V defined
> in sun7i-a20.dtsi (and with my definition the 312MHz opp as well) will not be
> available because cpufreq-dt simply ignores operating points that aren't within
> the set voltage range for that regulator.

Ah, good point. I don't know what is the right thing todo here.

ChenYu (in the CC), since you did most of the original work here, do
you know why we have an op at 0.9 volt, but none of our boards allow the
voltage to go that low in the regulator settings ?

Regards,

Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
