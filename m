From: Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/4] drm: Add DT bindings documentation for ARC PGU
 display controller
Date: Thu, 3 Mar 2016 13:58:18 +0000
Message-ID: <1457013497.3005.99.camel@synopsys.com>
References: <1455887034-7739-1-git-send-email-abrodkin@synopsys.com>
	 <1455887034-7739-3-git-send-email-abrodkin@synopsys.com>
	 <20160223203841.GA15744@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-7"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160223203841.GA15744@rob-hp-laptop>
Content-Language: en-US
Content-ID: <93A90BFEBB9B7C47B46B9724BDBF47C8-z7JfP6tgrtVBCHUSTMH8dZqQE7yCjDx5@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Tue, 2016-02-23 at 14:38 -0600, Rob Herring wrote:
+AD4- On Fri, Feb 19, 2016 at 04:03:52PM +-0300, Alexey Brodkin wrote:
+AD4- +AD4- 
+AD4- +AD4- This add DT bindings documentation for ARC PGU display controller.
+AD4- +AD4- 
+AD4- +AD4- Signed-off-by: Alexey Brodkin +ADw-abrodkin+AEA-synopsys.com+AD4-
+AD4- +AD4- Cc: Rob Herring +ADw-robh+-dt+AEA-kernel.org+AD4-
+AD4- +AD4- Cc: Pawel Moll +ADw-pawel.moll+AEA-arm.com+AD4-
+AD4- +AD4- Cc: Mark Rutland +ADw-mark.rutland+AEA-arm.com+AD4-
+AD4- +AD4- Cc: Ian Campbell +ADw-ijc+-devicetree+AEA-hellion.org.uk+AD4-
+AD4- +AD4- Cc: Kumar Gala +ADw-galak+AEA-codeaurora.org+AD4-
+AD4- +AD4- Cc: devicetree+AEA-vger.kernel.org
+AD4- +AD4- Cc: linux-snps-arc+AEA-lists.infradead.org
+AD4- +AD4- ---
+AD4- +AD4- +AKA-.../devicetree/bindings/display/snps,arcpgu.txt+AKAAoACgAKAAfA- 74 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
+AD4- +AD4- +AKA-1 file changed, 74 insertions(+-)
+AD4- +AD4- +AKA-create mode 100644 Documentation/devicetree/bindings/display/snps,arcpgu.txt
+AD4- +AD4- 
+AD4- +AD4- diff --git a/Documentation/devicetree/bindings/display/snps,arcpgu.txt
+AD4- +AD4- b/Documentation/devicetree/bindings/display/snps,arcpgu.txt
+AD4- +AD4- new file mode 100644
+AD4- +AD4- index 0000000..c8382fb
+AD4- +AD4- --- /dev/null
+AD4- +AD4- +-+-+- b/Documentation/devicetree/bindings/display/snps,arcpgu.txt
+AD4- +AD4- +AEAAQA- -0,0 +-1,74 +AEAAQA-
+AD4- +AD4- +-ARC PGU
+AD4- +AD4- +-
+AD4- +AD4- +-This is a display controller found on several development boards produced
+AD4- +AD4- +-by Synopsys. The ARC PGU is an RGB streamer that reads the data from a
+AD4- +AD4- +-framebuffer and sends it to a single digital encoder (usually HDMI).
+AD4- +AD4- +-
+AD4- +AD4- +-Required properties:
+AD4- +AD4- +-+AKAAoA-- compatible: +ACI-snps,arcpgu+ACI-
+AD4- Seems like this should be more specific. Is there some sort or+AKA-
+AD4- versioning with ARC blocks?

Well as of today there's only one and only version of PGU.
So is there a real need for +ACI-snps,arcpgu-1.0+ACI-?

+AD4- +AD4- 
+AD4- +AD4- +-+AKAAoA-- reg: Physical base address and length of the controller's registers.
+AD4- +AD4- +-+AKAAoA-- clocks: A list of phandle +- clock-specifier pairs, one for each
+AD4- +AD4- +-+AKAAoACgAKA-entry in 'clock-names'.
+AD4- +AD4- +-+AKAAoA-- clock-names: A list of clock names. For ARC PGU it should contain:
+AD4- +AD4- +-+AKAAoACgAKAAoACg-- +ACI-pxlclk+ACI- for the clock feeding the output PLL of the controller.
+AD4- +AD4- +-+AKAAoA-- encoder-slave: Phandle of encoder chip.
+AD4- This is unnecessary with the OF graph.

Do you mean I may drop +ACI-encoder-slave+ACI- from bindings description?
I actually thought about that because in case of simulation platform where
this device is also used there's no encoder as well as no connector - we're
dealing with memory area which is read by host and then displayed on host's
display.

+AD4- +AD4- +-
+AD4- +AD4- +-/ +AHs-
+AD4- +AD4- +-	...
+AD4- +AD4- +-
+AD4- +AD4- +-	pgu+AEA-0xXXXXXXXX +AHs-
+AD4- Unit address should not have '0x'

Correct, let me fix it.

+AD4- +AD4- +-
+AD4- +AD4- +-	/+ACo- HDMI encoder on I2C bus +ACo-/
+AD4- +AD4- +-	i2c+AEA-0xXXXXXXXX +AHs-
+AD4- +AD4- +-		compatible +AD0- +ACI-...+ACIAOw-
+AD4- +AD4- +-
+AD4- +AD4- +-		encoder+AF8-node:encoder+AF8-node+AEA-0xXXXXXXXX+AHs-
+AD4- I2C addresses would be 8-bit only.

Indeed - copy-paste is evil :)

-Alexey
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
