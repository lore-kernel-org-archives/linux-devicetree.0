From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: Re: [PATCH v4 08/26] drm/sun4i: sun6i_mipi_dsi: Fix
 VBP size calculation
Date: Tue, 27 Nov 2018 11:25:32 +0100
Message-ID: <20181127102532.6wuwrhvk256g7kbm@flea>
References: <20181113111633.20189-1-jagan@amarulasolutions.com>
 <20181113111633.20189-9-jagan@amarulasolutions.com>
 <20181115095551.uctdkfmuwlnzhjnn@flea>
 <CAMty3ZAEHiovm6OF6JvJVQR4aqpG1Q3ML5YqxJkF2ntwRkUO=A@mail.gmail.com>
 <20181120155715.andrjp5kg6ugcv72@flea>
 <CAMty3ZCUOJmvekupOwh281g5HaazTpBbukWQY2Pv2OYypAwciw@mail.gmail.com>
 <55900bf3-efb5-5f78-5252-b3f6d4f775fb@openedev.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xxfqqmg4s6arnez2"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBLVX6TPQKGQE64DFJ4Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <55900bf3-efb5-5f78-5252-b3f6d4f775fb-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Cc: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org


--xxfqqmg4s6arnez2
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Mon, Nov 26, 2018 at 05:37:09PM +0530, Jagan Teki wrote:
> I'm about to send next version by combining with burst mode changes in
> one series. Do you have any further inputs on this. I didn't not see
> any breakage with 4-lane devices, but has issue with 2-lane w/o this change.

I'd rather focus on one thing for now. When your A64 DSI series will
be in, then you can focus on the burst mode.

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--xxfqqmg4s6arnez2--
