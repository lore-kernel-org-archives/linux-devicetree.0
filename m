From: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 7/9] phy: add Broadcom Kona USB2 PHY DT binding
Date: Fri, 1 Nov 2013 18:56:14 -0400
Message-ID: <20131101225614.GC17505@beef>
References: <1383335158-19730-1-git-send-email-matt.porter@linaro.org>
 <1383335158-19730-8-git-send-email-matt.porter@linaro.org>
 <527414F2.7090402@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <527414F2.7090402-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linaro Patches <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 01, 2013 at 09:54:10PM +0100, Arend van Spriel wrote:
> On 11/01/2013 08:45 PM, Matt Porter wrote:
> >Add a binding that describes the Broadcom Kona USB2 PHY found
> >on the BCM281xx family of SoCs.
> >
> >Signed-off-by: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >---
> >  .../devicetree/bindings/phy/bcm-kona-usb2-phy.txt         | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/bcm-kona-usb2-phy.txt
> >
> >diff --git a/Documentation/devicetree/bindings/phy/bcm-kona-usb2-phy.txt b/Documentation/devicetree/bindings/phy/bcm-kona-usb2-phy.txt
> >new file mode 100644
> >index 0000000..db309e2
> >--- /dev/null
> >+++ b/Documentation/devicetree/bindings/phy/bcm-kona-usb2-phy.txt
> >@@ -0,0 +1,15 @@
> >+BROADCOM KONA USB2 PHY
> >+
> >+Required properties:
> >+ - compatible: brcm,kona-usb2-phy
> >+ - regs: offset and length of the PHY registers
> >+ - #phy-cells: must be 0
> >+Refer to phy/phy-bindings.txt for the generic PHY binding properties
> >+
> >+Example:
> >+
> >+	usbphy: usbphy@3f130000 {
> >+		compatible = "brcm,kona-usb2-phy";
> >+		reg = <0x3f130000 0x28>;
> 
> I expect 'regs' iso 'reg' in this example.

Yes, will fix the typo in that property for v3.

Thanks,
Matt

> >+		#phy-cells = <0>;
> >+	};
> >
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
