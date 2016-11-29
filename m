From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v7 0/8] drm: sun8i: Add DE2 HDMI video support
Date: Tue, 29 Nov 2016 22:36:50 +0100
Message-ID: <20161129213650.uqcgekodq77wlmxs@lukather>
References: <cover.1480414715.git.moinejf@free.fr>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="l5vbfljmsayjyanp"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB7PJ67AQKGQEYFKXK2Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <cover.1480414715.git.moinejf-GANU6spQydw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Cc: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--l5vbfljmsayjyanp
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Tue, Nov 29, 2016 at 11:18:35AM +0100, Jean-Francois Moine wrote:
> This patchset series adds HDMI video support to the Allwinner
> sun8i SoCs which include the display engine 2 (DE2).
> The driver contains the code for the A83T and H3 SoCs, and
> some H3 boards, but it could be used/extended for other SoCs
> (A64, H2, H5) and boards (Banana PIs, Orange PIs).

Honestly, I'm getting a bit worried by the fact that you ignore
reviews.

On the important reviews that you got that are to be seen as major
issues that block the inclusion, we have:
  - The fact that the HDMI driver is actually just a designware IP,
    and while you should use the driver that already exists, you just
    duplicated all that code.

  - The fact that you ignored Rob (v6) and I (v5) comment on using OF
    graph to model the connection between the display engine and the
    TCON. Something that Laurent also pointed out in this version.

  - The fact that you ignored that you needed an HDMI connector node
    as a child of the HDMI controller. This has been reported by Rob
    (v6) and yet again in this version by Laurent.

  - And finally the fact that we can't have several display engine in
    parallel, if needs be. This has happened in the past already on
    Allwinner SoCs, so it's definitely something we should consider in
    the DT bindings, since we can't break them.

Until those are fixed, I cannot see how this driver can be merged,
unfortunately.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--l5vbfljmsayjyanp--
