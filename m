From: Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/4 v3] drm: Add DT bindings documentation for ARC PGU
 display controller
Date: Thu, 24 Mar 2016 14:57:52 +0000
Message-ID: <1458831472.12765.8.camel@synopsys.com>
References: <1457710959-9562-1-git-send-email-abrodkin@synopsys.com>
	 <1457710959-9562-3-git-send-email-abrodkin@synopsys.com>
	 <20160321130419.GA23913@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-7"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160321130419.GA23913@rob-hp-laptop>
Content-Language: en-US
Content-ID: <FE0EDA569EBC864782B0AD5686A130DE-z7JfP6tgrtVBCHUSTMH8dZqQE7yCjDx5@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Mon, 2016-03-21 at 08:04 -0500, Rob Herring wrote:
+AD4- On Fri, Mar 11, 2016 at 06:42:37PM +-0300, Alexey Brodkin wrote:
+AD4- +AD4- 
+AD4- +AD4- This add DT bindings documentation for ARC PGU display controller.
+AD4- +AD4- 
+AD4- +AD4- Signed-off-by: Alexey Brodkin +ADw-abrodkin+AEA-synopsys.com+AD4-
+AD4- +AD4- Cc: Rob Herring +ADw-robh+-dt+AEA-kernel.org+AD4-
+AD4- +AD4- Cc: Pawel Moll +ADw-pawel.moll+AEA-arm.com+AD4-
+AD4- +AD4- Cc: Mark Rutland +ADw-mark.rutland+AEA-arm.com+AD4-
+AD4- +AD4- Cc: Ian Campbell +ADw-ijc+-devicetree+AEA-hellion.org.uk+AD4-
+AD4- +AD4- Cc: Kumar Gala +ADw-galak+AEA-codeaurora.org+AD4-
+AD4- +AD4- Cc: David Airlie +ADw-airlied+AEA-linux.ie+AD4-
+AD4- +AD4- Cc: dri-devel+AEA-lists.freedesktop.org
+AD4- +AD4- Cc: devicetree+AEA-vger.kernel.org
+AD4- +AD4- Cc: linux-snps-arc+AEA-lists.infradead.org
+AD4- +AD4- ---
+AD4- +AD4- 
+AD4- +AD4- Changes v2 -+AD4- v3:
+AD4- +AD4- +AKAAKg- Reverted back to initial larger version of example
+AD4- +AD4- +AKAAoACg-with minor fixes (thanks Rob for spotting those).
+AD4- +AD4- 
+AD4- +AD4- Changes v1 -+AD4- v2:
+AD4- +AD4- +AKAAKg- Removed everything except PGU node itself.
+AD4- +AD4- 
+AD4- +AD4- +AKA-.../devicetree/bindings/display/snps,arcpgu.txt+AKAAoACgAKAAfA- 72 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
+AD4- +AD4- +AKA-1 file changed, 72 insertions(+-)
+AD4- +AD4- +AKA-create mode 100644 Documentation/devicetree/bindings/display/snps,arcpgu.txt
+AD4- +AD4- 
+AD4- +AD4- diff --git a/Documentation/devicetree/bindings/display/snps,arcpgu.txt
+AD4- +AD4- b/Documentation/devicetree/bindings/display/snps,arcpgu.txt
+AD4- +AD4- new file mode 100644
+AD4- +AD4- index 0000000..b130924
+AD4- +AD4- --- /dev/null
+AD4- +AD4- +-+-+- b/Documentation/devicetree/bindings/display/snps,arcpgu.txt
+AD4- +AD4- +AEAAQA- -0,0 +-1,72 +AEAAQA-
+AD4- +AD4- +-ARC PGU
+AD4- +AD4- +-
+AD4- +AD4- +-This is a display controller found on several development boards produced
+AD4- +AD4- +-by Synopsys. The ARC PGU is an RGB streamer that reads the data from a
+AD4- +AD4- +-framebuffer and sends it to a single digital encoder (usually HDMI).
+AD4- +AD4- +-
+AD4- +AD4- +-Required properties:
+AD4- +AD4- +-+AKAAoA-- compatible: +ACI-snps,arcpgu+ACI-
+AD4- +AD4- +-+AKAAoA-- reg: Physical base address and length of the controller's registers.
+AD4- +AD4- +-+AKAAoA-- clocks: A list of phandle +- clock-specifier pairs, one for each
+AD4- +AD4- +-+AKAAoACgAKA-entry in 'clock-names'.
+AD4- +AD4- +-+AKAAoA-- clock-names: A list of clock names. For ARC PGU it should contain:
+AD4- +AD4- +-+AKAAoACgAKAAoACg-- +ACI-pxlclk+ACI- for the clock feeding the output PLL of the controller.
+AD4- +AD4- +-+AKAAoA-- encoder-slave: Phandle of encoder chip.
+AD4- Drop this as discussed.

Ok I'll do that.
But what about my example below?
Do I need to remove encoder node from it as well?

+AD4- +AD4- 
+AD4- +AD4- +-
+AD4- +AD4- +-Required sub-nodes:
+AD4- +AD4- +-+AKAAoA-- port: The PGU connection to an encoder chip.
+AD4- +AD4- +-
+AD4- +AD4- +-Example:
+AD4- +AD4- +-
+AD4- +AD4- +-/ +AHs-
+AD4- +AD4- +-	...
+AD4- +AD4- +-
+AD4- +AD4- +-	pgu+AEA-XXXXXXXX +AHs-
+AD4- +AD4- +-		compatible +AD0- +ACI-snps,arcpgu+ACIAOw-
+AD4- +AD4- +-		reg +AD0- +ADw-0xXXXXXXXX 0x400+AD4AOw-
+AD4- +AD4- +-		clocks +AD0- +ADwAJg-clock+AF8-node+AD4AOw-
+AD4- +AD4- +-		clock-names +AD0- +ACI-pxlclk+ACIAOw-
+AD4- +AD4- +-		encoder-slave +AD0- +ADwAJg-encoder+AF8-node+AD4AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-		port +AHs-
+AD4- +AD4- +-			pgu+AF8-output: endpoint +AHs-
+AD4- +AD4- +-				remote-endpoint +AD0- +ADwAJg-hdmi+AF8-enc+AF8-input+AD4AOw-
+AD4- +AD4- +-			+AH0AOw-
+AD4- +AD4- +-		+AH0AOw-
+AD4- +AD4- +-	+AH0AOw-
+AD4- +AD4- +-
+AD4- +AD4- +-	/+ACo- HDMI encoder on I2C bus +ACo-/
+AD4- +AD4- +-	i2c+AEA-XXXXXXXX +AHs-
+AD4- +AD4- +-		compatible +AD0- +ACI-...+ACIAOw-
+AD4- +AD4- +-
+AD4- +AD4- +-		encoder+AF8-node:encoder+AF8-node+AEA-0xXX+AHs-
+AD4- Don't use underscores in node names. Just +ACI-hdmi+AEA-xx+ACI-

Ok still I may keep label +ACI-encoder+AF8-node+ACI- here, right?

-Alexey--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
