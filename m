From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 15/41] Documentation: dt: mfd: fix spelling mistakes
Date: Mon, 25 Apr 2016 17:58:30 +0100
Message-ID: <20160425165830.GP2713@dell>
References: <1461543878-3639-1-git-send-email-eric@engestrom.ch>
 <1461543878-3639-16-git-send-email-eric@engestrom.ch>
 <20160425135017.GA8656@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160425135017.GA8656@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Eric Engestrom <eric-op+oiCINJLTt9jDmeYuA0g@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 25 Apr 2016, Rob Herring wrote:

> On Mon, Apr 25, 2016 at 01:24:12AM +0100, Eric Engestrom wrote:
> > Signed-off-by: Eric Engestrom <eric-op+oiCINJLTt9jDmeYuA0g@public.gmane.org>
>=20
> Applied, thanks.

I'd prefer to continue taking these if you don't mind Rob.  It'd limit
on the amount of immutable branch pull requests I have to send/handle.

> > ---
> >  Documentation/devicetree/bindings/mfd/qcom-rpm.txt | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/mfd/qcom-rpm.txt b/D=
ocumentation/devicetree/bindings/mfd/qcom-rpm.txt
> > index 5e97a95..b98b291 100644
> > --- a/Documentation/devicetree/bindings/mfd/qcom-rpm.txt
> > +++ b/Documentation/devicetree/bindings/mfd/qcom-rpm.txt
> > @@ -178,7 +178,7 @@ see regulator.txt - with additional custom prop=
erties described below:
> >  - qcom,force-mode:
> >  	Usage: optional (default if no other qcom,force-mode is specified=
)
> >  	Value type: <u32>
> > -	Defintion: indicates that the regulator should be forced to a
> > +	Definition: indicates that the regulator should be forced to a
> >  		   particular mode, valid values are:
> >  		   QCOM_RPM_FORCE_MODE_NONE - do not force any mode
> >  		   QCOM_RPM_FORCE_MODE_LPM - force into low power mode
> > @@ -204,7 +204,7 @@ see regulator.txt - with additional custom prop=
erties described below:
> >  - qcom,force-mode:
> >  	Usage: optional
> >  	Value type: <u32>
> > -	Defintion: indicates that the regulator should not be forced to a=
ny
> > +	Definition: indicates that the regulator should not be forced to =
any
> >  		   particular mode, valid values are:
> >  		   QCOM_RPM_FORCE_MODE_NONE - do not force any mode
> >  		   QCOM_RPM_FORCE_MODE_LPM - force into low power mode

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
