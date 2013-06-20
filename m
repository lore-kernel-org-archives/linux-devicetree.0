From: "Florian Fainelli" <f.fainelli@gmail.com>
Subject: [PATCH 0/3] ARM: kernel: minor topology/DT clock fixes
Date: Thu, 20 Jun 2013 15:39:03 +0100
Message-ID: <1371739146-32639-1-git-send-email-f.fainelli@gmail.com>
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
To: lorenzo.pieralisi@arm.com
Cc: Florian Fainelli <f.fainelli@gmail.com>, nico@linaro.org, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, grant.likely@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi all,

Following the initial patch:
1371635237-22860-1-git-send-email-f.fainelli@gmail.com

here is a more complete series of fixes to address the clocks/clock-frequency
parsing in the ARM kernel topology code. Note that some in-tree platforms for
which the topology code was enabled will issue the warning from patch 3. This
is done on purpose such that they get a chance to be fixed, either by adding
common clock support, or by adding a valid "clock-frequency" property.

Florian Fainelli (3):
  ARM: kernel: get cpu clock rate from cpu clock node first
  ARM: kernel: downgrade missing clock-frequency from error to warning
  ARM: kernel: document ARM CPUs clocks and clock-frequency properties

 Documentation/devicetree/bindings/arm/cpus.txt |  7 ++++++-
 arch/arm/kernel/topology.c                     | 23 ++++++++++++++++-------
 2 files changed, 22 insertions(+), 8 deletions(-)

-- 
1.8.1.2
