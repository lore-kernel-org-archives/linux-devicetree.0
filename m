From: <Eugen.Hristev@microchip.com>
Subject: [PATCH v2 1/3] dt-bindings: add vendor prefix for PDA Precision
 Design Associates, Inc.
Date: Mon, 14 Jan 2019 09:43:26 +0000
Message-ID: <1547458584-29548-2-git-send-email-eugen.hristev@microchip.com>
References: <1547458584-29548-1-git-send-email-eugen.hristev@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1547458584-29548-1-git-send-email-eugen.hristev@microchip.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, thierry.reding@gmail.com, airlied@linux.ie, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Nicolas.Ferre@microchip.com
Cc: Eugen.Hristev@microchip.com, Cristian.Birsan@microchip.com
List-Id: devicetree@vger.kernel.org

From: Eugen Hristev <eugen.hristev@microchip.com>

Precision Design Associates, Inc. (PDA) manufactures standard and custom
capacitive touch screens, LCD's embedded controllers and custom embedded
software. They specialize in industrial, rugged and outdoor applications.
Website: http://www.pdaatl.com/

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Docume=
ntation/devicetree/bindings/vendor-prefixes.txt
index 3895085..967a670 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -297,6 +297,7 @@ ovti	OmniVision Technologies
 oxsemi	Oxford Semiconductor, Ltd.
 panasonic	Panasonic Corporation
 parade	Parade Technologies Inc.
+pda	Precision Design Associates, Inc.
 pericom	Pericom Technology Inc.
 pervasive	Pervasive Displays, Inc.
 phicomm PHICOMM Co., Ltd.
--=20
2.7.4
