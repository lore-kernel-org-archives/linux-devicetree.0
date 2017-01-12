From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: Isn't gen3 peripheral bus 32-bit?
Date: Thu, 12 Jan 2017 10:42:54 +0300
Message-ID: <3453a281-7e5b-aca7-ee56-04da8534ae0d@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Artemi Ivanov <artemi.ivanov@cogentembedded.com>, Magnus Damm <magnus.damm@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi

R-Car GEN3 PCIe modules have 32-bit connect to internal AXI bus.

Could please somebody with lowlevel hardware knowledge answer, if this
is PCIe module limitation, or internal bus limitation.

Depending on that, different modification of renesas/r8a779[56].dtsi
files is needed: either
- wrap only pcie nodes into 32-bit sub-node of /soc, or
- turn entire /soc subtree to 32-bit.


Problem I'm trying to solve is related to DMA ranges handling.
Architecture code needs explicit information on DMA range
limitations caused by interconnect. See [1] thread for details.

Nikita

[1] https://www.mail-archive.com/linux-renesas-soc@vger.kernel.org/msg10449.html
