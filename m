From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: Re: [PATCH 0/4 v6] drm: Add support of ARC PGU display controller
Date: Fri, 22 Apr 2016 14:53:48 +0000
Message-ID: <1461336820.3205.10.camel@synopsys.com>
References: <1461071980-5916-1-git-send-email-abrodkin@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-7"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461071980-5916-1-git-send-email-abrodkin@synopsys.com>
Content-Language: en-US
Content-ID: <E969BF8FF110544BBB273CDBF29C89E4@internal.synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "airlied@linux.ie" <airlied@linux.ie>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, Carlos Palminha <CARLOS.PALMINHA@synopsys.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jose Abreu <Jose.Abreu@synopsys.com>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "galak@codeaurora.org" <galak@codeaurora.org>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Vineet Gupta <Vineet.Gupta1@synopsys.com>
List-Id: devicetree@vger.kernel.org

Hi David,

On Tue, 2016-04-19 at 16:19 +-0300, Alexey Brodkin wrote:
+AD4- This series add support of ARC PGU display controller.
+AD4- ARC PGU is a quite simple byte streamer that gets data from the framebuffer
+AD4- and pushes it to hte connected encoder (DP or HDMI).
+AD4- 
+AD4- It was tested on ARC SDP boards (axs101/103 in particular).
+AD4- 
+AD4- Note following series (v6) that introduces drm+AF8-connector+AF8-register+AF8-all()
+AD4- is a prerequisite now: https://lkml.org/lkml/2016/4/19/299
+AD4- 
+AD4- Changes v5 -+AD4- v6:
+AD4- +AKAAKg- +ACI-arc: Add our own implementation of fb+AF8-pgprotect()+ACI- was already applied to
+AD4- +AKAAoACg-ARC's tree and available in linux-next:
+AD4- +AKAAoACg-http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/?id+AD0-e5e0a65cd20a7a892a87e6bd73bdc3d83726d725
+AD4- 
+AD4- Changes v4 -+AD4- v5:
+AD4- +AKAAKg- Removed encode node from DT bindings example (as suggested by Rob)
+AD4- 
+AD4- Changes v3 -+AD4- v4:
+AD4- +AKAAKg- Main driver author is now set properly (thanks Carlos for all your efforts)
+AD4- +AKAAKg- Implemented correct hsync and vsync setup (thanks Jose)
+AD4- +AKAAKg- Dummy call-backs were removed (as suggested by Daniel)
+AD4- +AKAAKg- Obsolete load()/unload() call-backs were removed (as suggested by Daniel)
+AD4- +AKAAKg- With above in mind we were able to adopt recently introduced
+AD4- +AKAAoACg-drm+AF8-connector+AF8-register+AF8-all()/drm+AF8-connector+AF8-unregister+AF8-all()
+AD4- +AKAAKg- Implemented setup of properties (uncached) for FB user-pages
+AD4- +AKAAKg- Minor clean-up in DT binding docs and axs10x+AF8-mb.dtsi
+AD4- 
+AD4- Changes v2 -+AD4- v3:
+AD4- +AKAAKg- Improved failure path if arcpgu+AF8-connector wasn't allocated.
+AD4- +AKAAKg- Fixed driver building as module.
+AD4- +AKAAKg- Implemented uncached mapping of user-space FB pages.
+AD4- +AKAAKg- Again updated DT bindings docs.
+AD4- 
+AD4- Changes v1 -+AD4- v2:
+AD4- +AKAAKg- Clean-up of DT bindings documentation.
+AD4- +AKAAKg- Added missing +ACI-pxlclk+ACI- clock in axs10x+AF8-mb.dtsi.

That's my first submission of a DRM driver and I'm wondering
which tree/branch should I use as a reference to rebase my
patches and send you a pull request?

Especially given there's a prerequisite which is still only in
linux-next:+AKA-http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/?id+AD0-54d2c2da0946368b96b63e6daed7920f3
681243e

Regards,
Alexey
