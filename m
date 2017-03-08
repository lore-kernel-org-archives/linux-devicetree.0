From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/2] ARM: dts: sunxi: Remove no longer used
 pinctrl/sun4i-a10.h header
Date: Wed, 8 Mar 2017 08:36:18 +0100
Message-ID: <20170308073618.kslqz3c2wdctexvi@lukather>
References: <20170308032821.26854-1-wens@csie.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4yjbqybes4bwqu4y"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB4XI73CQKGQEGBDLTOY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170308032821.26854-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--4yjbqybes4bwqu4y
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Wed, Mar 08, 2017 at 11:28:19AM +0800, Chen-Yu Tsai wrote:
> Hi Maxime,
> 
> This series gets rid of the last usage of the Allwinner specific pinconf
> bindings, and drops inclusion of dt-bindings/pinctrl/sun4i-a10.h across
> the tree.
> 
> Patch 1 gets rid of the last occurrence of Allwinner specific pinconf
> properties, which is actually a GPIO pinmux.
> 
> Patch 2 drops the #include for dt-bindings/pinctrl/sun4i-a10.h with a
> scripted approach.
> 
> A patch to remove the actual header file should be sent after this
> series is in Linus' tree, to avoid any unwanted cross-tree dependencies.
> If we want that to happen faster, maybe we could merge these as fixes.
> 
> Regards
> ChenYu

Applied both, thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--4yjbqybes4bwqu4y--
