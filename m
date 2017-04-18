From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: sun8i: a83t: Rename pinmux setting names
Date: Tue, 18 Apr 2017 11:04:47 +0200
Message-ID: <20170418090447.dcxinewczubf26b7@lukather>
References: <20170418042205.27894-1-wens@csie.org>
 <20170418042205.27894-4-wens@csie.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iw2gqtfcwqivwbeu"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBMFN27DQKGQE7QU3XHI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170418042205.27894-4-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--iw2gqtfcwqivwbeu
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Tue, Apr 18, 2017 at 12:22:05PM +0800, Chen-Yu Tsai wrote:
> The pinmux setting nodes all have an address element in their node
> names, however the pinctrl node does not have #address-cells.
> 
> Rename the existing pinmux setting nodes and labels in sun8i-a83t.dtsi,
> dropping identifiers for functions that only have one possible setting,
> and using the pingroup name if the function is identically available on
> different pingroups.
> 
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Applied, and I really like the new names.

Would you make the same patch for everyone?
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--iw2gqtfcwqivwbeu--
