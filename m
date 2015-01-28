From: Paul Walmsley <paul@pwsan.com>
Subject: [PATCH 01/24] Documentation: DT: document compatible string
 existence requirement
Date: Wed, 28 Jan 2015 16:49:37 -0700
Message-ID: <20150128234936.20644.76672.stgit@dusk.lan>
References: <20150128234935.20644.89300.stgit@dusk.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150128234935.20644.89300.stgit@dusk.lan>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Paul Walmsley <pwalmsley@nvidia.com>, Kumar Gala <galak@codeaurora.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: devicetree@vger.kernel.org


DT maintainers require all compatible strings used in chip or board
DTS file to be previously documented somewhere in
Documentation/devicetree/bindings, per:

http://marc.info/?l=linux-tegra&m=142201349727836&w=2

Document this requirement in the DT patch submission requirements
text file.

Signed-off-by: Paul Walmsley <paul@pwsan.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Paul Walmsley <pwalmsley@nvidia.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 .../devicetree/bindings/submitting-patches.txt     |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/submitting-patches.txt b/Documentation/devicetree/bindings/submitting-patches.txt
index b7ba01ad1426..4b2bbb6047c4 100644
--- a/Documentation/devicetree/bindings/submitting-patches.txt
+++ b/Documentation/devicetree/bindings/submitting-patches.txt
@@ -15,6 +15,14 @@ I. For patch submitters
   3) The Documentation/ portion of the patch should come in the series before
      the code implementing the binding.
 
+  4) Any compatible strings used in a chip or board DTS file must be
+     previously documented in the corresponding DT binding text file
+     in Documentation/devicetree/bindings.  This rule applies even if
+     the Linux device driver does not yet match on the compatible
+     string.  checkpatch will emit warnings if this step is not
+     followed as of commit bff5da4335256513497cc8c79f9a9d1665e09864
+     ("checkpatch: add DT compatible string documentation checks").
+
 II. For kernel maintainers
 
   1) If you aren't comfortable reviewing a given binding, reply to it and ask
