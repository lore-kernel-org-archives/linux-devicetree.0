From: Kieran Bingham <kieran@ksquared.org.uk>
Subject: [PATCH v2 0/3] dt-bindings: RCar FCP and FDP1 bindings
Date: Thu, 30 Jun 2016 17:50:27 +0100
Message-ID: <1467305430-25660-1-git-send-email-kieran@bingham.xyz>
Return-path: <linux-media-owner@vger.kernel.org>
Sender: linux-media-owner@vger.kernel.org
To: laurent.pinchart@ideasonboard.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kieran@ksquared.org.uk
List-Id: devicetree@vger.kernel.org

This updated series, has collected the Acked and Reviewed tags for the
FCPF binding addition, and adds documention of the optional power-domain
property for the FCP.

Finally the FDP1 bindings have been updated following review from Laurent.

Specifically, this removes the version specific compatibles as we have a
HW version register available to us in the hardware so we can detect at
run-time what device version we are running on.

Kieran Bingham (3):
  dt-bindings: Update Renesas R-Car FCP DT binding
  dt-bindings: Document Renesas R-Car FCP power-domains usage
  dt-bindings: Add Renesas R-Car FDP1 bindings

 .../devicetree/bindings/media/renesas,fcp.txt      |  9 +++++-
 .../devicetree/bindings/media/renesas,fdp1.txt     | 33 ++++++++++++++++++++++
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/renesas,fdp1.txt

-- 
2.7.4
