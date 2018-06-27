From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 1/2] ASoC: tas571x: add tas5707 compatible
Date: Wed, 27 Jun 2018 09:39:36 +0200
Message-ID: <20180627073937.29912-2-jbrunet@baylibre.com>
References: <20180627073937.29912-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20180627073937.29912-1-jbrunet@baylibre.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

Add the tas5707 to the available compatibles of the tas571x driver

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/sound/tas571x.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/tas571x.txt b/Documentation/devicetree/bindings/sound/tas571x.txt
index b4959f10b74b..7c8fd37c2f9e 100644
--- a/Documentation/devicetree/bindings/sound/tas571x.txt
+++ b/Documentation/devicetree/bindings/sound/tas571x.txt
@@ -7,6 +7,7 @@ powerdown (optional).
 Required properties:
 
 - compatible: should be one of the following:
+  - "ti,tas5707"
   - "ti,tas5711",
   - "ti,tas5717",
   - "ti,tas5719",
-- 
2.14.4
