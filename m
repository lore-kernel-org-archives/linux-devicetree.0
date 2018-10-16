From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: [PATCH 0/9] staging: bcm2835-audio: Cleanups and upgrades
Date: Tue, 16 Oct 2018 17:02:19 +0200
Message-ID: <20181016150228.16994-1-nsaenzjulienne@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: eric@anholt.net, stefan.wahren@i2se.com, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, tiwai@suse.de, nsaenzjulienne@suse.de
List-Id: devicetree@vger.kernel.org

Hi,

I just received a RPi3B+ and decided to have a go at fixing stuff in
the audio driver:

The first half of the patchset are just random fixes found while reading
the code.

The second half provides devicetree bindings for bcm2835-audio and fixes
the probe sequence so it fails gracefully if VCHIQ isn't there (as per
TODO).

The series was developed on top of linux-next and tested on a RPi2B and
RPi3B+. Sadly I don't have an HDMI monitor with sound so I only tested
the mini jack output.

Thanks,
Nicolas

===

Nicolas Saenz Julienne (9):
  staging: bcm2835-audio: unify FOURCC command definitions
  staging: bcm2835-audio: don't initialize memory twice
  staging: bcm2835-audio: reorder variable declarations & remove trivial
    comments
  staging: bcm2835-audio: use anonymous union in struct vc_audio_msg
  staging: bcm2835-audio: more generic probe function name
  ASoC: dt-bindings: bcm2835-rpi: add onboard audio bindings
  ARM: dts: bcm2835-rpi: add onboard audio device
  staging: vchiq_arm: add function to check if probe was successful
  staging: bcm2835-audio: check for VCHIQ during probe

 .../bindings/sound/brcm,bcm2835-audio.txt     | 15 +++++++
 arch/arm/boot/dts/bcm2835-rpi.dtsi            |  5 +++
 .../vc04_services/bcm2835-audio/bcm2835-pcm.c | 10 +----
 .../bcm2835-audio/bcm2835-vchiq.c             | 39 ++++++++-----------
 .../vc04_services/bcm2835-audio/bcm2835.c     | 30 ++++++++------
 .../bcm2835-audio/vc_vchi_audioserv_defs.h    |  6 ++-
 .../vc04_services/interface/vchi/vchi.h       |  3 ++
 .../interface/vchiq_arm/vchiq_2835_arm.c      |  2 +
 .../interface/vchiq_arm/vchiq_arm.c           | 16 ++++++++
 .../interface/vchiq_arm/vchiq_arm.h           |  1 +
 .../interface/vchiq_arm/vchiq_if.h            |  4 ++
 .../interface/vchiq_arm/vchiq_shim.c          |  7 ++++
 12 files changed, 95 insertions(+), 43 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/brcm,bcm2835-audio.txt

-- 
2.19.1
