From: Emil Medve <Emilian.Medve@Freescale.com>
Subject: [PATCH v2 0/4] dt/bindings: Introduce the FSL B/QMan
Date: Tue, 28 Oct 2014 04:15:47 -0500
Message-ID: <1414487751-31568-1-git-send-email-Emilian.Medve@Freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: scottwood@Freescale.com, galak@kernel.crashing.org, corbet@lwn.net, robh+dt@kernel.org, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, pawel.moll@arm.com, mark.rutland@arm.com, grant.likely@linaro.org, Geoff.Thorpe@Freescale.com, linuxppc-dev@ozlabs.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Emil Medve <Emilian.Medve@Freescale.com>
List-Id: devicetree@vger.kernel.org

v2: Incorporate feedback from Mark Rutland
	- Remove "subject to change" notes
	- Add/document the 'interrupts' properties
	- Make multiple windows 'reg' properties more readable
	- Improve portal description

Emil Medve (4):
  dt/bindings: Introduce the FSL QorIQ DPAA BMan
  dt/bindings: Introduce the FSL QorIQ DPAA BMan portal(s)
  dt/bindings: Introduce the FSL QorIQ DPAA QMan
  dt/bindings: Introduce the FSL QorIQ DPAA QMan portal(s)

 .../bindings/powerpc/fsl/bman-portals.txt          |  52 +++++++
 .../devicetree/bindings/powerpc/fsl/bman.txt       |  95 +++++++++++++
 .../bindings/powerpc/fsl/qman-portals.txt          | 151 +++++++++++++++++++++
 .../devicetree/bindings/powerpc/fsl/qman.txt       | 133 ++++++++++++++++++
 4 files changed, 431 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/powerpc/fsl/bman-portals.txt
 create mode 100644 Documentation/devicetree/bindings/powerpc/fsl/bman.txt
 create mode 100644 Documentation/devicetree/bindings/powerpc/fsl/qman-portals.txt
 create mode 100644 Documentation/devicetree/bindings/powerpc/fsl/qman.txt

-- 
2.1.2

