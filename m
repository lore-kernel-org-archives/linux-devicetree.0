From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 0/8] ARM: sun8i: a83t: Enable
 AXP813/AXP818 regulators
Date: Thu, 2 Nov 2017 09:10:45 +0100
Message-ID: <20171102081045.dnoj2suj2mlo2lyp@flea.lan>
References: <20171018083138.14517-1-wens@csie.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fheubmp2yzfje5wk"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBENG5PHQKGQEVFUTF6I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20171018083138.14517-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--fheubmp2yzfje5wk
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Wed, Oct 18, 2017 at 04:31:30PM +0800, Chen-Yu Tsai wrote:
> Hi everyone,
> 
> This series was originally name "regulator: axp20x: Add support for
> AXP813/818 regulators". It adds support for the X-Powers AXP813/818 [1]
> PMICs' regulators. The series is quite straightforward.
> 
> Changes since v1:
> 
>   - Regulator driver patches were merged and now dropped from the series
> 
>   - Chose simpler names for the regulators
> 
>   - Added SDIO WiFi enablement patches
> 
> Patch 1 adds a axp20x-regulator cell for AXP813, thereby enabling the
> regulators.
> 
> Patch 2 adds a shared dtsi file for the PMIC. This currently contains
> a list of regulator nodes, but will be expanded with Quentin's power
> supply work.
> 
> Patches 3 through 5 add regulator nodes to board dts files for the A83T
> boards that I have. They are not squashed together as each file has
> substantial additions.
> 
> Patch 6 moves the mmc1 pinmux setting over to the dtsi, and sets it by
> default.
> 
> Patches 7 & 8 enable SDIO-based WiFi on the Cubietruck Plus and Banana
> Pi M3.

Applied patches 2-8, thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--fheubmp2yzfje5wk--
