From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH] of: Add a GitLab CI config file for unittests
Date: Fri, 30 Nov 2018 16:22:17 -0600
Message-ID: <CAL_JsqKwnzA+e6pbfUCzCX5ZCJAYixjJtDV2Dfh9u-bgOBKYHQ@mail.gmail.com>
References: <20181130203232.5743-1-robh@kernel.org> <CAKMK7uGrBnaip1E+vp6foGfvdRb2=bhPNOmmZfjTUt2HZPLQcA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKMK7uGrBnaip1E+vp6foGfvdRb2=bhPNOmmZfjTUt2HZPLQcA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 30, 2018 at 2:53 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> On Fri, Nov 30, 2018 at 9:32 PM Rob Herring <robh@kernel.org> wrote:
> >
> > This adds a GitLab CI config file running the DT unittest in a usermode
> > Linux build. The corresponding CI job can be found here:
> >
> > https://gitlab.com/robherring/linux-dt-unittest/pipelines
> >
> > This CI job can be duplicated by others by creating a kernel repo on a
> > GitLab instance and configuring GitLab CI to use
> > drivers/of/.gitlab-ci.yml config file.
> >
> > Cc: Frank Rowand <frowand.list@gmail.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Signed-off-by: Rob Herring <robh@kernel.org>
>
> Adding dri-devel.
>
> > ---
> >  drivers/of/.gitlab-ci.yml | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >  create mode 100644 drivers/of/.gitlab-ci.yml
> >
> > diff --git a/drivers/of/.gitlab-ci.yml b/drivers/of/.gitlab-ci.yml
> > new file mode 100644
> > index 000000000000..44a4824f5c33
> > --- /dev/null
> > +++ b/drivers/of/.gitlab-ci.yml
> > @@ -0,0 +1,18 @@
> > +# SPDX-License-Identifier: GPL-2.0+
> > +
> > +image: registry.gitlab.com/robherring/docker-images/ubuntu-kernel-build
>
> I think it's better to include the docker recipe too. One because
> shipping pre-built dockers is a license nightmare, second because
> better hackability. For a full on example see:
>
> https://gitlab.freedesktop.org/drm/igt-gpu-tools/blob/master/.gitlab-ci.yml

Humm, but in the end you are still publishing the docker images either
way. It's just a difference of publishing across projects and whether
it's 2 jobs or 1 job with 2 stages.

I do tend to prefer the Travis-CI simplicity of just listing packages
to install. It seems like the same could be done with docker and some
magic on the server side. At least for the simple case of 'install
this list of packages'.

> For the kernel I guess the question is where we should put all the
> docker files. There's going to be some need for subsystem specific
> tooling (e.g. we want something that has igt installed eventually for
> anything drm), so maybe just keeping them in subsystem directories is
> best. Was at least my plan with drivers/gpu.

My plan (to the extent I have one) was to put the common parts into
the docker image and leave the small job specific things in the job
setup. Then I can use the same docker image across jobs. Maybe that's
a pointless goal in the docker world.

My dockerfile is simple enough, I could probably just create it within
the .gitlab-ci.yml.

Rob
