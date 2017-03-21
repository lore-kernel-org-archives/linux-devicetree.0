From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: sun8i: a33: remove highest OPP to fix
 CPU crashes
Date: Tue, 21 Mar 2017 16:56:32 +0100
Message-ID: <20170321155632.k7vtmkorucsspnun@lukather>
References: <20170320112551.25825-1-quentin.schulz@free-electrons.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eurcn6bmi2eoq46j"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBMM2YXDAKGQEGD6WV3I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170320112551.25825-1-quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO13Tl8gKCW/8w@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, icenowy-ymACFijhrKM@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org


--eurcn6bmi2eoq46j
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Mon, Mar 20, 2017 at 12:25:51PM +0100, Quentin Schulz wrote:
> The highest supported frequency (1.2GHz) requires to "overvolt" the CPU.
> However, some boards still do not have the cpu-supply DT property in the
> cpu DT node which means that the CPU will always run with the same input
> voltage but try to run at 1.2GHz frequency. This is the source of
> (experienced) CPU crashes.
> 
> Remove the OPP which requires overvolting the CPU until all boards have
> a cpu-supply property.
> 
> Fixes: 03749eb88e635ad67818827adde8e5eea7b64571 ("ARM: dts: sun8i: add
> opp-v2 table for A33")

The commit ID must be 12 chars, as documented in
Documentation/process/submitting-patches.rst.

You can also use the pretty format given there to be sure to have it
right.

> 
> Signed-off-by: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Applied, thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--eurcn6bmi2eoq46j--
