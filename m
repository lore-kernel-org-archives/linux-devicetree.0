From: Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 0/3] clk: keystone: a few TI sci-clk improvements
Date: Tue, 8 Jan 2019 15:30:20 +0200
Message-ID: <1546954223-9738-1-git-send-email-t-kristo@ti.com>
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: sboyd@kernel.org, mturquette@baylibre.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, ssantosh@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

Patch 1 & 2 introduce a new DT flag for parsing the clock data from devicetree
instead of querying everything from firmware. The purpose of this change
is to improve boot time, it can be seen to give ~2s improvement in certain
setups. If adding a new DT flag for this is not acceptable, a kernel command
line parameter could be introduced instead, or even a new Kconfig option.
I voted for the DT flag for now as that seems to be the most versatile
solution.

Patch 3 shortens the kernel registered clock names, currently for am65x
they are of the form:

interconnect@100000:interconnect@28380000:interconnect@42040000:dmsc:clocks:11:1
0

After this patch the same clock name is cut down to:

clocks:11:10

This makes the debugfs interface much more readable in addition to some
memory savings.

-Tero

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
