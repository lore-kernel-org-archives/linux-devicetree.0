From: Daniel Baluta <daniel.baluta@nxp.com>
Subject: [RFC PATCH 0/2] Introduce for-dpcm DT property
Date: Sun, 13 Oct 2019 22:00:12 +0300
Message-ID: <20191013190014.32138-1-daniel.baluta@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: perex@perex.cz, tiwai@suse.com, broonie@kernel.org, kuninori.morimoto.gx@renesas.com
Cc: lgirdwood@gmail.com, robh+dt@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-imx@nxp.com, Daniel Baluta <daniel.baluta@nxp.com>
List-Id: devicetree@vger.kernel.org

We need to be able to create DPCM links even if we have a single CPU DAI
or just a dummy CPU DAI.

Daniel Baluta (2):
  ASoC: simple-card: Introduce force-dpcm DT property
  ASoC: simple-card: Add documentation for force-dpcm property

 .../devicetree/bindings/sound/simple-card.txt |  1 +
 include/sound/simple_card_utils.h             |  4 +++
 sound/soc/generic/simple-card-utils.c         | 17 +++++++++++++
 sound/soc/generic/simple-card.c               | 25 +++++++++++++++++--
 4 files changed, 45 insertions(+), 2 deletions(-)

-- 
2.17.1
