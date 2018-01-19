From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 0/3] Add R-Car V3M (R8A77970) support to the R-Car LVDS driver
Date: Fri, 19 Jan 2018 21:29:18 +0300
Message-ID: <20180119182918.538035039@cogentembedded.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello!

Here's the set of 3 patches against the 'drm-next' branch of David Airlie's
'linux.git' repo plus the patch fixing LVDS startup for R-Car gen2/3 and
Laurent Picnahrt's patches creating the R-Car LVDS bridge driver posted
recently. The main purpose of these patches is to add the R-Car V3M (R8A77970)
support to the R-Car LVDS driver -- we have to do some refactoring first to
achieve this goal...

[1/3] drm: rcar-du: lvds: refactor LVDS startup
[2/3] DT: display: renesas,lvds: document R8A77970 bindings
[3/3] drm: rcar-du: lvds: add R8A77970 support

MBR, Sergei
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
