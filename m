From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH AUTOSEL 4.19 147/167] drm/panel: Add support for Armadeus
 ST0700 Adapt
Date: Thu, 5 Sep 2019 10:15:22 +0100
Message-ID: <CAL_JsqL_MeD_pqZ1Ye2202tKhnqa-tfRhfoprUinh0MGrDr4hA@mail.gmail.com>
References: <20190903162519.7136-1-sashal@kernel.org> <20190903162519.7136-147-sashal@kernel.org>
 <CAL_JsqJrwwsp1wjCBnNmx45ZiLTXVY_nCfN6OrJ5o9dLbc+_2w@mail.gmail.com> <20190905090336.GA29020@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190905090336.GA29020@kroah.com>
Sender: stable-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Sasha Levin <sashal@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>, =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>, Sam Ravnborg <sam@ravnborg.org>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 5, 2019 at 10:03 AM Greg KH <greg@kroah.com> wrote:
>
> On Thu, Sep 05, 2019 at 09:55:58AM +0100, Rob Herring wrote:
> > On Tue, Sep 3, 2019 at 5:31 PM Sasha Levin <sashal@kernel.org> wrote:
> > >
> > > From: S=C3=A9bastien Szymanski <sebastien.szymanski@armadeus.com>
> > >
> > > [ Upstream commit c479450f61c7f1f248c9a54aedacd2a6ca521ff8 ]
> > >
> > > This patch adds support for the Armadeus ST0700 Adapt. It comes with =
a
> > > Santek ST0700I5Y-RBSLW 7.0" WVGA (800x480) TFT and an adapter board s=
o
> > > that it can be connected on the TFT header of Armadeus Dev boards.
> > >
> > > Cc: stable@vger.kernel.org # v4.19
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > Signed-off-by: S=C3=A9bastien Szymanski <sebastien.szymanski@armadeus=
.com>
> > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > > Link: https://patchwork.freedesktop.org/patch/msgid/20190507152713.27=
494-1-sebastien.szymanski@armadeus.com
> > > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > > ---
> > >  .../display/panel/armadeus,st0700-adapt.txt   |  9 ++++++
> > >  drivers/gpu/drm/panel/panel-simple.c          | 29 +++++++++++++++++=
++
> > >  2 files changed, 38 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/display/panel/a=
rmadeus,st0700-adapt.txt
> >
> > Looks like a new feature, not stable material. Not sure why it got
> > tagged for stable.
>
> New device ids/tables are able to be added to stable kernels, since,
> well, forever :)

Yes I know, but I wouldn't put new panels in that category though I
guess it's just data. If we are, then you should be picking up just
about every single commit to panel-simple.c for stable.

Rob
