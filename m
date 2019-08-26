From: Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: opp: Introduce opp-peak-kBps and
 opp-avg-kBps bindings
Date: Mon, 26 Aug 2019 13:26:07 -0700
Message-ID: <CAGETcx_vPtPoqtXRmoOuJp9fx10-121YG64rADPh2W=3r8KrDg@mail.gmail.com>
References: <20190807223111.230846-1-saravanak@google.com> <20190807223111.230846-2-saravanak@google.com>
 <20190821203353.GA11783@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190821203353.GA11783@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Georgi Djakov <georgi.djakov@linaro.org>, Vincent Guittot <vincent.guittot@linaro.org>, "Sweeney, Sean" <seansw@qti.qualcomm.com>, David Dai <daidavid1@codeaurora.org>, adharmap@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Evan Green <evgreen@chromium.org>, Android Kernel Team <kernel-team@android.com>, Linux PM <linux-pm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 21, 2019 at 1:33 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed,  7 Aug 2019 15:31:09 -0700, Saravana Kannan wrote:
> > Interconnects often quantify their performance points in terms of
> > bandwidth. So, add opp-peak-kBps (required) and opp-avg-kBps (optional) to
> > allow specifying Bandwidth OPP tables in DT.
> >
> > opp-peak-kBps is a required property that replaces opp-hz for Bandwidth OPP
> > tables.
> >
> > opp-avg-kBps is an optional property that can be used in Bandwidth OPP
> > tables.
> >
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > ---
> >  Documentation/devicetree/bindings/opp/opp.txt     | 15 ++++++++++++---
> >  .../devicetree/bindings/property-units.txt        |  4 ++++
> >  2 files changed, 16 insertions(+), 3 deletions(-)
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks Rob!

-Saravana
