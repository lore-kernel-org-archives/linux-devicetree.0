From: Emil Medve <Emilian.Medve@Freescale.com>
Subject: [PATCH v3 0/4] dt/bindings: Introduce the FSL QorIQ DPAA B/QMan
Date: Wed, 5 Nov 2014 09:18:50 -0600
Message-ID: <1415200734-6978-1-git-send-email-Emilian.Medve@Freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: scottwood@Freescale.com, galak@kernel.crashing.org, corbet@lwn.net, robh+dt@kernel.org, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, pawel.moll@arm.com, mark.rutland@arm.com, grant.likely@linaro.org, Geoff.Thorpe@Freescale.com, linuxppc-dev@ozlabs.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Emil Medve <Emilian.Medve@Freescale.com>
List-Id: devicetree@vger.kernel.org

Outstanding topics:
	- Scott's reserved-memory updates proposal
	- Some LIODN loose ends
	- Private memory sizing

v3: Address feedback from Kumar Gala
	- Move bindings from Documentation/devicetree/bindings/powerpc/fsl to
	  Documentation/devicetree/bindings/soc/fsl to support ARM based SoC(s)
	- Add phandles to link the reserved-memory to the B/QMan nodes to support
	  multiple B/QMan nodes per SoC
	- Better handle acronyms
    Address feedback from Scott Wood
    	- Spelling error
	- Extra phandles to reflect DPAA blocks links to the B/QMan nodes in
	  order to support multiple B/QMan nodes per SoC
	- Add version register(s) information to highlight differences in the
	  programming model
	- Detail LIODN types/usage
	- Update nodes names without a 'reg' property

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

 .../devicetree/bindings/soc/fsl/bman-portals.txt   |  56 +++++++
 Documentation/devicetree/bindings/soc/fsl/bman.txt | 125 ++++++++++++++++
 .../devicetree/bindings/soc/fsl/qman-portals.txt   | 154 +++++++++++++++++++
 Documentation/devicetree/bindings/soc/fsl/qman.txt | 165 +++++++++++++++++++++
 4 files changed, 500 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/bman-portals.txt
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/bman.txt
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/qman-portals.txt
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/qman.txt

-- 
2.1.3

