From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sunxi: Raise minimum CPU voltage
 for sun7i-a20 to a level all boards can supply
Date: Mon, 3 Aug 2015 11:13:00 +0200
Message-ID: <20150803091300.GY2564@lukather>
References: <1438543386-7253-1-git-send-email-public_timo.s@silentcreek.de>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a8bF44fkpOgjbCVv"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBHXB7SWQKGQETV75Y6A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1438543386-7253-1-git-send-email-public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Timo Sigurdsson <public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
List-Id: devicetree@vger.kernel.org

--a8bF44fkpOgjbCVv
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Sun, Aug 02, 2015 at 09:23:06PM +0200, Timo Sigurdsson wrote:
> sun7i-a20.dtsi contains an cpufreq operating point at 0.9 volts. Most A20 boards
> (or all?), however, do not allow the voltage to go below 1.0V. Thus, raise the
> voltage for the lowest operating point to 1.0V so all boards can actually use
> it.

This is not a property of a board, but is the actual limit documented
by Allwinner for the A20. Some individual SoCs might have wider
tolerances, but that's not a property of a board, it's really a
property of a single SoC, and we cannot make any assumption on the
board.

(and please make sure to run checkpatch before sending your patches)

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--a8bF44fkpOgjbCVv--
