From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/3] arm64: dts: A64 board MMC support
Date: Wed, 11 Jan 2017 14:51:39 +0100
Message-ID: <20170111135139.ktirdwmzhyv3cn2q@lukather>
References: <1484011353-21480-1-git-send-email-andre.przywara@arm.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5pouf7nwjynqu5uf"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB3HQ3DBQKGQEGXW3UOY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1484011353-21480-1-git-send-email-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--5pouf7nwjynqu5uf
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Tue, Jan 10, 2017 at 01:22:30AM +0000, Andre Przywara wrote:
> These patches here go on top of Maxime's latest A64 MMC series and
> enable the MMC controllers on the boards using the A64 SoC.
> As the BananaPi-M64 DT now looks different, lets adds support for
> that board as well, with one major difference to the Pine64 being the eMMC
> chip.
> 
> I could't find commit f9ca9b952ee1 Maxime mentioned in his cover letter,
> so I applied his patches on top of sunxi/for-next and cherry-picked
> b4b8664d29 to fix the arm64 build.

I'm fine with all your patches. I've queued them in my MMC series, and
will continue pushing them and / or merging them if it's ok for you.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--5pouf7nwjynqu5uf--
