From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] soc: qcom: smp2p: Access APCS as mailbox client
Date: Mon, 4 Dec 2017 12:18:21 -0800
Message-ID: <20171204201821.GC28761@minitux>
References: <20171130000040.23681-1-bjorn.andersson@linaro.org>
 <20171201222545.hkp73cuou6aildky@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171201222545.hkp73cuou6aildky@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arun Kumar Neelakantam <aneela-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri 01 Dec 14:25 PST 2017, Rob Herring wrote:

> On Wed, Nov 29, 2017 at 04:00:40PM -0800, Bjorn Andersson wrote:
> > Attempt to acquire the APCS IPC through the mailbox framework and fall
> > back to the old syscon based approach, to allow us to move away from
> > using the syscon.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> > 
> > Changes since v1:
> > - Added dt binding update
> > - Specifies knows_txdone on the mailbox client
> > 
> >  .../devicetree/bindings/soc/qcom/qcom,smp2p.txt    |  8 ++++-
> >  drivers/soc/qcom/Kconfig                           |  1 +
> >  drivers/soc/qcom/smp2p.c                           | 39 ++++++++++++++++++----
> >  3 files changed, 41 insertions(+), 7 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.txt
> > index af9ca37221ce..a35af2dafdad 100644
> > --- a/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.txt
> > +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.txt
> > @@ -17,9 +17,15 @@ processor ID) and a string identifier.
> >  	Value type: <prop-encoded-array>
> >  	Definition: one entry specifying the smp2p notification interrupt
> >  
> > -- qcom,ipc:
> > +- mboxes:
> >  	Usage: required
> >  	Value type: <prop-encoded-array>
> > +	Definition: reference to the associated doorbell in APCS, as described
> > +		    in mailbox/mailbox.txt
> > +
> > +- qcom,ipc:
> > +	Usage: required, unless mboxes is specified
> 
> Is this deprecated as mboxes is required, so it's never present?
> 

Right, this required property "mboxes" replaces the previously required
property "qcom,ipc". This comes from migrating the description of APCS
as a syscon to a mailbox/doorbell.

Regards,
Bjorn

> > +	Value type: <prop-encoded-array>
> >  	Definition: three entries specifying the outgoing ipc bit used for
> >  		    signaling the remote end of the smp2p edge:
> >  		    - phandle to a syscon node representing the apcs registers
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
