From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH v2 7/9] watchdog: orion: Update device-tree binding
 documentation
Date: Tue, 27 Aug 2013 07:13:13 -0400
Message-ID: <20130827111313.GB19598@titan.lakedaemon.net>
References: <1377295942-5955-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1377295942-5955-8-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130826140843.GI13964@titan.lakedaemon.net>
 <20130827083603.GA2286@localhost> <20130827103907.0030c970@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20130827103907.0030c970@skate>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, swarren@wwwdotorg.org, devicetree@vger.kernel.org, wim@iguana.be, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 27, 2013 at 10:39:07AM +0200, Thomas Petazzoni wrote:
> Dear Ezequiel Garcia,
> 
> On Tue, 27 Aug 2013 05:36:04 -0300, Ezequiel Garcia wrote:
> 
> > > Is there a reason we're going this route over adding a new compatible
> > > string?
> > 
> > Well, it seemed to me that this register splitting was more device-treeish:
> > it prevents you from fixing your driver, adding a new compatible-string,
> > and rebuilding a kernel each time a new SoC appears with a different offset
> > between registers.
> 
> I don't think encoding register offsets in the DT is a good idea. The
> compatible string is here to identify different revisions/versions of
> the same hardware block, and the driver should abstract out the
> details. Otherwise, you'll start encoding bit numbers, mask values, and
> other crazy things in the Device Tree.

Agreed.  DT is for describing how the hardware is wired together on a
specific board.  The compatible strings should tell you which variant of
an IP block you have.  The information you're trying to encode doesn't
belong in the DT, it should be in the driver.

As an added bonus, by doing so, you avoid breaking compatibility. ;-)

thx,

Jason.
