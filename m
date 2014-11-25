From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 0/2] dt-bindings: simplefb: Drop the
 advice about using a specific path for nodes
Date: Tue, 25 Nov 2014 14:34:19 +0200
Message-ID: <5474774B.7080408@ti.com>
References: <1416309051-26784-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="27PVP15wm3OlnjjolfnQfkRqWpFf2irNd"
Return-path: <linux-sunxi+bncBCGMHFOOT4LBBVHO2GRQKGQEPAWFOOA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1416309051-26784-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--27PVP15wm3OlnjjolfnQfkRqWpFf2irNd
Content-Type: text/plain; charset=UTF-8

Hi,

On 18/11/14 13:10, Hans de Goede wrote:
> Hi Tomi,
> 
> So it turns out we needed a v3, as I mistakenly went with "sunxi," as vendor
> prefix for the allwinner specific properties, but the registered vendor prefix
> for allwinner is "allwinnner,", this version fixes this.
> 
> Changes in v3: Use proper "allwinnner," for the compatible string and vendor
> specific properties.
> 
> Changes in v2: Changed the simplefb-sunxi bindings to use a single
> sunxi,pipeline string property instead of a sunxi,pipeline int and a
> sunxi,output string property.
> 
> This patch set is all acked up, and a fix to the binding changes you've
> already queued for 3.19, so please queue these 2 patches for 3.19.

The discussions about this have continued in the earlier version of this
series. Is this series still ok for everyone?

The series looks fine to me, and has Grant's acks, so I'll merge it
tomorrow to fbdev tree if no one objects (and my comment for the patch 2
about sunxi/allwinner was just my ignorance).

 Tomi

--27PVP15wm3OlnjjolfnQfkRqWpFf2irNd--
