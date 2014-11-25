From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 2/2] dt-bindings: simplefb-sunxi: Add
 sunxi simplefb extensions
Date: Tue, 25 Nov 2014 15:38:02 +0200
Message-ID: <5474863A.5040801@ti.com>
References: <1416309051-26784-1-git-send-email-hdegoede@redhat.com> <1416309051-26784-3-git-send-email-hdegoede@redhat.com> <547476DA.2030004@ti.com> <54747B72.1050406@redhat.com> <54747DCF.9010502@ti.com> <5474824F.8080000@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="stKCBNMHWKr9p33iMngmxajA5t3O6jPtS"
Return-path: <linux-sunxi+bncBCGMHFOOT4LBBSUM2KRQKGQEKOYMKVA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <5474824F.8080000-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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

--stKCBNMHWKr9p33iMngmxajA5t3O6jPtS
Content-Type: text/plain; charset=UTF-8

On 25/11/14 15:21, Hans de Goede wrote:

>> Shouldn't the compatible then be "allwinner,sunxi-simple-framebuffer",
>> to differentiate from some other SoC Allwinner has or might create in
>> the future? That is, presuming you're confident enough that a single
>> compatible string covers all the current and forthcoming sunxi SoCs.
> 
> This was discussed in an earlier thread, we (Ian Campbell, Grant and me)

Okay. Sorry for not having time at the moment to follow the discussions
properly. =)

> decided to settle on allwinner,simple-framebuffer to make it clear that
> these are allwinner extensions to the standard simple-framebuffer bindings,
> and that the node otherwise is simple-framebuffer compatible.
> 
> We were afraid that e.g. sun4i-simple-framebuffer would signal that it
> is not a normal simple-framebuffer node, so we decided to go with just
> the allwinner, prefix to indicate that it uses allwinner specific
> extensions.

Wouldn't

compatible = "allwinner,sun4i-simple-framebuffer", "simple-framebuffer";

tell that it's a simple-framebuffer, with allwinner's sun4i extensions?

I guess you can have just "allwinner,simple-framebuffer", and then if a
new Allwinner SoC has a totally different display controller, the
documentation would specify that this property is for that SoC, and this
another property is for that another SoC. But isn't the compatible
string what's supposed to use in cases like this?

And if the new SoC is not sunxi, but some totally other family, there's
need for a new compatible string anyway, as
"simple-framebuffer-sunxi.txt" is for sunxi only.

 Tomi

--stKCBNMHWKr9p33iMngmxajA5t3O6jPtS--
