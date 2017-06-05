From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 0/2] ARM/arm64: sunxi: convert CCU raw
 numbers to macros
Date: Mon, 5 Jun 2017 15:52:43 +0200
Message-ID: <20170605135243.6mznky5jiri7wd2x@flea.lan>
References: <20170605090033.31663-1-wens@csie.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="exux3rvlqvuda3a6"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBLGE2XEQKGQEC4A6QUY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170605090033.31663-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--exux3rvlqvuda3a6
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Mon, Jun 05, 2017 at 05:00:31PM +0800, Chen-Yu Tsai wrote:
> Hi Maxime,
> 
> This is a fixed version of my "convert CCU raw numbers to macros" series.
> Please take these instead.
> 
> Changes since v1:
> 
>   - Fixed incorrect macro name for IR reset control phandle
> 
>   - Fixed header filename typo
> 
> These are some clean up patches for 4.12. They convert raw number
> references for the CCU and R_CCU nodes, from when the CCU/R_CCU stuff
> was first added, to the defined macros in the device tree header files.
> 
> These affect the A64 and H3/H5.
> 
> These are based on our sunxi/fixes-for-4.12 branch. Once these are merged,
> I think it's time to send off pull requests for our fixes branches.

Applied both, thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--exux3rvlqvuda3a6--
