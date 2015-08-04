From: "Timo Sigurdsson" <public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: sunxi: Add regulators for
 LeMaker BananaPi
Date: Tue,  4 Aug 2015 11:02:24 +0200 (CEST)
Message-ID: <20150804090224.4B5676C83963@dd34104.kasserver.com>
References: <1438532305-5884-1-git-send-email-public_timo.s@silentcreek.de><20150803094723.GD2564@lukather>
Reply-To: public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCSJLSE35MGBBIP7QGXAKGQEZQSKQDQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20150803094723.GD2564@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Maxime,

Maxime Ripard schrieb am 03.08.2015 11:47:
> What regulator provides the 3.3V regulator used in the rest of this DT
> then (MMC, GMAC) ?

For GMAC, there is a reg_gmac_3v3 defined in sun7i-a20-bananapi.dts [1].
MMC uses reg_vcc3v3 included from sunxi-common-regulators.dtsi. Am I
missing something? Is this not sufficient?


Thanks,

Timo

[1] https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/sun7i-a20-bananapi.dts?id=v4.2-rc5#n78
