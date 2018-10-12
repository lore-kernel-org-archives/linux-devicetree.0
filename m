From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 2/2] dt-bindings: uniphier: move cache-uniphier.txt to
 vendor directory
Date: Fri, 12 Oct 2018 13:25:24 +0900
Message-ID: <1539318324-4938-2-git-send-email-yamada.masahiro@socionext.com>
References: <1539318324-4938-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1539318324-4938-1-git-send-email-yamada.masahiro@socionext.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, Jassi Brar <jaswinder.singh@linaro.org>, Masami Hiramatsu <mhiramat@kernel.org>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

Now, the Socionext vendor directory is available at
Documentation/devicetree/bindings/arm/socionext/

Move cache-uniphier.txt over to it.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - New patch

 .../devicetree/bindings/arm/{uniphier => socionext}/cache-uniphier.txt    | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/arm/{uniphier => socionext}/cache-uniphier.txt (100%)

diff --git a/Documentation/devicetree/bindings/arm/uniphier/cache-uniphier.txt b/Documentation/devicetree/bindings/arm/socionext/cache-uniphier.txt
similarity index 100%
rename from Documentation/devicetree/bindings/arm/uniphier/cache-uniphier.txt
rename to Documentation/devicetree/bindings/arm/socionext/cache-uniphier.txt
-- 
2.7.4
