From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re: [PATCH] ARM: dts: sun7i: Add dts file for
 Bananapi M1 Plus board
Date: Tue, 31 May 2016 19:09:57 +0200
Message-ID: <20160531170957.GM4908@lukather>
References: <20160530123013.11575-1-luoyi.ly@gmail.com>
 <20160530194340.GE4908@lukather>
 <574CA1ED.8050007@web.de>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pleSNuEbvnUYtMxG"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBZ4KW65AKGQEOT5QHQI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <574CA1ED.8050007-S0/GAf8tV78@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Bernhard Nortmann <bernhard.nortmann-S0/GAf8tV78@public.gmane.org>
Cc: luoyi.ly-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--pleSNuEbvnUYtMxG
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Mon, May 30, 2016 at 10:26:21PM +0200, Bernhard Nortmann wrote:
> Am 30.05.2016 um 21:43 schrieb Maxime Ripard:
> >Hi,
> >
> >On Mon, May 30, 2016 at 08:30:13PM +0800, luoyi.ly-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> >>From: luoyi <luoyi.ly-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >>
> >>Add support for the Bananapi M1 Plus A20 development board from sinovoip.com.cn .
> >>This board features 1G RAM, 2 USB A receptacles, 1 micro USB receptacle for
> >>OTG, 1 micro USB receptacle for power, HDMI, sata, Gbit ethernet, ir receiver,
> >>3.5 mm jack for stero sound out, on board microphone, 40 gpio pins and sdio wifi.
> >What is the difference between the M1+ and the M1?
> 
> The M1+ is an updated version of the original Banana Pi. If you're
> interested in the details, have a look at
> http://linux-sunxi.org/Banana_Pi#Variants .  "BPi-M1+" is SinoVoip's
> counterpart of LeMaker's "Banana Pro", for which a .dts already
> exists. Judging from .fex files, only a single pin assignment seems
> to differ between the two (audio_pa_ctrl, PH26 vs. PH15).

Gee, that's confusing :)

I guess we should just include the banana pro DTB and change that pin
(and the i2s pins Luo was mentionning).

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--pleSNuEbvnUYtMxG--
