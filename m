From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 3/3] PCI: imx6: Add support for i.MX6 PCIe controller
Date: Mon, 16 Sep 2013 17:01:48 +0800
Message-ID: <20130916090146.GL31147@S2101-09.ap.freescale.net>
References: <1379065222-7275-1-git-send-email-xobs@kosagi.com>
 <1379065222-7275-4-git-send-email-xobs@kosagi.com>
 <20130916060631.GF31147@S2101-09.ap.freescale.net>
 <5236AB28.5060708@kosagi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5236AB28.5060708-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Cross <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Zhu Richard-R65037 <r65037-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 16, 2013 at 02:54:32PM +0800, Sean Cross wrote:
> >>@@ -116,6 +116,22 @@
> >>  			arm,data-latency = <4 2 3>;
> >>  		};
> >>+		pcie: pcie@0x01000000 {
> >>+			compatible = "fsl,imx6-pcie", "snps,dw-pcie";
> >We generally use particular SoC name to specify the compatible string.
> >So "fsl,imx6q-pcie" will be more appropriate.
> Any reason to specify imx6q in particular?  It's also present on the
> imx6d, imx6dl, and imx6s (basically, everything but the imx6sl).

The compatible naming is not about coverage but versioning.  We
generally encode the name of the SoC that firstly integrates the block
to specify the version.

Shawn

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
