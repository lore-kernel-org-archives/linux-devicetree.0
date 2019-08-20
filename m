From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v3] dt-bindings: arm: Convert Actions Semi bindings to
 jsonschema
Date: Tue, 20 Aug 2019 21:36:41 +0530
Message-ID: <20190820160641.GA9262@Mani-XPS-13-9360>
References: <20190517153223.7650-1-robh@kernel.org>
 <20190613224435.GA32572@bogus>
 <20190614170450.GA29654@Mani-XPS-13-9360>
 <5946467c-7674-de2b-a657-627cf3be42df@suse.de>
 <CAL_JsqJoQDkqZO_4XdaQymVW0cJDXVmAPh3uieRkBjoUXeWE1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJoQDkqZO_4XdaQymVW0cJDXVmAPh3uieRkBjoUXeWE1w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: Rob Herring <robh@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 14, 2019 at 01:33:47PM -0600, Rob Herring wrote:
> On Fri, Jun 14, 2019 at 11:07 AM Andreas Färber <afaerber@suse.de> wrote:
> >
> > Am 14.06.19 um 19:04 schrieb Manivannan Sadhasivam:
> > > On Thu, Jun 13, 2019 at 04:44:35PM -0600, Rob Herring wrote:
> > >> On Fri, May 17, 2019 at 10:32:23AM -0500, Rob Herring wrote:
> > >>> Convert Actions Semi SoC bindings to DT schema format using json-schema.
> > >>>
> > >>> Cc: "Andreas Färber" <afaerber@suse.de>
> > >>> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > >>> Cc: Mark Rutland <mark.rutland@arm.com>
> > >>> Cc: linux-arm-kernel@lists.infradead.org
> > >>> Cc: devicetree@vger.kernel.org
> > >>> Signed-off-by: Rob Herring <robh@kernel.org>
> > >>> ---
> > >>> v3:
> > >>> - update MAINTAINERS
> > >>>
> > >>>  .../devicetree/bindings/arm/actions.txt       | 56 -------------------
> > >>>  .../devicetree/bindings/arm/actions.yaml      | 38 +++++++++++++
> > >>>  MAINTAINERS                                   |  2 +-
> > >>>  3 files changed, 39 insertions(+), 57 deletions(-)
> > >>>  delete mode 100644 Documentation/devicetree/bindings/arm/actions.txt
> > >>>  create mode 100644 Documentation/devicetree/bindings/arm/actions.yaml
> > >>
> > >> Ping. Please apply or modify this how you'd prefer. I'm not going to
> > >> keep respinning this.
> > >>
> > >
> > > Sorry for that Rob.
> >
> > Well, it was simply not clear whether we were supposed to or not. :)
> 
> I thought 'To' you and a single patch should be clear enough.
> 
> > > Andreas, are you going to take this patch? Else I'll pick it up (If you
> > > want me to do the PR for next cycle)
> >
> > I had checked that all previous changes to the .txt file were by myself,
> > so I would prefer if we not license it under GPLv2-only but under the
> > same dual-license (MIT/GPLv2+) as the DTs. That modification would need
> > Rob's approval then.
> 
> That's fine and dual license is preferred. Can you adjust that when
> applying. Note that the preference for schema is (GPL-2.0 OR
> BSD-2-Clause), but MIT/GPLv2+ is fine by me.

Andreas, are you going to take this patch? Else, we can ask Rob to take
this through his tree as we don't have any queued patches for v5.4 yet.

Thanks,
Mani

> 
> Rob
