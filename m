From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH v2 0/2] Add Sharp panel option for Lenovo Miix 630
Date: Fri, 26 Jul 2019 08:31:15 -0600
Message-ID: <CAOCk7NqU7G-afjHwTnQxqrRFcH9=kqDJAUABPHuwRWsdm6xENQ@mail.gmail.com>
References: <20190708165647.46224-1-jeffrey.l.hugo@gmail.com> <20190726123625.GA17037@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190726123625.GA17037@ravnborg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, thierry.reding@gmail.com, Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <bjorn.andersson@linaro.org>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, DTML <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 26, 2019 at 6:36 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Jeffrey.
>
> On Mon, Jul 08, 2019 at 09:56:47AM -0700, Jeffrey Hugo wrote:
> > The Lenovo Miix 630 laptop can be found with one of two panels - a BOE
> > or Sharp option.  This likely provides options during manufacturing.
> >
> > These panels connect via eDP, however they sit behind a DSI to eDP
> > bridge on the laptop, so they can easily be handled by the existing
> > simple panel code.
> >
> > This series adds support for the Sharp option.
> >
> > v2:
> > -removed no-hpd from dt example
> > -added .bus_format and .bus_flags fields based on reviews
> > -added .flags after Bjorn pointed me to something I missed
> > -added Sam's reviewed-by tags
> >
> > Jeffrey Hugo (2):
> >   dt-bindings: panel: Add Sharp LD-D5116Z01B
> >   drm/panel: simple: Add support for Sharp LD-D5116Z01B panel
>
> Thanks.
> Both patches applied and pushed to drm-misc-next.

Excellent.  Thanks

> Are you up to a little janitorial work?
> Today the preferred format for bindings files are the new yaml format.
> Could you update 'your' file, and maybe the other sharp files too?

I confess I haven't yet familiarized myself with the yaml format yet,
but I'll take a look and do an update once I understand the
requirements.
