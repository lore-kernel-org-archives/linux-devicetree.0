Return-Path: <SRS0=Vapr=QB=linuxfoundation.org=gregkh@kernel.org>
Date: Fri, 25 Jan 2019 08:18:23 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v10 03/12] peci: Add support for PECI bus driver core
Message-ID: <20190125071823.GC11891@kroah.com>
References: <20190107214136.5256-1-jae.hyun.yoo@linux.intel.com>
 <20190107214136.5256-4-jae.hyun.yoo@linux.intel.com>
 <20190122132047.GA12357@kroah.com>
 <0826ef5c-c919-cdd7-5e2a-fc056d41756e@linux.intel.com>
 <20190124065714.GA28194@kroah.com>
 <c583da6e-341d-80ee-04a9-8988203a65bb@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c583da6e-341d-80ee-04a9-8988203a65bb@linux.intel.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Jonathan Corbet <corbet@lwn.net>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Kishon Vijay Abraham I <kishon@ti.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, "Darrick J . Wong" <darrick.wong@oracle.com>, Eric Sandeen <sandeen@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Wu Hao <hao.wu@intel.com>, Tomohiro Kusumi <kusumi.tomohiro@gmail.com>, "Bryant G . Ly" <bryantly@linux.vnet.ibm.com>, Frederic Barrat <fbarrat@linux.vnet.ibm.com>, "David S . Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, Philippe Ombredanne <pombredanne@nexb.com>, Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, David Kershner <david.kershner@unisys.com>, Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>, Sagar Dharia <sdharia@codeaurora.org>, Johan Hovold <johan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Juergen Gross <jgross@suse.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org, Gavin Schenk <g.schenk@eckelmann.de>, Viresh Kumar <viresh.kumar@linaro.org>, Cyrille Pitchen <cyrille.pitchen@free-electrons.com>, Alan Cox <alan@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Andy Shevchenko <andriy.shevchenko@intel.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Fengguang Wu <fengguang.wu@intel.com>, Jason M Biils <jason.m.bills@linux.intel.com>, Julia Cartwright <juliac@eso.teric.us>, Haiyue Wang <haiyue.wang@linux.intel.com>, James Feist <james.feist@linux.intel.com>, Vernon Mauery <vernon.mauery@linux.intel.com>
List-ID: <devicetree@vger.kernel.org>

On Thu, Jan 24, 2019 at 02:01:10PM -0800, Jae Hyun Yoo wrote:
> On 1/23/2019 10:57 PM, Greg Kroah-Hartman wrote:
> > On Wed, Jan 23, 2019 at 01:38:24PM -0800, Jae Hyun Yoo wrote:
> > > > What about the un-initialized fields in this structure?  Can you
> > > > properly handle that, and also, is this ok to be on the stack?
> > > 
> > > It's fully initialized at here because the peci_ping_msg struct has only
> > > one member:
> > > 
> > > struct peci_ping_msg {
> > > 	__u8 addr;
> > > };
> > 
> > Ok.  But my question about "can you do this off the stack" remains.
> 
> I'll add 3 bytes of dummy padding into this structure. Also, I'll check
> again u32 boundary alignment for all struct defines in peci_ioctl.h.
> Would it be okay to be on stack then?

The issue of being on the stack has nothing to do with alignment, and
everything to do with, "can your controller handle data from the stack".
Lots of busses and controllers can not (i.e. all USB devices), so you
have to properly allocate all memory that is used for data transfers
from areas that are able to do DMA properly (i.e. by using kmalloc).

That is why I asked here about that, if this is a USB driver, having the
data you wish to send from a stack variable is not allowed.  I don't
know how your hardware works, which is why I was asking this.

Note, some architectures (like x86), hide this fact as their stack
memory is able to be DMA, so you do not run into any errors.  Other
arches that Linux supports are not like that, which is why we have those
types of restrictions.

Hope this helps,

greg k-h
