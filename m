From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 2/2] ARM: dts: berlin: enable i2c0 and i2c2
Date: Wed, 4 Jun 2014 19:03:40 +0200
Message-ID: <20140604170340.GI6892@lunn.ch>
References: <1401780790-17830-1-git-send-email-antoine.tenart@free-electrons.com>
 <1401780790-17830-3-git-send-email-antoine.tenart@free-electrons.com>
 <20140603080522.GB22742@lunn.ch> <20140604164841.GA12859@kwain>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20140604164841.GA12859@kwain>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart@free-electrons.com>
Cc: thomas.petazzoni@free-electrons.com, Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, zmxu@marvell.com, alexandre.belloni@free-electrons.com, jszhang@marvell.com, linux-arm-kernel@lists.infradead.org, sebastian.hesselbarth@gmail.com
List-Id: devicetree@vger.kernel.org

On Wed, Jun 04, 2014 at 06:48:41PM +0200, Antoine T=E9nart wrote:
> Hi Andrew,
> =

> On Tue, Jun 03, 2014 at 10:05:22AM +0200, Andrew Lunn wrote:
> > On Tue, Jun 03, 2014 at 09:33:10AM +0200, Antoine T=E9nart wrote:
> > > Enable the I2C0 and I2C2 for the Marvell Berlin BG2G DMP. I2C1 and I2=
C3
> > > are also working on this board, but no devices seemed to be there.
> > =

> > Does this mean that IC0 and I2C2 have devices on them? Could you also
> > add nodes for the devices?
> =

> No devices I can add for now. I you prefer we can drop this patch, keep
> the other one and enable i2c nodes for the BG2Q DMP when they will be
> needed.

Hi Antoine

I was just wondering how you tested it, without having any devices?
Is it that the devices on the bus don't have mainline drivers?

I don't see a reason not to commit both. At least it allows i2c-detect
to work and see what is on the bus, even if we cannot drive them.

Thanks
	Andrew
