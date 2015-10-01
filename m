From: Rob Herring <robh@kernel.org>
Subject: [PATCH 4/8] dt-bindings: consolidate RNG bindings
Date: Thu,  1 Oct 2015 17:12:30 -0500
Message-ID: <1443737554-10352-5-git-send-email-robh@kernel.org>
References: <1443737554-10352-1-git-send-email-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1443737554-10352-1-git-send-email-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

We have RNG bindings in hwrng/ and rng/. Consolidate them all under rng/.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
---
 Documentation/devicetree/bindings/{hwrng => rng}/atmel-trng.txt        | 0
 Documentation/devicetree/bindings/{hwrng => rng}/brcm,iproc-rng200.txt | 0
 Documentation/devicetree/bindings/{hwrng => rng}/omap_rng.txt          | 0
 Documentation/devicetree/bindings/{hwrng => rng}/timeriomem_rng.txt    | 0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/{hwrng => rng}/atmel-trng.txt (100%)
 rename Documentation/devicetree/bindings/{hwrng => rng}/brcm,iproc-rng200.txt (100%)
 rename Documentation/devicetree/bindings/{hwrng => rng}/omap_rng.txt (100%)
 rename Documentation/devicetree/bindings/{hwrng => rng}/timeriomem_rng.txt (100%)

diff --git a/Documentation/devicetree/bindings/hwrng/atmel-trng.txt b/Documentation/devicetree/bindings/rng/atmel-trng.txt
similarity index 100%
rename from Documentation/devicetree/bindings/hwrng/atmel-trng.txt
rename to Documentation/devicetree/bindings/rng/atmel-trng.txt
diff --git a/Documentation/devicetree/bindings/hwrng/brcm,iproc-rng200.txt b/Documentation/devicetree/bindings/rng/brcm,iproc-rng200.txt
similarity index 100%
rename from Documentation/devicetree/bindings/hwrng/brcm,iproc-rng200.txt
rename to Documentation/devicetree/bindings/rng/brcm,iproc-rng200.txt
diff --git a/Documentation/devicetree/bindings/hwrng/omap_rng.txt b/Documentation/devicetree/bindings/rng/omap_rng.txt
similarity index 100%
rename from Documentation/devicetree/bindings/hwrng/omap_rng.txt
rename to Documentation/devicetree/bindings/rng/omap_rng.txt
diff --git a/Documentation/devicetree/bindings/hwrng/timeriomem_rng.txt b/Documentation/devicetree/bindings/rng/timeriomem_rng.txt
similarity index 100%
rename from Documentation/devicetree/bindings/hwrng/timeriomem_rng.txt
rename to Documentation/devicetree/bindings/rng/timeriomem_rng.txt
-- 
2.1.4
