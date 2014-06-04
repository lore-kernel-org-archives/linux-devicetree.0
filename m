From: Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH 2/2] ARM: dts: berlin: enable i2c0 and i2c2
Date: Wed, 4 Jun 2014 19:37:01 +0200
Message-ID: <20140604173701.GC12859@kwain>
References: <1401780790-17830-1-git-send-email-antoine.tenart@free-electrons.com>
 <1401780790-17830-3-git-send-email-antoine.tenart@free-electrons.com>
 <20140603080522.GB22742@lunn.ch> <20140604164841.GA12859@kwain>
 <20140604170340.GI6892@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20140604170340.GI6892@lunn.ch>
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
Cc: thomas.petazzoni@free-electrons.com, zmxu@marvell.com, devicetree@vger.kernel.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart@free-electrons.com>, linux-kernel@vger.kernel.org, alexandre.belloni@free-electrons.com, jszhang@marvell.com, linux-arm-kernel@lists.infradead.org, sebastian.hesselbarth@gmail.com
List-Id: devicetree@vger.kernel.org

On Wed, Jun 04, 2014 at 07:03:40PM +0200, Andrew Lunn wrote:
> On Wed, Jun 04, 2014 at 06:48:41PM +0200, Antoine T=E9nart wrote:
> > =

> > On Tue, Jun 03, 2014 at 10:05:22AM +0200, Andrew Lunn wrote:
> > > On Tue, Jun 03, 2014 at 09:33:10AM +0200, Antoine T=E9nart wrote:
> > > > Enable the I2C0 and I2C2 for the Marvell Berlin BG2G DMP. I2C1 and =
I2C3
> > > > are also working on this board, but no devices seemed to be there.
> > > =

> > > Does this mean that IC0 and I2C2 have devices on them? Could you also
> > > add nodes for the devices?
> > =

> > No devices I can add for now. I you prefer we can drop this patch, keep
> > the other one and enable i2c nodes for the BG2Q DMP when they will be
> > needed.
> =

> I was just wondering how you tested it, without having any devices?

I tested with the i2ctools. I could see one device on each bus at the
address it should be. I also tested the pin muxing configurations.

I don't have lots of information on these I2C buses, at least my test
results match what I know.

> Is it that the devices on the bus don't have mainline drivers?

Not with I2C support.

Antoine

-- =

Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
