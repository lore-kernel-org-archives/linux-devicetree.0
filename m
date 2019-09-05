From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH AUTOSEL 4.19 147/167] drm/panel: Add support for Armadeus
 ST0700 Adapt
Date: Thu, 5 Sep 2019 11:03:36 +0200
Message-ID: <20190905090336.GA29020@kroah.com>
References: <20190903162519.7136-1-sashal@kernel.org>
 <20190903162519.7136-147-sashal@kernel.org>
 <CAL_JsqJrwwsp1wjCBnNmx45ZiLTXVY_nCfN6OrJ5o9dLbc+_2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJrwwsp1wjCBnNmx45ZiLTXVY_nCfN6OrJ5o9dLbc+_2w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>, =?iso-8859-1?Q?S=E9bastien?= Szymanski <sebastien.szymanski@armadeus.com>, Sam Ravnborg <sam@ravnborg.org>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 05, 2019 at 09:55:58AM +0100, Rob Herring wrote:
> On Tue, Sep 3, 2019 at 5:31 PM Sasha Levin <sashal@kernel.org> wrote:
> >
> > From: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
> >
> > [ Upstream commit c479450f61c7f1f248c9a54aedacd2a6ca521ff8 ]
> >
> > This patch adds support for the Armadeus ST0700 Adapt. It comes with a
> > Santek ST0700I5Y-RBSLW 7.0" WVGA (800x480) TFT and an adapter board so
> > that it can be connected on the TFT header of Armadeus Dev boards.
> >
> > Cc: stable@vger.kernel.org # v4.19
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Link: https://patchwork.freedesktop.org/patch/msgid/20190507152713.27494-1-sebastien.szymanski@armadeus.com
> > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > ---
> >  .../display/panel/armadeus,st0700-adapt.txt   |  9 ++++++
> >  drivers/gpu/drm/panel/panel-simple.c          | 29 +++++++++++++++++++
> >  2 files changed, 38 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/armadeus,st0700-adapt.txt
> 
> Looks like a new feature, not stable material. Not sure why it got
> tagged for stable.

New device ids/tables are able to be added to stable kernels, since,
well, forever :)

thanks,

greg k-h
