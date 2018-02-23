Return-Path: <SRS0=o2nh=FR=vger.kernel.org=devicetree-compiler-owner@kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC dtc 0/2] Drop unit addresses from overlay fragments
Date: Fri, 23 Feb 2018 09:35:15 +0100
Message-Id: <1519374917-30171-1-git-send-email-geert+renesas@glider.be>
Sender: devicetree-compiler-owner@vger.kernel.org
To: David Gibson <david@gibson.dropbear.id.au>, Jon Loeliger <jdl@jdl.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

	Hi all,

Using "fragment@N" as node name for overlay fragments violates unit
address rules:

    <stdout>: Warning (unit_address_vs_reg): Node /fragment@0 has a unit name, but no reg property

This patch series (for dtc) fixes:
  1. generation of node names when using overlay sugar syntax,
  2. all documentation and tests.

If this is accepted, I'll send similar patches for Linux.

Note that I've been using "fragment-N" in hand-written DT overlays for
years, so this is known to work fine with Linux.

Thanks for your comments!

Geert Uytterhoeven (2):
  overlay: Do not use @ in overlay fragment generation
  Use "fragment-N" instead of "fragment@N"

 Documentation/dt-object-internal.txt        | 20 +++++++--------
 livetree.c                                  |  2 +-
 tests/overlay_bad_fixup_bad_index.dts       |  2 +-
 tests/overlay_bad_fixup_base.dtsi           |  2 +-
 tests/overlay_bad_fixup_empty_index.dts     |  2 +-
 tests/overlay_bad_fixup_index_trailing.dts  |  2 +-
 tests/overlay_bad_fixup_path_empty_prop.dts |  2 +-
 tests/overlay_bad_fixup_path_only.dts       |  2 +-
 tests/overlay_bad_fixup_path_only_sep.dts   |  2 +-
 tests/overlay_bad_fixup_path_prop.dts       |  2 +-
 tests/overlay_overlay.dts                   | 16 ++++++------
 tests/overlay_overlay_manual_fixups.dts     | 38 ++++++++++++++---------------
 tests/overlay_overlay_no_fixups.dts         | 16 ++++++------
 tests/stacked_overlay_bar.dts               |  2 +-
 tests/stacked_overlay_baz.dts               |  2 +-
 15 files changed, 56 insertions(+), 56 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
