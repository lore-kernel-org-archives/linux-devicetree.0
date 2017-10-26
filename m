From: Ludovic Barre <ludovic.Barre@st.com>
Subject: [PATCH v2 0/3] mtd: spi-nor: stm32-quadspi: fixes
Date: Thu, 26 Oct 2017 17:12:32 +0200
Message-ID: <1509030755-19044-1-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Marek Vasut <marek.vasut@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ludovic Barre <ludovic.barre@st.com>
List-Id: devicetree@vger.kernel.org

From: Ludovic Barre <ludovic.barre@st.com>

This series adds:
-Fix: to avoid compilation warning with older compiler
versions such as gcc-4.6.
This topic has been discussed on 2 threads with Geert and Arnd
https://lkml.org/lkml/2017/9/15/70
https://www.spinics.net/lists/arm-kernel/msg606269.html
-Fix: abort prefetching in memory-mapped mode as soon prefetching
could exceed nor size (not done by fsize limit)
-Change license text and Copyright

Changes v2:
with the right Cyrille's email (wedev4u.fr)

Geert Uytterhoeven (1):
  mtd: spi-nor: stm32-quadspi: Fix uninitialized error return code

Ludovic Barre (2):
  mtd: spi-nor: stm32-quadspi: fix prefetching outside fsize
  mtd: spi-nor: stm32-quadspi: change license text

 drivers/mtd/spi-nor/stm32-quadspi.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

-- 
2.7.4
