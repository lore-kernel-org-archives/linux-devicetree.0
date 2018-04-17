From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun8i: h3: Re-enable EMAC on
 Orange Pi One
Date: Tue, 17 Apr 2018 11:18:16 +0200
Message-ID: <20180417091816.xcda7q6gugyqj3ie@flea>
References: <20180417041714.27266-1-wens@csie.org>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ye2tn56dbxqzy7er"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBZHX23LAKGQEOAM4XSY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180417041714.27266-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ye2tn56dbxqzy7er
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Tue, Apr 17, 2018 at 12:17:14PM +0800, Chen-Yu Tsai wrote:
> In commit f0842bc5637c ("ARM: dts: sun8i: h3: Enable HDMI output on H3
> boards"), the hunk that enabled HDMI for the Orange Pi One did not add a
> 
>     status = "okay";
> 
> line for the HDMI node, inadvertenly using the one for the EMAC. This
> resulted in the EMAC now being disabled. Whether this was due to a
> rebase error or some other mishap is unknown.
> 
> This patch re-enables the EMAC by adding the status line to its node.
> 
> Fixes: f0842bc5637c ("ARM: dts: sun8i: h3: Enable HDMI output on H3 boards")
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Applied, thanks!
Maxime

-- 
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--ye2tn56dbxqzy7er--
