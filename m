From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 2/2] dt-bindings: simplefb-sunxi: Add
 sunxi simplefb extensions
Date: Tue, 25 Nov 2014 15:02:07 +0200
Message-ID: <54747DCF.9010502@ti.com>
References: <1416309051-26784-1-git-send-email-hdegoede@redhat.com> <1416309051-26784-3-git-send-email-hdegoede@redhat.com> <547476DA.2030004@ti.com> <54747B72.1050406@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="PAKNBTKCbBFfRP6lAUVRwuD1U00Tt7h6G"
Return-path: <linux-sunxi+bncBCGMHFOOT4LBBWP32GRQKGQE4A3T62Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <54747B72.1050406-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--PAKNBTKCbBFfRP6lAUVRwuD1U00Tt7h6G
Content-Type: text/plain; charset=UTF-8

On 25/11/14 14:52, Hans de Goede wrote:

>>> +Required properties:
>>> +- compatible: "allwinner,simple-framebuffer"
>>> +- allwinner,pipeline, one of:
>>
>> Sorry my ignorance, but what's sunxi and what's allwinner? Both names
>> are mixed here.
> 
> sunxi is the sun#i SoCs from Allwinner, Allwinner is the manufacturer
> and the
> SoC "code" names used everywhere in the kernel for their SoCs are sun4i,
> sun5i,
> sun6i, etc. Most people refer to these SoCs as sunxi. This is also what the
> linux-sunxi mailinglist in the Cc is about.
> 
> The official devicetree vendor prefix for Allwinner is allwinner, hence the
> allwinner in the compatible name, see e.g. also
> 
> Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
> 
> Which also uses sunxi / sun4i everywhere except in the compatible vendor
> prefix.

Alright, thanks for explanation.

Shouldn't the compatible then be "allwinner,sunxi-simple-framebuffer",
to differentiate from some other SoC Allwinner has or might create in
the future? That is, presuming you're confident enough that a single
compatible string covers all the current and forthcoming sunxi SoCs.

Perhaps simplefb is a bit special case, but I usually feel better if the
compatible string is defined in a more specific manner. In this case I'd
have:

allwinner,sun4i-simple-framebuffer
allwinner,sun5i-simple-framebuffer
allwinner,sun6i-simple-framebuffer

so that if sun7i has totally different display controller, there would
be no conflict.

 Tomi

--PAKNBTKCbBFfRP6lAUVRwuD1U00Tt7h6G--
