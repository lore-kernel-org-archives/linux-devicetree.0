From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH] of: Documentation: Correct return value from of_overlay_fdt_apply
Date: Thu,  4 Apr 2019 15:25:55 +1300
Message-ID: <20190404022555.29382-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: pantelis.antoniou@konsulko.com, frowand.list@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

The return from of_overlay_fdt_apply() just indicates success or fail.
The cookie is returned via reference.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 Documentation/devicetree/overlay-notes.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/overlay-notes.txt b/Documentation/d=
evicetree/overlay-notes.txt
index 725fb8d255c1..62f2003d6205 100644
--- a/Documentation/devicetree/overlay-notes.txt
+++ b/Documentation/devicetree/overlay-notes.txt
@@ -88,7 +88,8 @@ Overlay in-kernel API
 The API is quite easy to use.
=20
 1. Call of_overlay_fdt_apply() to create and apply an overlay changeset.=
 The
-return value is an error or a cookie identifying this overlay.
+return indicates success or failure. A a cookie identifying this overlay=
 is
+returned via reference on success.
=20
 2. Call of_overlay_remove() to remove and cleanup the overlay changeset
 previously created via the call to of_overlay_fdt_apply(). Removal of an
--=20
2.21.0
