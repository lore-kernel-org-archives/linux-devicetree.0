From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v3 8/8] ARM: dts: rcar-gen2: Remove unused VIN properties
Date: Tue, 5 Jun 2018 10:12:22 +0200
Message-ID: <20180605081222.GL10472@w540>
References: <1527606359-19261-1-git-send-email-jacopo+renesas@jmondi.org>
 <1527606359-19261-9-git-send-email-jacopo+renesas@jmondi.org>
 <20180604122325.GH19674@bigcity.dyn.berto.se>
 <20180605074938.mljwmgpjlplvkp2v@verge.net.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7884403499857249573=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180605074938.mljwmgpjlplvkp2v@verge.net.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Simon Horman <horms@verge.net.au>
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, linux-renesas-soc@vger.kernel.org, hans.verkuil@cisco.com, geert@glider.be, laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com, Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--===============7884403499857249573==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RNRUMt0ZF5Yaq/Aq"
Content-Disposition: inline


--RNRUMt0ZF5Yaq/Aq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Tue, Jun 05, 2018 at 09:49:38AM +0200, Simon Horman wrote:
> On Mon, Jun 04, 2018 at 02:23:25PM +0200, Niklas S=C3=B6derlund wrote:
> > Hi Jacopo,
> >
> > Thanks for your work.
> >
> > On 2018-05-29 17:05:59 +0200, Jacopo Mondi wrote:
> > > The 'bus-width' and 'pclk-sample' properties are not parsed by the VIN
> > > driver and only confuse users. Remove them in all Gen2 SoC that use
> > > them.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >
> > The more I think about this the more I lean towards that this patch
> > should be dropped. The properties accurately describes the hardware and
> > I think there is value in that. That the driver currently don't parse or
> > make use of them don't in my view reduce there value. Maybe you should
> > break out this patch to a separate series?
>
> I also think there is value in describing the hardware not the state of t=
he
> driver at this time.  Is there any missmatch between these properties and
> the bindings?

Niklas and I discussed a bit offline on this yesterday. My main
concern, and sorry for being pedant on this, is that changing those
properties value does not change the interface behaviour, and this
could cause troubles when integrating image sensor not known to be
working on the VIN interface.

This said, the documentation of those (and all other) properties is in the
generic "video-interfaces.txt" file and it is my understanding, but I think
Laurent and Rob agree on this as well from their replies to my previous ser=
ies,
that each driver should list which properties it actually supports, as
some aspects are very implementation specific, like default values and
what happens if the property is not specified [1]. Nonetheless, all
properties describing hardware features and documented in the generic
file should be accepted in DTS, as those aims to be OS-independent and
even independent from the single driver implementation.

A possible middle-ground would be documenting in the VIN device tree
bindings description properties whose values actually affect the VIN
interface configuration and state in bindings that all generic properties
described in 'video-interfaces.txt' are valid ones but if not
explicitly listed there their value won't affect the interface
configuration. Niklas suggested this, and I quite like the fact it
makes clear that, say, changing the 'pclk-sample' property won't
change how the VIN interface would sample data but at the same time
allows for extensive description of the hardware.

Would something like this work in your opinion?

As a consequence, this patch should be dropped as Niklas and you
suggested.

Thanks
   j

[1] Ie. An interface that supports BT.656 encoding will use it if
'hsync-active' and 'vsync-active' are not specified. One that does not
support embedded synchronization would instead use defaults for those
two properties. This is specific to the single interface (or even the
single driver implementation actually) and should be listed in the single
driver's bindings description imo.

--RNRUMt0ZF5Yaq/Aq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbFkXlAAoJEHI0Bo8WoVY8KhcQAJUL6ug4xkvU0gsP/lLtKDPV
hV7G9VpjtOeN4LBpBEjdLb4wxrcsvUv97S8wu5TzGtiwoNwXZOp1+I7fFvP3sJ5h
W57kWkPmYAoKAHJeenNaAk5Lq9wMNg/zqwq7ujE6o+ioqGUH7hirh99H4I220XmW
KCFfvm477tT1OL5y8V6hRXMJPLjYKJ6yA0XABjBfSiHr3cTZhqxSw7stXNeS1yfA
3A6HhrxivRD4YLM2BO5eWS6Ja1/NrFXaOcvESE1DpItJ3CpxJy8rFXkpb02cNw8x
yoRRvSOeY7Aoycs3KCDJFErcSif7CL+pxn4YbmxWMJuXR8vbDjHyhvaMog7qr9jr
ADlqSf7pB3u8G7K8MwZy/P0gaTNfdANAEVRcHaXTLMGQdCCWOsEQQ00Mq95fMIZM
IZL9YVjsLEJByj/I6LDuoM9fABb3Zxb43YVD2fErV29St1pFSGEFl8w20rngcHPy
XXsgCPkEsiR0+2XZsuT+C/gTZf9c4FQWdlaSmyfMNP4EmLHBsTW9r9+FKEhY6tir
KV12XPZSXr5j7zpH0yE1Me0ztpdURTSnDk0om+X+z0Xs74NnAZq5MjLbN0jLqhMq
fKGdLEHRc147xZAx/1U+qo/n0CsuFv+wl7st8UcSgnL/In1BJ+TmHXK2Dyi6zk5G
WScx8jfe/TOYAbbLmfIz
=4MDZ
-----END PGP SIGNATURE-----

--RNRUMt0ZF5Yaq/Aq--


--===============7884403499857249573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7884403499857249573==--
