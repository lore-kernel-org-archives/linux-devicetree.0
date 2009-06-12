From: Wolfram Sang <w.sang@pengutronix.de>
Subject: [PATCH 0/2] add OF wrapper for uio-pdrv-genirq
Date: Fri, 12 Jun 2009 02:04:20 +0200
Message-ID: <1244765062-14144-1-git-send-email-w.sang@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
To: linux-kernel@vger.kernel.org
Cc: linuxppc-dev@ozlabs.org, devicetree-discuss@ozlabs.org
List-Id: devicetree@vger.kernel.org

This series adds an OF wrapper for the uio-pdrv-genirq driver.

Patch 1 refactors the platform driver to expose a generic probe-routine.
Patch 2 then adds the OF wrapper. Documentation for the binding is also added.
        There may be an issue with stack-usage, as noted there.

Tested on MPC5200B-based custom boards with 2.6.30.

(Note: this is not meant for the current merge window.)

Thanks,

   Wolfram
