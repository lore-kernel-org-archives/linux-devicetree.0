From: Tzung-Bi Shih <tzungbi@google.com>
Subject: [PATCH] ASoC: dt-bindings: mt8183: add missing update
Date: Fri, 20 Sep 2019 19:23:20 +0800
Message-ID: <20190920112320.166052-1-tzungbi@google.com>
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
To: broonie@kernel.org
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, cychiang@google.com, tzungbi@google.com, robh+dt@kernel.org, dgreid@google.com
List-Id: devicetree@vger.kernel.org

Headset codec is optional.  Add missing update to DT binding document.

Fixes: a962a809e5e4 ("ASoC: mediatek: mt8183: make headset codec optional")
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
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
2.23.0.351.gc4317032e6-goog
