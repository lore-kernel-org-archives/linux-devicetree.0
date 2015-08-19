From: Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v5 2/5] dt/bindings: add bindings for optee
Date: Wed, 19 Aug 2015 10:40:26 +0200
Message-ID: <1439973629-19505-3-git-send-email-jens.wiklander@linaro.org>
References: <1439973629-19505-1-git-send-email-jens.wiklander@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439973629-19505-1-git-send-email-jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: valentin.manea-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, jean-michel.delorme-qxv4g6HH51o@public.gmane.org, emmanuel.michel-qxv4g6HH51o@public.gmane.org, javier-5MUHepqpBA1BDgjK7y7TUQ@public.gmane.org, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Introduces optee prefix and adds bindings for ARM TrustZone based OP-TEE
implementation.

Signed-off-by: Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/optee/optee.txt     | 17 +++++++++++++++++
 Documentation/devicetree/bindings/vendor-prefixes.txt |  1 +
 2 files changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/optee/optee.txt

diff --git a/Documentation/devicetree/bindings/optee/optee.txt b/Documentation/devicetree/bindings/optee/optee.txt
new file mode 100644
index 0000000..4a6ff10
--- /dev/null
+++ b/Documentation/devicetree/bindings/optee/optee.txt
@@ -0,0 +1,17 @@
+OP-TEE Device Tree Bindings
+
+OP-TEE is a piece of software using hardware features to provide a Trusted
+Execution Environment. The security can be provided with ARM TrustZone, but
+also by virtualization or a separate chip. As there's no single OP-TEE
+vendor we're using "optee" as the first part of compatible property,
+indicating the OP-TEE protocol is used when communicating with the secure
+world.
+
+* OP-TEE based on ARM TrustZone required properties:
+
+- compatible="optee,optee-tz"
+
+Example:
+	optee {
+		compatible="optee,optee-tz";
+	};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 8033919..17c2a7e 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -141,6 +141,7 @@ nvidia	NVIDIA
 nxp	NXP Semiconductors
 onnn	ON Semiconductor Corp.
 opencores	OpenCores.org
+optee	OP-TEE, Open Portable Trusted Execution Environment
 ortustech	Ortus Technology Co., Ltd.
 ovti	OmniVision Technologies
 panasonic	Panasonic Corporation
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
