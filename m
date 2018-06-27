From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH v4 6/6] dt-bindings: media: rcar-vin: Clarify optional
 props
Date: Wed, 27 Jun 2018 07:24:31 +0200
Message-ID: <20180627052431.GO5237@bigcity.dyn.berto.se>
References: <1528813566-17927-1-git-send-email-jacopo+renesas@jmondi.org>
 <1528813566-17927-7-git-send-email-jacopo+renesas@jmondi.org>
 <20180612154553.kgqnqkwv3y6srivg@kekkonen.localdomain>
 <20180613085455.GC4952@w540>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180613085455.GC4952@w540>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: jacopo mondi <jacopo@jmondi.org>
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, linux-renesas-soc@vger.kernel.org, horms@verge.net.au, geert@glider.be, laurent.pinchart@ideasonboard.com, Sakari Ailus <sakari.ailus@linux.intel.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org, hans.verkuil@cisco.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Jacopo, Sakari and Laurent,

Jacopo, thanks for your patch and continued work on resolving this.

On 2018-06-13 10:54:55 +0200, Jacopo Mondi wrote:
> Hi Sakari,
> =

> On Tue, Jun 12, 2018 at 06:45:53PM +0300, Sakari Ailus wrote:
> > Hi Jacopo,
> >
> > On Tue, Jun 12, 2018 at 04:26:06PM +0200, Jacopo Mondi wrote:
> > > Add a note to the R-Car VIN interface bindings to clarify that all
> > > properties listed as generic properties in video-interfaces.txt can
> > > be included in port@0 endpoint, but if not explicitly listed in the
> > > interface bindings documentation, they do not modify it behaviour.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > ---
> > >  Documentation/devicetree/bindings/media/rcar_vin.txt | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/rcar_vin.txt b/D=
ocumentation/devicetree/bindings/media/rcar_vin.txt
> > > index 8130849..03544c7 100644
> > > --- a/Documentation/devicetree/bindings/media/rcar_vin.txt
> > > +++ b/Documentation/devicetree/bindings/media/rcar_vin.txt
> > > @@ -55,6 +55,12 @@ from local SoC CSI-2 receivers (port1) depending o=
n SoC.
> > >        instances that are connected to external pins should have port=
 0.
> > >
> > >        - Optional properties for endpoint nodes of port@0:
> > > +
> > > +        All properties described in [1] and which apply to the selec=
ted
> > > +        media bus type could be optionally listed here to better des=
cribe
> > > +        the current hardware configuration, but only the following o=
nes do
> > > +        actually modify the VIN interface behaviour:
> > > +

I'm not sure the description have to be as explicit to that the =

properties in 'video-interfaces.txt' are not currently used by the =

driver. I find it not relevant which ones are used or not, what is =

important for me is that all properties in 'video-interfaces.txt' which =

can be used to describe the specific bus are valid for the DT =

description.

On a side note, in rcar_vin.txt we have this section describing the Gen2 =

bindings:

  The per-board settings Gen2 platforms:
   - port sub-node describing a single endpoint connected to the vin
     as described in video-interfaces.txt[1]. Only the first one will
     be considered as each vin interface has one input port.

This whole series only deals with documenting the Gen3 optional =

properties and not the Gen2. Maybe with parallel input support for Gen3 =

patches on there way to making it upstream this series should be =

extended to in a good way merge the port@0 optional properties for both =

generations of hardware?

> >
> > I don't think this should be needed. You should only have properties th=
at
> > describe the hardware configuration in a given system.
> >
> =

> There has been quite some debate on this, and please bear with me
> here for re-proposing it: I started by removing properties in some DT
> files for older Renesas board which listed endpoint properties not
> documented in the VIN's bindings and not parsed by the VIN driver [1]
> Niklas (but Simon and Geert seems to agree here) opposed to that
> patch, as those properties where described in 'video-interfaces.txt' and
> even if not parsed by the current driver implementation, they actually
> describe hardware. I rebated that only properties listed in the device
> bindings documentation should actually be used, and having properties
> not parsed by the driver confuses users, which may expect changing
> them modifies the interface configuration, which does not happens at
> the moment.
> =

> This came out as a middle ground from a discussion with Niklas. As
> stated in the cover letter if this patch makes someone uncomfortable, feel
> free to drop it not to hold back the rest of the series which has been
> well received instead.

What I don't agree with and sparked this debate from my side was the =

deletion of properties in dts files which correctly does describe the =

bus but which are not currently parsed by the driver. To me that is =

decreasing the value of the dts. If on the other hand the goal is to =

deprecate a property from the video-interfaces.txt by slowly removing =

them from dts where the driver don't use them I'm all for it. But I =

don't think this is the case here right?

> =

> Thanks
>    j
> =

> [1] https://www.spinics.net/lists/arm-kernel/msg656302.html
> =

> > >          - hsync-active: see [1] for description. Default is active h=
igh.
> > >          - vsync-active: see [1] for description. Default is active h=
igh.
> > >          - data-enable-active: polarity of CLKENB signal, see [1] for
> > > --
> > > 2.7.4
> > >
> >
> > --
> > Sakari Ailus
> > sakari.ailus@linux.intel.com



-- =

Regards,
Niklas S=F6derlund
