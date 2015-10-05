From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: sun4i: Add AXP209 PMU
 regulators for pcDuino1/2
Date: Mon, 5 Oct 2015 14:56:30 +0200
Message-ID: <20151005125630.GN2696@lukather>
References: <1443985128-23137-1-git-send-email-siarhei.siamashka@gmail.com>
 <1443985128-23137-4-git-send-email-siarhei.siamashka@gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="00sTfE/IIAT5d2r5"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBMPHZGYAKGQEDF2SETY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1443985128-23137-4-git-send-email-siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Siarhei Siamashka <siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Zoltan HERPAI <wigyori-1V5s5g7wVVk@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--00sTfE/IIAT5d2r5
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Sun, Oct 04, 2015 at 09:58:48PM +0300, Siarhei Siamashka wrote:
> This allows voltage-scaling with cpufreq-dt. The reliability of
> voltage-scaling has been checked by reducing the voltage of all
> operating points by 0.025V (for extra safety headroom) and running
> libjpeg-turbo decoding tests on 5 pcDuino2 boards. It means that
> the standard sun4i voltages should be perfectly fine too.
> 
> Signed-off-by: Siarhei Siamashka <siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Applied, thanks!

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--00sTfE/IIAT5d2r5--
