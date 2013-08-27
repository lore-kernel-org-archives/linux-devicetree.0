From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH v2 7/9] watchdog: orion: Update device-tree binding
 documentation
Date: Tue, 27 Aug 2013 10:39:07 +0200
Message-ID: <20130827103907.0030c970@skate>
References: <1377295942-5955-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1377295942-5955-8-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130826140843.GI13964@titan.lakedaemon.net>
 <20130827083603.GA2286@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130827083603.GA2286@localhost>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, swarren@wwwdotorg.org, devicetree@vger.kernel.org, wim@iguana.be, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Dear Ezequiel Garcia,

On Tue, 27 Aug 2013 05:36:04 -0300, Ezequiel Garcia wrote:

> > Is there a reason we're going this route over adding a new compatible
> > string?
> 
> Well, it seemed to me that this register splitting was more device-treeish:
> it prevents you from fixing your driver, adding a new compatible-string,
> and rebuilding a kernel each time a new SoC appears with a different offset
> between registers.

I don't think encoding register offsets in the DT is a good idea. The
compatible string is here to identify different revisions/versions of
the same hardware block, and the driver should abstract out the
details. Otherwise, you'll start encoding bit numbers, mask values, and
other crazy things in the Device Tree.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
