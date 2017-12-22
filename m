From: =?iso-8859-1?Q?T=FCrk=2C_Jan?= <Jan.Tuerk-BU0Y/NROKIiELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH v2 1/5] drm/panel: Add support for the EDT ETM0700G0BDH6
Date: Fri, 22 Dec 2017 11:43:20 +0100
Message-ID: <95F51F4B902CAC40AF459205F6322F01B7FDFECC3D@BMK019S01.emtrion.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: de-DE
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Rob Herring' <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, =?iso-8859-1?Q?Andreas_F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, SZ Lin <sz.lin-D4fb9hXD9d4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LinuxArmKernelMailingListe <linux-arm-kern>
List-Id: devicetree@vger.kernel.org

> Von: Rob Herring [mailto:robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> Gesendet: Freitag, 22. Dezember 2017 00:00
> Betreff: Re: [PATCH v2 1/5] drm/panel: Add support for the EDT
> ETM0700G0BDH6
> 
> On Wed, Dec 20, 2017 at 02:47:01PM +0100, jan.tuerk-BU0Y/NROKIhBDgjK7y7TUQ@public.gmane.org wrote:
> > From: Jan Tuerk <jan.tuerk-BU0Y/NROKIhBDgjK7y7TUQ@public.gmane.org>
> >
> > The Emerging Display Technology ETM0700G0BDH6 is exactly the same
> > display as the ETM0700G0DH6, exept the pixelclock polarity. Therefore
> > re-use the ETM0700G0DH6 modes. It is used by default on emtrion Avari
> > based development kits.
> 
> As I asked on v1, why not document the panels together in a single doc?

As denoted in the cover letter:
>The documentation for the EDT display is kept as an extra file currently,
>as it is done by the most displays in the documentation. Also a new 
>new Variant of the EDT already arrived. So merging their documentations
>should be discussed separately.

I think it will be even a little tricky to find a matching filename for both versions,
as the recent ones adding an extra character in the description. Are you expecting sth. 
like edt,etm0700series.txt?

> 
> >
> > Signed-off-by: Jan Tuerk <jan.tuerk-BU0Y/NROKIhBDgjK7y7TUQ@public.gmane.org>
> > ---
> >  .../bindings/display/panel/edt,etm0700g0bdh6.txt          |  9 +++++++++
> >  drivers/gpu/drm/panel/panel-simple.c                      | 15 +++++++++++++++
> >  2 files changed, 24 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/panel/edt,etm0700g0bdh6.txt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
