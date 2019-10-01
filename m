From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: dt-bindings: mt8183: add missing
	update" to the asoc tree
Date: Tue,  1 Oct 2019 12:40:51 +0100 (BST)
Message-ID: <20191001114051.293F627429C0@ypsilon.sirena.org.uk>
References: <20190920112320.166052-1-tzungbi@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20190920112320.166052-1-tzungbi@google.com>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, cychiang@google.com, robh+dt@kernel.org, tzungbi@google.com, Mark Brown <broonie@kernel.org>, dgreid@google.com
List-Id: devicetree@vger.kernel.org

The patch

   ASoC: dt-bindings: mt8183: add missing update

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From 7cf2804775f8a388411624b3e768e55d08711e9d Mon Sep 17 00:00:00 2001
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 20 Sep 2019 19:23:20 +0800
Subject: [PATCH] ASoC: dt-bindings: mt8183: add missing update

Headset codec is optional.  Add missing update to DT binding document.

Fixes: a962a809e5e4 ("ASoC: mediatek: mt8183: make headset codec optional")
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
Link: https://lore.kernel.org/r/20190920112320.166052-1-tzungbi@google.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../bindings/sound/mt8183-mt6358-ts3a227-max98357.txt         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt b/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
index d6d5207fa996..17ff3892f439 100644
--- a/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
+++ b/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
@@ -2,9 +2,11 @@ MT8183 with MT6358, TS3A227 and MAX98357 CODECS
 
 Required properties:
 - compatible : "mediatek,mt8183_mt6358_ts3a227_max98357"
-- mediatek,headset-codec: the phandles of ts3a227 codecs
 - mediatek,platform: the phandle of MT8183 ASoC platform
 
+Optional properties:
+- mediatek,headset-codec: the phandles of ts3a227 codecs
+
 Example:
 
 	sound {
-- 
2.20.1
