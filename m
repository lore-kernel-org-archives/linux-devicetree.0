From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v7 0/8] drm: sun8i: Add DE2 HDMI video support
Date: Wed, 30 Nov 2016 10:05:45 +0100
Message-ID: <20161130100545.44546ed28896cdb9768f68cd@free.fr>
References: <cover.1480414715.git.moinejf@free.fr>
	<20161129213650.uqcgekodq77wlmxs@lukather>
Reply-To: moinejf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCV6DL6LYMNBB35M7LAQKGQEVKTFFYA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20161129213650.uqcgekodq77wlmxs@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 29 Nov 2016 22:36:50 +0100
Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> On Tue, Nov 29, 2016 at 11:18:35AM +0100, Jean-Francois Moine wrote:
> > This patchset series adds HDMI video support to the Allwinner
> > sun8i SoCs which include the display engine 2 (DE2).
> > The driver contains the code for the A83T and H3 SoCs, and
> > some H3 boards, but it could be used/extended for other SoCs
> > (A64, H2, H5) and boards (Banana PIs, Orange PIs).
>=20
> Honestly, I'm getting a bit worried by the fact that you ignore
> reviews.
>=20
> On the important reviews that you got that are to be seen as major
> issues that block the inclusion, we have:
>   - The fact that the HDMI driver is actually just a designware IP,
>     and while you should use the driver that already exists, you just
>     duplicated all that code.

The DW registers in the A83T and H3 are obfuscated, so, the code in
bridge/DW cannot be used as it is. There should be either a translation
table or a function to compute the register addresses.

More, it is not sure that the bridge/DW code would work with
Allwinner's SoCs. It seems that they got some schematics from
DesignWare, but, is it really the same hardware? Also, if some changes
had to be done in the bridge code, I could not check if this would
break or not the other SoCs.

Eventually, I went the same way as omap/hdmi5: different driver.

>   - The fact that you ignored Rob (v6) and I (v5) comment on using OF
>     graph to model the connection between the display engine and the
>     TCON. Something that Laurent also pointed out in this version.

I simply use the drm function drm_of_component_probe().
If this one is in the DRM core, why should I not use it?
If it must not be used, it would be nice to mark it as deprecated and
to update the code of the drivers which are using it.

>   - The fact that you ignored that you needed an HDMI connector node
>     as a child of the HDMI controller. This has been reported by Rob
>     (v6) and yet again in this version by Laurent.

As I don't know what is a DT 'connector', I cannot go further.
I hope Laurent will give me clearer explanations and a real example.

>   - And finally the fact that we can't have several display engine in
>     parallel, if needs be. This has happened in the past already on
>     Allwinner SoCs, so it's definitely something we should consider in
>     the DT bindings, since we can't break them.

IIRC, I proposed my driver before yours, and the DE2 is completely
different from the other display engines.
What you are telling is "add more code to already complex code and have
a big driver for all SoCs in each kernels".
I think it should be better to have small modules, each one treating
specific hardware, and to let only the needed code in the kernel memory
at startup time.

> Until those are fixed, I cannot see how this driver can be merged,
> unfortunately.

No problem. I just wanted to help people by giving the job I did on the
boards I have. My boards are working for almost one year, fine enough
for I use them as daily desktop computers. I don't want to spend one
more year for having my code in the Linux kernel: there are so much
other exciting things to do...

--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
