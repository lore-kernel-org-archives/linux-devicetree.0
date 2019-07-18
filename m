From: Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: opp: Introduce opp-peak-KBps and
 opp-avg-KBps bindings
Date: Thu, 18 Jul 2019 10:26:13 -0700
Message-ID: <CAGETcx_XtA_-cjU6Ra1Jh4zgWJXBpHY+g_FdWvnFTW84e46D_w@mail.gmail.com>
References: <20190703011020.151615-1-saravanak@google.com> <20190703011020.151615-2-saravanak@google.com>
 <20190717075448.xlyg2ddewlci3abg@vireshk-i7> <CAGETcx-kUM7MqNYowwNAL1Q0bnFzxPEO6yMg0YTkk16=OnPdmg@mail.gmail.com>
 <20190718043558.roi4j6jw5n4zkwky@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190718043558.roi4j6jw5n4zkwky@vireshk-i7>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Vincent Guittot <vincent.guittot@linaro.org>, "Sweeney, Sean" <seansw@qti.qualcomm.com>, daidavid1@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Evan Green <evgreen@chromium.org>, Android Kernel Team <kernel-team@android.com>, Linux PM <linux-pm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 17, 2019 at 9:36 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 17-07-19, 13:29, Saravana Kannan wrote:
> > On Wed, Jul 17, 2019 at 12:54 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > >
> > > On 02-07-19, 18:10, Saravana Kannan wrote:
> > > > Interconnects often quantify their performance points in terms of
> > > > bandwidth. So, add opp-peak-KBps (required) and opp-avg-KBps (optional) to
> > > > allow specifying Bandwidth OPP tables in DT.
> > > >
> > > > opp-peak-KBps is a required property that replace opp-hz for Bandwidth OPP
> > > > tables.
> > > >
> > > > opp-avg-KBps is an optional property that can be used in Bandwidth OPP
> > > > tables.
> > > >
> > > > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/opp/opp.txt | 15 ++++++++++++---
> > > >  1 file changed, 12 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/opp/opp.txt b/Documentation/devicetree/bindings/opp/opp.txt
> > > > index 76b6c79604a5..c869e87caa2a 100644
> > > > --- a/Documentation/devicetree/bindings/opp/opp.txt
> > > > +++ b/Documentation/devicetree/bindings/opp/opp.txt
> > > > @@ -83,9 +83,14 @@ properties.
> > > >
> > > >  Required properties:
> > > >  - opp-hz: Frequency in Hz, expressed as a 64-bit big-endian integer. This is a
> > > > -  required property for all device nodes but devices like power domains. The
> > > > -  power domain nodes must have another (implementation dependent) property which
> > > > -  uniquely identifies the OPP nodes.
> > > > +  required property for all device nodes but for devices like power domains or
> > > > +  bandwidth opp tables. The power domain nodes must have another (implementation
> > > > +  dependent) property which uniquely identifies the OPP nodes. The interconnect
> > > > +  opps are required to have the opp-peak-bw property.
> > >
> > >                                    ??
> >
> > Sorry, what's the question? Was this an accidental email?
>
> Too much smartness is too bad sometimes, sorry about that :)
>
> I placed the ?? right below "opp-peak-bw", there is no property like
> that. You failed to update it :)

Ah, "typo". I'll fix it.

-Saravana
