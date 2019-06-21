From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH 0/2] MSM8998 MTP Display
Date: Fri, 21 Jun 2019 11:31:50 -0600
Message-ID: <CAOCk7NoaP=DkNLgdiUw5M0JYRGEGGCFQkn1sCO9dqtexMPC9dQ@mail.gmail.com>
References: <20190614185547.34518-1-jeffrey.l.hugo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190614185547.34518-1-jeffrey.l.hugo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, thierry.reding@gmail.com, sam@ravnborg.org, Bjorn Andersson <bjorn.andersson@linaro.org>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, DTML <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 14, 2019 at 12:55 PM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
>
> Since we are trying to get the GPU and display hardware in the SoC
> supported, it would be nice to be able to put the output on the
> integrated panel for the reference platform.  To do so, we need support
> in the Truly driver to support the specific panel variant for the
> MSM8998 MTP.  This series adds taht support.
>
> Jeffrey Hugo (2):
>   dt-bindings: display: truly: Add MSM8998 MTP panel
>   drm/panel: truly: Add MSM8998 MTP support

Lets actually hold off on this series.  I thought I could solve an
issue in the DSI driver, but thats not working out like how I'd hoped.
I may need to rework this.
