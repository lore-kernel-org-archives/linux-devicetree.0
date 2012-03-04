From: Michael Walle <michael@walle.cc>
Subject: Re: [PATCH 3/4] ARM: kirkwood: convert rtc-mv to fdt.
Date: Mon, 5 Mar 2012 00:22:11 +0100
Message-ID: <201203050022.12085.michael@walle.cc>
References: <cover.1330625877.git.jason@lakedaemon.net>
 <201203041648.17428.arnd@arndb.de>
 <20120304222710.GT11986@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20120304222710.GT11986@titan.lakedaemon.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jason <jason@lakedaemon.net>
Cc: grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

Am Sonntag 04 M=E4rz 2012, 23:27:10 schrieb Jason:
> On Sun, Mar 04, 2012 at 04:48:17PM +0000, Arnd Bergmann wrote:
> > On Sunday 04 March 2012, Michael Walle wrote:
> > > in my older patch series i flagged all converted devices with two
> > > =

> > > compatibility names. Eg:
> > >        { .compatible =3D "marvell,orion5x-rtc", },
> > >        { .compatible =3D "marvell,kirkwood-rtc", },
> > > =

> > > IMHO marvell,rtc is i little too general, i guess marvell won't have
> > > only one rtc ;)
> > > =

> > > Other opinions?
> > =

> > Being specific is certainly good, and it may also be a good idea to
> > list the first one it's compatible with in the device tree source.
> > =

> > So the device tree for a 88F6281 soc could list
> > =

> > 	compatible =3D "marvell,88f6281-rtc", "marvell,kirkwood-rtc",
> > 	"marvell,orion-rtc";
> =

> I'll go ahead and make this style of change throughout.  I assume
> "marvell,88f6281-rtc" would only be for SoC internal devices?  eg, the spi
> driver wouldn't follow that convention.  I'll see if I can dig up a part
> number on it.

following the filename spi-orion.c i guess it should use 'marvell,orion-spi=
'.

-- =

Michael
