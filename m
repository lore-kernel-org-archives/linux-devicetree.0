From: thesven73@gmail.com
Subject: [PATCH] dt-bindings: anybus-controller: move to staging/ tree
Date: Sun,  8 Sep 2019 09:48:05 -0400
Message-ID: <20190908134805.30957-1-TheSven73@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org, Sven Van Asbroeck <TheSven73@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

From: Sven Van Asbroeck <TheSven73@gmail.com>

The devicetree bindings for anybus-controller were mistakenly
merged into the main Linux tree. Its driver resides in
staging/, so the bindings belong in staging/ too.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Fixes: 20a980e957bf ("dt-bindings: anybus-controller: document devicetree binding")
Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
---
 .../devicetree/bindings/fieldbus/arcx,anybus-controller.txt       | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {Documentation => drivers/staging/fieldbus/Documentation}/devicetree/bindings/fieldbus/arcx,anybus-controller.txt (100%)

diff --git a/Documentation/devicetree/bindings/fieldbus/arcx,anybus-controller.txt b/drivers/staging/fieldbus/Documentation/devicetree/bindings/fieldbus/arcx,anybus-controller.txt
similarity index 100%
rename from Documentation/devicetree/bindings/fieldbus/arcx,anybus-controller.txt
rename to drivers/staging/fieldbus/Documentation/devicetree/bindings/fieldbus/arcx,anybus-controller.txt
-- 
2.17.1
