From: Bogdan Togorean <bogdan.togorean@gmail.com>
Subject: [PATCH 0/2] ASoC: adau1977: Add support for micbias in
	DT
Date: Tue, 19 Feb 2019 16:11:37 +0200
Message-ID: <20190219141139.24216-1-bogdan.togorean@gmail.com>
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
To: alsa-devel@alsa-project.org
Cc: devicetree@vger.kernel.org, lars@metafoo.de, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org, tiwai@suse.com, Bogdan Togorean <bogdan.togorean@gmail.com>, broonie@kernel.org
List-Id: devicetree@vger.kernel.org

Currently micbias voltage is set based on platform_data.
If driver is instantiated using DT only default voltage for
micbias is possible.

This patch adds the possibility to specify an optional DT 
property to configure the output voltage for micbias.

Bogdan Togorean (2):
  ASoC: adau1977: Add MICBIAS example in DT bindings
  ASoC: adau1977: Add support for setting MICBIAS via DT

 .../devicetree/bindings/sound/adi,adau1977.txt       |  7 +++++++
 sound/soc/codecs/adau1977.c                          | 12 +++++++-----
 2 files changed, 14 insertions(+), 5 deletions(-)

-- 
2.20.1
