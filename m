From: Ian Campbell <ijc@hellion.org.uk>
Subject: Re: [PATCH 4/7 v4] ARM: kirkwood: add dreamplug (fdt) support.
Date: Thu, 05 Apr 2012 23:07:36 +0100
Message-ID: <1333663656.12209.62.camel@dagon.hellion.org.uk>
References: <cover.1331601448.git.jason@lakedaemon.net>
 <0032addd7e94c5d4d1a3a0be77fe79bcffee53db.1331601448.git.jason@lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <0032addd7e94c5d4d1a3a0be77fe79bcffee53db.1331601448.git.jason@lakedaemon.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jason Cooper <jason@lakedaemon.net>
Cc: nicolas.pitre@linaro.org, andrew@lunn.ch, arnd@arndb.de, jm@lentin.co.uk, grant.likely@secretlab.ca, michael@walle.cc, olof@lixom.net, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, 2012-03-13 at 01:57 +0000, Jason Cooper wrote:
> +DT_MACHINE_START(KIRKWOOD_DT, "Marvell Kirkwood (Flattened Device Tree)") 

This ends up as Machine: in /proc/cpuinfo, which seems to be normal?

Would it be worth trying to dynamically modify the machine string based
on the actual hardware the kernel is running on?

Ian.
-- 
Ian Campbell


Genius is ten percent inspiration and fifty percent capital gains.
