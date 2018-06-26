From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/3] ASoC: add simple-amplifier
Date: Tue, 26 Jun 2018 14:11:25 +0200
Message-ID: <20180626121128.28564-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, =?UTF-8?q?Nicol=C3=B2=20Veronese?= <nicveronese@gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

As discuss here [0], this patchset rename the dio2125 driver to
simple-amplifier in order to make it more discoverable.

The last patch adds simple-audio-amplifier as new compatible

[0]: https://lkml.kernel.org/r/20180625114445.GG9413@sirena.org.uk

Jerome Brunet (3):
  ASoC: simple-amplifier: remame dio2125 documentation
  ASoC: simple-amplifier: rename dio2125 to simple-amplifer
  ASoC: simple-amplifer: add simple-amplifier compatible

 .../devicetree/bindings/sound/dioo,dio2125.txt     | 12 -------
 .../devicetree/bindings/sound/simple-amplifier.txt | 12 +++++++
 sound/soc/codecs/Kconfig                           | 10 +++---
 sound/soc/codecs/Makefile                          |  4 +--
 sound/soc/codecs/{dio2125.c => simple-amplifier.c} | 42 +++++++++++-----------
 5 files changed, 41 insertions(+), 39 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/dioo,dio2125.txt
 create mode 100644 Documentation/devicetree/bindings/sound/simple-amplifier.txt
 rename sound/soc/codecs/{dio2125.c => simple-amplifier.c} (68%)

-- 
2.14.4
