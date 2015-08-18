From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH v3 0/5] improve mtdpart robustness
Date: 18 Aug 2015 15:34:06 -0000
Message-ID: <cover.1439911625.git.hramrach@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Michal Suchanek <hramrach@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello,

this patch series addresses

 - compiling in a mtd partitioning scheme may render a mtd device inacessible
 - ofpart can fail when subnodes of mtd device node exist
     eg. s3c64xx spi controller-data

v3 updates the last patch
  - address possible memory leak
  - use more generic name for partition node

Thanks

Michal

Michal Suchanek (5):
  mtd: mtdpart: add debug prints to partition parser.
  mtd: mtdpart: Do not fail mtd probe when parsing partitions fails.
  mtd: ofpart: update devicetree binding specification
  mtd: ofpart: document the lock flag.
  mtd: ofpart: move ofpart partitions to a dedicated dt node

 .../devicetree/bindings/mtd/partition.txt          | 69 +++++++++++++---------
 drivers/mtd/mtdpart.c                              | 14 ++++-
 drivers/mtd/ofpart.c                               | 63 ++++++++++++++------
 3 files changed, 99 insertions(+), 47 deletions(-)

-- 
2.1.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
