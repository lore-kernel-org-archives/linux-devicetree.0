From: "Timo Sigurdsson" <public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org>
Subject: Re: [RFC] ARM: dts: sunxi: Add regulators and
 board-specific operating points for LeMaker BananaPi
Date: Mon,  3 Aug 2015 00:00:06 +0200 (CEST)
Message-ID: <20150802220006.E5BE06C810BC@dd34104.kasserver.com>
References: <1437960486-2809-1-git-send-email-public_timo.s@silentcreek.de> <55B5E6DB.8020009@redhat.com> <20150727120918.191F76C82FB4@dd34104.kasserver.com> <55B62768.6040403@redhat.com> <20150728124911.GA2564@lukather><55B790BA.5000509@redhat.com> <20150728150929.233B56C80391@dd34104.kasserver.com><55B79FCA.7070907@redhat.com>
Reply-To: public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCSJLSE35MGBB2FF7KWQKGQE4ESWQGI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <55B79FCA.7070907-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: monnier-CRDzTM1onBSWkKpYnGOUKg@public.gmane.org
Cc: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Stefan,

you didn't include me in your answer, hence the late reply...

Stefan Monnier schrieb am 29.07.2015 02:02:
>> IMHO for a common maximum opp that's a good approach. But for the lowest
>> frequency setting, it would seem more logical to me, to raise the voltage
>> to a point where all boards will run fine with them, unless those boards
>> cannot handle the frequency regardless of the higher voltage.

> I generally agre, tho IIRC some measurements seem to indicate that the
> lowest frequency settings did not bring much (if any) reduction in power
> consumption, making them rather useless.

That's an interesting point. However, that would be a different discussion. I
wouldn't mind if the 144MHz would be removed - my point was just that if it's 
supposed to be a common setting, it should work on all boards. I posted a patch
today to fix this. [1] That might be a good place to discuss whether this
setting should be removed entirely.

Regards,

Timo

[1] https://groups.google.com/forum/#!topic/linux-sunxi/fIfbdn7mrQA
