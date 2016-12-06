From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] dts: sun8i-h3: correct UART3 pin definitions
Date: Tue, 6 Dec 2016 15:05:38 +0100
Message-ID: <20161206140538.ag7nofyca2n5ror2@lukather>
References: <20161204122948.11921-1-jorik@kippendief.biz>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ysyxpa6aemby74wd"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBQULTPBAKGQEU52GJYQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20161204122948.11921-1-jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org
Cc: wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ysyxpa6aemby74wd
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi Jorik,

On Sun, Dec 04, 2016 at 01:29:48PM +0100, jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org wrote:
> From: Jorik Jonker <jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org>
> 
> In a previous commit, I made a copy/paste error in the pinmux
> definitions of UART3: PG{13,14} instead of PA{13,14}. This commit takes
> care of that. I have tested this commit on Orange Pi PC and Orange Pi
> Plus, and it works for these boards.
> 
> Fixes: e3d11d3c45c5 ("dts: sun8i-h3: add pinmux definitions for
> UART2-3")
> 
> Signed-off-by: Jorik Jonker <jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org>

Thanks!

This looks like a late fix for the current release which comes to an
end. Can you resend it with arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org as a recipient, so that the
ARM SoC maintainers can apply it directly?

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--ysyxpa6aemby74wd--
