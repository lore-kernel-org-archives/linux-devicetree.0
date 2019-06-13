From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/4] ASoC: meson: axg-tdm: i2s format fixups
Date: Thu, 13 Jun 2019 13:42:29 +0200
Message-ID: <20190613114233.21130-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

The patchset fixes a few mistakes regarding the format on the i2s bus
on the Amlogic axg tdm drivers.

Jerome Brunet (4):
  ASoC: meson: axg-tdmin: right_j is not supported
  ASoC: meson: axg-tdmout: right_j is not supported
  ASoC: meson: axg-tdm: fix sample clock inversion
  ASoC: meson: axg-tdm: consistently use SND_SOC_DAIFMT defines

 sound/soc/meson/axg-tdm-interface.c | 4 ++--
 sound/soc/meson/axg-tdm.h           | 2 +-
 sound/soc/meson/axg-tdmin.c         | 1 -
 sound/soc/meson/axg-tdmout.c        | 1 -
 4 files changed, 3 insertions(+), 5 deletions(-)

-- 
2.20.1
