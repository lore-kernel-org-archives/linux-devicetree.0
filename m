From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 07/11] dt-bindings: add bindings for early devices
Date: Tue, 24 Apr 2018 19:30:47 +0200
Message-ID: <20180424173051.15099-8-brgl@bgdev.pl>
References: <20180424173051.15099-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180424173051.15099-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, David Lechner <david@lechnology.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, Frank Rowand <frowand.list@gmail.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arend van Spriel <aspriel@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Michal Suchanek <msuchanek@suse.de>, Jan Kiszka <jan.kiszka@siemens.com>, And
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Add a simple document describing the "earlydev" compatible fallback.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 Documentation/devicetree/bindings/early.txt | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/early.txt

diff --git a/Documentation/devicetree/bindings/early.txt b/Documentation/devicetree/bindings/early.txt
new file mode 100644
index 000000000000..51cbd8630255
--- /dev/null
+++ b/Documentation/devicetree/bindings/early.txt
@@ -0,0 +1,7 @@
+* Early device driver
+
+Certain devices must be initialized early in the boot process. An early
+device node represents such a system component.
+
+Required properties:
+- compatible: Must contain the following fallback: "earlydev"
-- 
2.17.0
