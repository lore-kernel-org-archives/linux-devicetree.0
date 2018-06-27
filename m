From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun8i: a83t: Add CPU regulator
 supplies for A83T boards
Date: Wed, 27 Jun 2018 19:04:03 +0200
Message-ID: <20180627170403.y7ptuiyrhklh7foj@flea>
References: <20180627022709.27434-1-wens@csie.org>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fa3qwpgleac57r7o"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBE4HZ7MQKGQEBXJDDQA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180627022709.27434-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--fa3qwpgleac57r7o
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Wed, Jun 27, 2018 at 10:27:09AM +0800, Chen-Yu Tsai wrote:
> The OPPs for the A83T CPU cores were added in v4.17 in commit 2db639d8c166
> ("ARM: dts: sun8i: a83t: add stable OPP tables and CPUfreq"), but board
> level regulator supplies for the CPU clusters were only added for the
> TBS-A711 tablet. This means the other A83T boards do not benefit from
> voltage scaling, or worse, if the implementation does not scale the
> frequency when the voltage is fixed, no benefit at all.
> 
> Add board level CPU cluster power supplies to all the A83T development
> boards, so they can have proper dynamic CPU voltage and frequency scaling.
> 
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Applied, thanks!
Maxime

-- 
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--fa3qwpgleac57r7o--
