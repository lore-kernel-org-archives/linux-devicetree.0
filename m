From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH 0/1] clk: add DT fixed-factor-clock binding support
Date: Wed, 29 Aug 2012 00:53:01 +0200
Message-ID: <1346194382-11405-1-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mike Turquette <mturquette@ti.com>, Rob Herring <rob.herring@calxeda.com>, linux-arm-kernel@lists.infradead.org
Cc: Grant Likely <grant.likely@secretlab.ca>, Gregory CLEMENT <gregory.clement@free-electrons.com>, devicetree-discuss@lists.ozlabs.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Shawn Guo <shawn.guo@freescale.com>
List-Id: devicetree@vger.kernel.org

Hi,

During the port of the clock common framework for the armada 370/XP, I
need to get "fixed-factor-clock" using the device tree. For this need
I add support DT for "fixed-factor-clock" in the same way that the
existing support for "fixed-rate-clock". It turned out that finally I
didn't need it anymore, but as the code was written and tested, here
it is.

Gregory Clement
