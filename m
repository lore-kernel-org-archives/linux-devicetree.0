From: Philippe Cornu <philippe.cornu-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v1 1/2] dt-bindings/display/panel: otm8009a: Add optional power-supply property
Date: Mon, 5 Feb 2018 10:45:31 +0100
Message-ID: <20180205094532.23547-2-philippe.cornu@st.com>
References: <20180205094532.23547-1-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180205094532.23547-1-philippe.cornu-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Philippe Cornu <philippe.cornu-qxv4g6HH51o@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some boards use a dedicated voltage regulator for this panel.
Add & document this related optional power-supply property.

Signed-off-by: Philippe Cornu <philippe.cornu-qxv4g6HH51o@public.gmane.org>
---
 Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.txt b/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.txt
index 6862028e7b2e..203b03eefb68 100644
--- a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.txt
+++ b/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.txt
@@ -9,6 +9,7 @@ Required properties:
 
 Optional properties:
   - reset-gpios: a GPIO spec for the reset pin (active low).
+  - power-supply: phandle of the regulator that provides the supply voltage.
 
 Example:
 &dsi {
@@ -17,5 +18,6 @@ Example:
 		compatible = "orisetech,otm8009a";
 		reg = <0>;
 		reset-gpios = <&gpioh 7 GPIO_ACTIVE_LOW>;
+		power-supply = <&v1v8>;
 	};
 };
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
