From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: Re: [PATCH 14/14] ARM: dts: imx6: make audmux optional for i.MX6UL
 sound driver
Date: Fri, 15 Jan 2016 07:34:31 +0100
Message-ID: <20160115073431.5b31c81c@ipc1.ka-ro>
References: <1452619291-13625-6-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-7-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-8-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-9-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-10-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-11-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-12-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-13-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-14-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-15-git-send-email-LW@KARO-electronics.de>
 <20160115023809.GA3284@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160115023809.GA3284@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

> On Tue, Jan 12, 2016 at 06:21:31PM +0100, Lothar Wa=C3=9Fmann wrote:
> > i.MX6UL does not have the audio multiplexer (AUDMUX) like the other
> > i.MX6 SoCs, but apart from that can use the same audio driver. Make
> > audmux optional for the imx-sgtl5000 driver, so it can be used on
> > i.MX6UL too. Furthermore i.MX6UL requires use of the SAI interface
> > rather than SSI. Change the DTS documentation accordingly.
> >=20
> > The patch with the corresponding changes to the imx-sgtl5000 driver
> > will be sent separately.
> >=20
> > Signed-off-by: Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
> > ---
> >  .../bindings/sound/imx-audio-sgtl5000.txt          | 26 ++++++++++=
+++++++++++-
> >  1 file changed, 25 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/sound/imx-audio-sgtl=
5000.txt b/Documentation/devicetree/bindings/sound/imx-audio-sgtl5000.t=
xt
> > index 2f89db8..fd46671 100644
> > --- a/Documentation/devicetree/bindings/sound/imx-audio-sgtl5000.tx=
t
> > +++ b/Documentation/devicetree/bindings/sound/imx-audio-sgtl5000.tx=
t
> > @@ -6,7 +6,7 @@ Required properties:
> > =20
> >    - model		: The user-visible name of this sound complex
> > =20
> > -  - ssi-controller	: The phandle of the i.MX SSI controller
> > +  - ssi-controller	: The phandle of the i.MX SSI (or SAI) controll=
er
> > =20
> >    - audio-codec		: The phandle of the SGTL5000 audio codec
> > =20
> > @@ -39,6 +39,16 @@ Required properties:
> >  Note: The AUDMUX port numbering should start at 1, which is consis=
tent with
> >  hardware manual.
> > =20
> > +Optional properties:
> > +  - fsl,no-audmux	: boolean
> > +    			  Required for i.MX6UL (and maybe other SoCs)
> > +    			  which don't have an AUDMUX, but still
> > +			  feature the same audio subsystem otherwise.
>=20
> It would have been better if this was a phandle to the audmux and lac=
k=20
> of the property meant no audmux. Too late for that I guess.
>=20
That would mean, that all existing dtbs would have to be changed, and
older DTBs with newer kernels wouldn't work.

But this patch is obsolete anyway. The simple-card driver can be used
instead of the imx-audio-sgtl5000 as Mark Brown suggested in
<20160112182253.GD6588-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>. I'll post an updated patch serie=
s soon.


Lothar Wa=C3=9Fmann
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
