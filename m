From: "David VomLehn (dvomlehn)" <dvomlehn@cisco.com>
Subject: RE: Device Tree questions WRT MIPS/Octeon SOCs.
Date: Fri, 15 Oct 2010 12:30:48 -0500
Message-ID: <7A9214B0DEB2074FBCA688B30B04400D01B50901@XMB-RCD-208.cisco.com>
References: <4CB79D93.6090500@caviumnetworks.com> <AANLkTi=UM2p26JJMqv-cNh8xACS_KPf_dCst5cgmh5VR@mail.gmail.com> <20101014.191309.515504596.imp@bsdimp.com> <AANLkTi=dqMHa04=-+RjnxuPGL3ZsqNCiaxUPT0VpV6kC@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-mips-bounce@linux-mips.org>
Content-class: urn:content-classes:message
In-Reply-To: <AANLkTi=dqMHa04=-+RjnxuPGL3ZsqNCiaxUPT0VpV6kC@mail.gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Grant Likely <grant.likely@secretlab.ca>, Warner Losh <imp@bsdimp.com>
Cc: ddaney@caviumnetworks.com, prasun.kapoor@caviumnetworks.com, linux-mips@linux-mips.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

If this is really a question of needing to dynamically generate the dev=
ice tree, then you have no choice. It's worth mentioning, though, that =
the device tree compiler (dtc) does have the ability to include files, =
making it easier to create and maintain device trees that are static bu=
t which share devices.

> -----Original Message-----
> From: linux-mips-bounce@linux-mips.org [mailto:linux-mips-bounce@linu=
x-
> mips.org] On Behalf Of Grant Likely
> Sent: Thursday, October 14, 2010 6:29 PM
> To: Warner Losh
> Cc: ddaney@caviumnetworks.com; prasun.kapoor@caviumnetworks.com; linu=
x-
> mips@linux-mips.org; devicetree-discuss@lists.ozlabs.org
> Subject: Re: Device Tree questions WRT MIPS/Octeon SOCs.
>=20
> On Thu, Oct 14, 2010 at 7:13 PM, Warner Losh <imp@bsdimp.com> wrote:
> > In message: <AANLkTi=3DUM2p26JJMqv-
> cNh8xACS_KPf_dCst5cgmh5VR@mail.gmail.com>
> > =A0 =A0 =A0 =A0 =A0 =A0Grant Likely <grant.likely@secretlab.ca> wri=
tes:
> > : Overall the plan makes sense, however I would suggest the
> following.
> > : instead of 'live' modifying the tree, another option is to carry =
a
> set
> > : of 'stock' device trees in the kernel; one per board. =A0Of cours=
e
> this
> > : assumes that your current ad-hoc code is keying on the specific
> board.
> > : =A0If it is interpreting data provided by the firmware, then your
> > : suggestion of modifying a single stock tree probably makes more
> sense,
> > : or possibly a combination of the too. =A0In general you should av=
oid
> > : live modification as much as possible.
> >
> > The one draw back on this is that there's lots of different "stock"
> > boards that the Cavium Octeon SDK supports. =A0These will be diffic=
ult
> > to drag along for every kernel. =A0And they'd be mostly the same to=
,
> > which is why I think that David is suggesting the live modification
> > thing...
>=20
> Okay.  Do what makes the most sense for your platform.
>=20
> g.
