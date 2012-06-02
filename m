From: Florian Fainelli <florian@openwrt.org>
Subject: ARM PCI controller registration and representation using device tree?
Date: Sat, 02 Jun 2012 16:18:11 +0200
Message-ID: <4113992.BTnO0ZYQON@bender>
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
To: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, Stephen Warren <swarren@wwwdotorg.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

Hi,

I was wondering if anyone had started working on representing the various PCI 
controllers found on SoCs to a device tree representation?

It seems like quite some generic code could be borrowed from PowerPC, 
especially the parsing of the PCI ranges, though I don't see ARM directly 
exposing a struct pci_controller to easily allow that.

Any thoughts about this?

Thanks.
-- 
Florian
