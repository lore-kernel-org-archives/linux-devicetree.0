From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun7i: Add regulator
 configuration for pcDuino v3 Nano
Date: Tue, 13 Oct 2015 20:44:22 +0200
Message-ID: <20151013184422.GP2278@lukather>
References: <1444508121-20233-1-git-send-email-ats@offog.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Tdr039sUWCyRuLRO"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBCFC6WYAKGQEDASTLTY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1444508121-20233-1-git-send-email-ats-G+91BasbrijYtjvyW6yDsg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Adam Sampson <ats-G+91BasbrijYtjvyW6yDsg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--Tdr039sUWCyRuLRO
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Sat, Oct 10, 2015 at 09:15:21PM +0100, Adam Sampson wrote:
> The power configuration on this board is the same as the pcDuino v3.
> This will enable frequency/voltage scaling over the standard A20
> operating points from 144 MHz to 960 MHz.
> 
> Tested using cpufreq-ljt-stress-test on two pcDuino v3 Nano boards; also
> tested successfully with voltages reduced by 0.025 V.
> 
> Signed-off-by: Adam Sampson <ats-G+91BasbrijYtjvyW6yDsg@public.gmane.org>

Applied, thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--Tdr039sUWCyRuLRO--
