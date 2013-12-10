From: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
Subject: [RFC v2] Beaglebone-Black HDMI audio
Date: Tue, 10 Dec 2013 20:52:30 +0200
Message-ID: <cover.1386504183.git.jsarha__46449.1895203993$1386701570$gmane$org@ti.com>
References: <cover.1384862950.git.jsarha@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1384862950.git.jsarha-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The first post of this patch had some addresses missing so here it comes again.
 
Changes since the first RFC version of the patch:
- Change sound node's compatible property
  form: "ti,am33xx-beaglebone-black" to "ti,am33xx-beaglebone-black-audio"

The patch has been rebased on top of:
git://git.kernel.org/pub/scm/linux/kernel/git/bcousson/linux-omap-dt.git for_3.13/dts

The associated code changes can be found here:
http://mailman.alsa-project.org/pipermail/alsa-devel/2013-December/069897.html

Best regards,
Jyri

Jyri Sarha (1):
  ARM/dts: am335x-boneblack: Add HDMI audio support

 arch/arm/boot/dts/am335x-boneblack.dts |   52 ++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
