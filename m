From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 0/7] Allwinner A64 DE2 CCU support with
 dedicated DE2 bus driver
Date: Mon, 25 Jun 2018 18:00:52 +0200
Message-ID: <20180625160052.kgje2hnzwhfcm2i5@flea>
References: <20180622122615.55836-1-icenowy@aosc.io>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wmxasll2s52fhhq4"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBP5DYTMQKGQEDT52KUQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180622122615.55836-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--wmxasll2s52fhhq4
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

Hi,

On Fri, Jun 22, 2018 at 08:26:08PM +0800, Icenowy Zheng wrote:
> This patchset tries to implement the Allwinner A64 DE2 as a bus driver,
> in order to model the fact that the SRAM claim controls the access to
> the whole DE2 memory space.
> 
> PATCH 1 and PATCH 4 are for the CCU part.
> 
> PATCH 2 is the device tree binding for the A64 DE2 bus, and PATCH 3
> implements the bus driver.
> 
> PATCH 5 adds the DE2 CCU device tree node, with the DE2 bus node.
> 
> PATCH 6 and 7 are HDMI simplefb patches for A64. They're present as a
> test to this patchset.

Apart from the (minor) comments I made that can be fixed up while
applying, I'm happy with those changes. I'd still like to get a review
from Rob, so I'll wait for it to apply them.

Thanks a lot for working on this,
Maxime

-- 
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--wmxasll2s52fhhq4--
