From: Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH v3 6/6] interconnect: Add OPP table support for interconnects
Date: Fri, 26 Jul 2019 12:08:13 -0700
Message-ID: <CAGETcx_y=6XJi-1YroB3wzMZ9UF1zunqPc4NLhEy0DdHJXYnNQ@mail.gmail.com>
References: <20190703011020.151615-1-saravanak@google.com> <20190703011020.151615-7-saravanak@google.com>
 <fde02417-dc72-acad-727d-452a3ae3cbd0@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fde02417-dc72-acad-727d-452a3ae3cbd0@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Vincent Guittot <vincent.guittot@linaro.org>, "Sweeney, Sean" <seansw@qti.qualcomm.com>, David Dai <daidavid1@codeaurora.org>, Rajendra Nayak <rnayak@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Evan Green <evgreen@chromium.org>, Android Kernel Team <kernel-team@android.com>, Linux PM <linux-pm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 26, 2019 at 9:25 AM Georgi Djakov <georgi.djakov@linaro.org> wrote:
>
> Hi Saravana,
>
> On 7/3/19 04:10, Saravana Kannan wrote:
> > Interconnect paths can have different performance points. Now that OPP
> > framework supports bandwidth OPP tables, add OPP table support for
> > interconnects.
> >
> > Devices can use the interconnect-opp-table DT property to specify OPP
> > tables for interconnect paths. And the driver can obtain the OPP table for
> > an interconnect path by calling icc_get_opp_table().
> >
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > ---
> >  drivers/interconnect/core.c  | 27 ++++++++++++++++++++++++++-
> >  include/linux/interconnect.h |  7 +++++++
> >  2 files changed, 33 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
> > index 871eb4bc4efc..881bac80bc1e 100644
> > --- a/drivers/interconnect/core.c
> > +++ b/drivers/interconnect/core.c
> > @@ -47,6 +47,7 @@ struct icc_req {
> >   */
> >  struct icc_path {
> >       size_t num_nodes;
> > +     struct opp_table *opp_table;
>
> I am a bit worried that these tables might be abused and size of the DT will
> grow with many OPP tables of all existing paths.

A ton of stuff can be abused in downstream code. We can't do anything
about that.

We just need to keep an eye on OPP table abuse in upstream (whether it
frequency or bw OPP).

> >       struct icc_req reqs[];
> >  };
> >
> > @@ -313,7 +314,7 @@ struct icc_path *of_icc_get(struct device *dev, const char *name)
> >  {
> >       struct icc_path *path = ERR_PTR(-EPROBE_DEFER);
> >       struct icc_node *src_node, *dst_node;
> > -     struct device_node *np = NULL;
> > +     struct device_node *np = NULL, *opp_node;
> >       struct of_phandle_args src_args, dst_args;
> >       int idx = 0;
> >       int ret;
> > @@ -381,10 +382,34 @@ struct icc_path *of_icc_get(struct device *dev, const char *name)
> >               dev_err(dev, "%s: invalid path=%ld\n", __func__, PTR_ERR(path));
> >       mutex_unlock(&icc_lock);
> >
> > +     opp_node = of_parse_phandle(np, "interconnect-opp-table", idx);
>
> Can't we figure out if the device OPP table contains bandwidth even without this
> property?
>

Rob pointed out that the property isn't necessary because the device
binding should document which OPP table is used for what. That takes
care of my main concern of how do we know which OPP table is for what
path. So I'm dropping this patch.

-Saravana
