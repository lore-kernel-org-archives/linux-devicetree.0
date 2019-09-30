From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Subject: [PATCH v2 2/2] dt-bindings: power: reset: gpio-poweroff: Add
 'force-mode' property
Date: Mon, 30 Sep 2019 14:12:53 +0000
Message-ID: <20190930141244.12311-3-oleksandr.suvorov@toradex.com>
References: <20190930141244.12311-1-oleksandr.suvorov@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190930141244.12311-1-oleksandr.suvorov@toradex.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Jamie Lentin <jm@lentin.co.uk>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, Igor Opaniuk <igor.opaniuk@toradex.com>, Oleksandr Suvorov <oleksandr.suvorov@toradex.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Add 'force-mode' property to allow the driver to load even if
someone has registered the pm_power_off hook earlier.

Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>

---

Changes in v2: None

 .../devicetree/bindings/power/reset/gpio-poweroff.txt          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/reset/gpio-poweroff.tx=
t b/Documentation/devicetree/bindings/power/reset/gpio-poweroff.txt
index 3e56c1b34a4c..2056e299a472 100644
--- a/Documentation/devicetree/bindings/power/reset/gpio-poweroff.txt
+++ b/Documentation/devicetree/bindings/power/reset/gpio-poweroff.txt
@@ -31,6 +31,9 @@ Optional properties:
 - inactive-delay-ms: Delay (default 100) to wait after driving gpio inacti=
ve
 - timeout-ms: Time to wait before asserting a WARN_ON(1). If nothing is
               specified, 3000 ms is used.
+- force-mode: Force replacing pm_power_off kernel hook.
+  If this optional property is not specified, the driver will fail to
+  load if someone has registered the pm_power_off hook earlier.
=20
 Examples:
=20
--=20
2.20.1
