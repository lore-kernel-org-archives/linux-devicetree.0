From: Arnaud Pouliquen <arnaud.pouliquen-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 0/5] ARM: DT: STI: update audio part
Date: Tue, 4 Oct 2016 18:11:52 +0200
Message-ID: <1475597517-14225-1-git-send-email-arnaud.pouliquen@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Moise Gergaud <moise.gergaud-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

- DT part associated to following ASoC patchset: 
  http://www.spinics.net/lists/alsa-devel/msg54782.html
- Enable hdmi audio card on b2120 board
- Fix some DT declarations 

Arnaud Pouliquen (5):
  ARM: DT: STiH407-family: sti sound card field cleaning
  ARM: DT: STiH407: Add label for sti-hdmi node
  ARM: DT: STiH410: Add label for sti-hdmi node
  ARM: DT: STiHxxx-b2120: Add support of HDMI audio
  ARM: DT: STiH410-B2260: clean unnecessary hdmi node overlay

 arch/arm/boot/dts/stih407-family.dtsi | 32 ++++++--------------------------
 arch/arm/boot/dts/stih407.dtsi        |  2 +-
 arch/arm/boot/dts/stih410-b2260.dts   |  6 ------
 arch/arm/boot/dts/stih410.dtsi        |  2 +-
 arch/arm/boot/dts/stihxxx-b2120.dtsi  | 19 ++++++++++++++++++-
 5 files changed, 26 insertions(+), 35 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
