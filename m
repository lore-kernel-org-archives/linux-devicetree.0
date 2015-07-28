From: "Timo Sigurdsson" <public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org>
Subject: Re: [RFC] ARM: dts: sunxi: Add regulators and
 board-specific operating points for LeMaker BananaPi
Date: Tue, 28 Jul 2015 17:09:29 +0200 (CEST)
Message-ID: <20150728150929.233B56C80391@dd34104.kasserver.com>
References: <1437960486-2809-1-git-send-email-public_timo.s@silentcreek.de> <55B5E6DB.8020009@redhat.com> <20150727120918.191F76C82FB4@dd34104.kasserver.com> <55B62768.6040403@redhat.com> <20150728124911.GA2564@lukather><55B790BA.5000509@redhat.com>
Reply-To: public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCSJLSE35MGBBKVW32WQKGQE26CLNKQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <55B790BA.5000509-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Hans de Goede schrieb am 28.07.2015 16:24:
> I've no problem with Timo submitting a cleaned up version of his
> patch and you taking that instead. I just wanted to point out that
> I do have a similar patch pending.

Ok, I will do that. It might take a couple of days, though, as I will be moving
moving in the next few days as well.

However, another question first then: What maximum voltage for the dcdc2
regulator should we use then? You used 1.5V, I used 1.45V so far, which is what
Cubieboard 2 and Cubietruck use.

But after the discussion about overvoltaged settings, I'm wondering whether we
should limit the regulartor (and not only the opp) to 1.40V as well? Or is
1.45V ok for everybody here?


Thanks and regards,

Timo
