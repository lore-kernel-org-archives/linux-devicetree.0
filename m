From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] arm64: allwinner: sun50i-a64: Remove
 duplicate ethernet@1c30000
Date: Fri, 9 Jun 2017 15:58:17 +0200
Message-ID: <20170609135817.wntaqkbekiagq45e@flea.home>
References: <1497012052-14027-1-git-send-email-jteki@openedev.com>
 <6d21516d-7412-5f16-f6f8-b7d46106b4f5@arm.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zq7ifyqrachzhhgv"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB6WS5LEQKGQEAFS63ZQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <6d21516d-7412-5f16-f6f8-b7d46106b4f5-5wv7dgnIgG8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--zq7ifyqrachzhhgv
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Fri, Jun 09, 2017 at 02:38:39PM +0100, Andre Przywara wrote:
> Hi,
> 
> On 09/06/17 13:40, Jagan Teki wrote:
> > From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> > 
> > Remove duplicate ethernet@1c30000 from allwinner/sun50i-a64.dtsi
> 
> I think this is an artefact of the sun8i-dwmac merging, where both David
> and Maxime merged the DT patches in their trees (compare e53f67e9 and
> 103aefa0). I think both of them are in the process of sorting this out
> (as this effects more than this hunk, I believe).

Yeah, hopefully we'll manage to fix this.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--zq7ifyqrachzhhgv--
