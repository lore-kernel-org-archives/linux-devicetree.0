From: Stuart Yoder <stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 0/3] Docs: dt: update binding for Freescale Management Complex
Date: Fri, 25 Sep 2015 16:08:03 -0500
Message-ID: <1443215286-3126-1-git-send-email-stuart.yoder@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, german.rivera-KZfg59tc24xl57MIdRCFDg@public.gmane.org, bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org, itai.katz-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Stuart Yoder <stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Update the binding for the Freescale Management Complex to include definition
of ranges, msi-parent, and dpmac subnodes.

Stuart Yoder (3):
  Docs: dt: fsl-mc: update binding to include msi-parent
  Docs: dt: fsl-mc update binding to include definition of ranges
  Docs: dt: fsl-mc: update binding to define dpmac subnodes

 .../devicetree/bindings/misc/fsl,qoriq-mc.txt      | 81 +++++++++++++++++++++-
 1 file changed, 80 insertions(+), 1 deletion(-)

-- 
2.3.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
