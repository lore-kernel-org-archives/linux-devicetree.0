From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: panel: Add Sharp LD-D5116Z01B
Date: Fri, 5 Jul 2019 12:38:54 -0600
Message-ID: <CAOCk7NoCq0k2rCC4XQm_yLxgQir1bqLwJMGwD1qDCHQJRUEC8g@mail.gmail.com>
References: <20190705165450.329-1-jeffrey.l.hugo@gmail.com>
 <20190705165655.456-1-jeffrey.l.hugo@gmail.com> <20190705172338.GB2788@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190705172338.GB2788@ravnborg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, thierry.reding@gmail.com, Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <bjorn.andersson@linaro.org>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, DTML <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 5, 2019 at 11:23 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Jeffrey.
>
> On Fri, Jul 05, 2019 at 09:56:55AM -0700, Jeffrey Hugo wrote:
> > +     panel: panel {
> > +             compatible = "sharp,ld-d5116z01b";
> > +             power-supply = <&vlcd_3v3>;
> > +             no-hpd
> The binding do not mention no-hpd - but it is part of panel-simple
> binding. Is it included in the example for any special reason?

I just copied (poorly apparently since a ";" is missing) from my
platform's dt.  There is no particular reason the example lists
no-hpd.  I'll drop it in the next rev.
