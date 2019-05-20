MIME-Version: 1.0
Date: Mon, 20 May 2019 13:14:58 -0500
References: <20190219002706.20077-1-festevam@gmail.com>
	<20190423110336.GB23448@ulmo>
	<CAOMZO5C4YKcUGJ9wDJHQE04278Cr6ujYnYwPs-yhCyKumbruqg@mail.gmail.com>
	<20190520162212.GA22833@ulmo>
In-Reply-To: <20190520162212.GA22833@ulmo>
Message-ID: <CAL_JsqJtvyFS9owdnE=v0sK1d33gbnqORyQxdnq3Vrs35ZutLw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: Add vendor prefix for VXT Ltd
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, DRI mailing list <dri-devel@lists.freedesktop.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Otavio Salvador <otavio.salvador@ossystems.com.br>, John Weber <john.weber@technexion.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, May 20, 2019 at 11:22 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Mon, May 20, 2019 at 11:15:05AM -0300, Fabio Estevam wrote:
> > On Tue, Apr 23, 2019 at 8:03 AM Thierry Reding <thierry.reding@gmail.com> wrote:
> > >
> > > On Mon, Feb 18, 2019 at 09:27:04PM -0300, Fabio Estevam wrote:
> > > > VXT Ltd is a manufacturer of projected capacitive touch panel
> > > > and display solutions: http://www.vxt.com.tw/
> > > >
> > > > Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>
> > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > > Signed-off-by: Fabio Estevam <festevam@gmail.com>
> > > > ---
> > > > Changes since v1:
> > > > - None
> > > >
> > > >  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
> > > >  1 file changed, 1 insertion(+)
> > >
> > > Applied all three patches, thanks.
> >
> > I don't see any of these patches applied in linux-next nor 5.2-rc1.
> >
> > What is the issue here?
>
> The patch is in drm-misc-next and should show up in linux-next tomorrow.
>
> My understanding is that somebody needs to push drm-misc-next after each
> -rc1 release before drm-misc-next feeds into linux-next. Chances of that
> happening between -rc1 and the linux-next release the day after are
> fairly small.
>
> Thierry
