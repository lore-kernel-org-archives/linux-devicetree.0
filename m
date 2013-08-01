From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v4 2/6] misc: sram: add ability to mark sram sections as
 reserved
Date: Thu, 1 Aug 2013 18:35:21 +0200
Message-ID: <201308011835.22186.heiko@sntech.de>
References: <201307291510.31679.heiko@sntech.de>
 <1375106520.4223.24.camel@pizza.hi.pengutronix.de>
 <CAHCPf3vSQHtRkk-_cs3monHfrF-hVx3vTDt1ctcax_bspXDmsg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAHCPf3vSQHtRkk-_cs3monHfrF-hVx3vTDt1ctcax_bspXDmsg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matt Sealey <neko@bakuhatsu.net>
Cc: Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, Ulrich Prinz <ulrich.prinz@googlemail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Am Montag, 29. Juli 2013, 23:39:45 schrieb Matt Sealey:
> On Mon, Jul 29, 2013 at 9:02 AM, Philipp Zabel <p.zabel@pengutronix.de> =

wrote:
> > Hi Heiko,
> > =

> > Am Montag, den 29.07.2013, 15:12 +0200 schrieb Heiko St=FCbner:
> >> Some SoCs need parts of their sram for special purposes. So while being
> >> part of the peripheral, it should not be part of the genpool
> >> controlling the sram.
> >> =

> >> Therefore add an option mmio-sram-reserved to keep arbitrary portions =
of
> >> the sram from being part of the pool.
> >> =

> >> Suggested-by: Rob Herring <robherring2@gmail.com>
> >> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> >> Tested-by: Ulrich Prinz <ulrich.prinz@googlemail.com>
> >> ---
> >> Philipp: I didn't carry the ack, because the loop changed significantly
> >> again. So if it looks ok, could you re-ack it please?
> > =

> > I'd prefer the first loop to contain the magic and produce a list of
> > useable chunks, instead of a list of reserved blocks. The second loop
> > could then iterate over the array and just call gen_pool_add_virt
> > repeatedly.
> > =

> > regards
> > Philipp
> =

> Agreed, however specifying chunks of memory should probably match the
> format of the standard memory@ node "available" property - mostly
> because it would be the same syntax and definition as defining any
> other chunk of memory, as OpenFirmware and device trees have been
> doing since the dark ages. In this case, why not re-use the
> "available" property name instead of creating a new one? Standard OF
> memory parsing code is then free for you to use to pull the chunks
> out.

Sound interesting, but could you give me a pointer to some sort of docs abo=
ut =

this "available" property in memory nodes?

Documentation/devicetree/booting-without-of.txt seems to be the only file =

describing the memory node at all but only required properties, and not any =

"available" property.

I've found a document  on power.org describing the memory node, but also no=
t =

mentioning any "available" property.

And devicetree.org does not seem to handle the memory node at all.


Thanks for any hints
Heiko
