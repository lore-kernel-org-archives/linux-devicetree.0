From: Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH v3 5/6] dt-bindings: interconnect: Add interconnect-opp-table
 property
Date: Mon, 22 Jul 2019 16:43:38 -0700
Message-ID: <CAGETcx-vNdqmt9_OHJnCv661i-B-f6WAvvqsz2H8c_EM+=fNBQ@mail.gmail.com>
References: <20190703011020.151615-1-saravanak@google.com> <20190703011020.151615-6-saravanak@google.com>
 <20190722233927.GA1353@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190722233927.GA1353@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Georgi Djakov <georgi.djakov@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Vincent Guittot <vincent.guittot@linaro.org>, "Sweeney, Sean" <seansw@qti.qualcomm.com>, daidavid1@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Evan Green <evgreen@chromium.org>, Android Kernel Team <kernel-team@android.com>, Linux PM <linux-pm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 22, 2019 at 4:39 PM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Jul 02, 2019 at 06:10:19PM -0700, Saravana Kannan wrote:
> > Add support for listing bandwidth OPP tables for each interconnect path
> > listed using the interconnects property.
> >
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > ---
> >  .../devicetree/bindings/interconnect/interconnect.txt     | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/interconnect/interconnect.txt b/Documentation/devicetree/bindings/interconnect/interconnect.txt
> > index 6f5d23a605b7..fc5b75b76a2c 100644
> > --- a/Documentation/devicetree/bindings/interconnect/interconnect.txt
> > +++ b/Documentation/devicetree/bindings/interconnect/interconnect.txt
> > @@ -55,10 +55,18 @@ interconnect-names : List of interconnect path name strings sorted in the same
> >                        * dma-mem: Path from the device to the main memory of
> >                                   the system
> >
> > +interconnect-opp-table: List of phandles to OPP tables (bandwidth OPP tables)
> > +                     that specify the OPPs for the interconnect paths listed
> > +                     in the interconnects property. This property can only
> > +                     point to OPP tables that belong to the device and are
> > +                     listed in the device's operating-points-v2 property.
> > +
>
> IMO, there's no need for this property. Which OPP is which should be
> defined already as part of the device's binding. That's enough for the
> driver to know which OPP applies to the interconnect.

Sure, I don't mind dropping this.

-Saravana
