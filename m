From: Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/4 v2] drm: Add DT bindings documentation for ARC PGU
 display controller
Date: Mon, 7 Mar 2016 14:53:12 +0000
Message-ID: <1457362392.2932.49.camel@synopsys.com>
References: <1457015956-30708-1-git-send-email-abrodkin@synopsys.com>
	 <1457015956-30708-3-git-send-email-abrodkin@synopsys.com>
	 <20160305043001.GB13525@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-7"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160305043001.GB13525@rob-hp-laptop>
Content-Language: en-US
Content-ID: <BB117C9FF404D44A93C6357D800189FE-z7JfP6tgrtVBCHUSTMH8dZqQE7yCjDx5@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Fri, 2016-03-04 at 22:30 -0600, Rob Herring wrote:
+AD4- On Thu, Mar 03, 2016 at 05:39:14PM +-0300, Alexey Brodkin wrote:
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
+AD4- +AD4- 
+AD4- +AD4- Changes v1 -+AD4- v2:
+AD4- +AD4- +AKAAKg- Clean-up
+AD4- Not really useful. What we like to see is what changed. Maintainers have+AKA-
+AD4- short memories and don't remember what they said previously (unless+AKA-
+AD4- comments are ignored).

That's understood :)

+AD4- +AD4- 
+AD4- +AD4- 
+AD4- +AD4- +AKA-.../devicetree/bindings/display/snps,arcpgu.txt+AKAAoACgAKAAfA- 33 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
+AD4- +AD4- +AKA-1 file changed, 33 insertions(+-)
+AD4- +AD4- +AKA-create mode 100644 Documentation/devicetree/bindings/display/snps,arcpgu.txt
+AD4- +AD4- 
+AD4- +AD4- diff --git a/Documentation/devicetree/bindings/display/snps,arcpgu.txt
+AD4- +AD4- b/Documentation/devicetree/bindings/display/snps,arcpgu.txt
+AD4- +AD4- new file mode 100644
+AD4- +AD4- index 0000000..57f3bc8
+AD4- +AD4- --- /dev/null
+AD4- +AD4- +-+-+- b/Documentation/devicetree/bindings/display/snps,arcpgu.txt
+AD4- +AD4- +AEAAQA- -0,0 +-1,33 +AEAAQA-
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
+AD4- +AD4- +-
+AD4- +AD4- +-Required sub-nodes:
+AD4- +AD4- +-+AKAAoA-- port: The PGU connection to an encoder chip. The connection is modelled
+AD4- +AD4- +-+AKAAoACgAKA-using the OF graph bindings specified in
+AD4- +AD4- +-+AKAAoACgAKA-Documentation/devicetree/bindings/graph.txt.
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
+AD4- Where's the port? Didn't you previously say it was optional?

Well I wanted to get rid of anything except bare minimal that is required for
that driver.

What I did miss in that clean-up is description above.
In particular +ACI-Required subnodes+ACI- section that still lists +ACI-port+ACI-.

And frankly now I'm a bit lost with what should I put in that binding
description and what should not. Any comments here are much appreciated.

-Alexey--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
