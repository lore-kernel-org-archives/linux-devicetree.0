From: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] ARM: mvebu: add Device Tree for the Armada 385 RD board
Date: Fri, 7 Mar 2014 21:42:32 +0000
Message-ID: <20140307214232.795e76b8@alan.etchedpixels.co.uk>
References: <1394107868-26094-1-git-send-email-gregory.clement@free-electrons.com>
 <20140306131429.GJ4780@lunn.ch>
 <5318779C.8030901@free-electrons.com>
 <20140306142117.GL4780@lunn.ch>
 <531886B4.2070002@free-electrons.com>
 <20140306144600.GM4780@lunn.ch>
 <53188B73.4000109@free-electrons.com>
 <53189892.5090502@free-electrons.com>
 <20140306160213.GA4327@arch.cereza> <20140306172339.GP4780@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140306172339.GP4780@lunn.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>, linux-kernel@vger.kernel.org, Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, 6 Mar 2014 18:23:39 +0100
Andrew Lunn <andrew@lunn.ch> wrote:

> > Can't we fix this so the probe order doesn't affect the name?
> > 
> > Is that sane?
> 
> You are not supposed to trust the device name, since probing can
> happen in parallel, on different buses. udev should have rules to name
> the interfaces based on the MAC address. On my Debian system i have:
> 
> /etc/udev/rules.d/70-persistent-net.rules
> 
> So what is important is that the MAC addresses are assigned correctly
> to the device. And DT does that based on MMIO address, so should be
> reliable, independent of probe order.

Remembering of course thats its valid to have one MAC address per system
not per network controller, so this does blow up in certain cases. You
can still use udev rules for most of those cases to identify off some
other property.

Alan
