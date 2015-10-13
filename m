From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH v2 4/5] mfd: arizona: Update DT binding documentation
 for mic detection
Date: Tue, 13 Oct 2015 13:15:30 +0100
Message-ID: <20151013121530.GE8805@ck-lbox>
References: <1443803363-3251-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1443803363-3251-5-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20151013080800.GY17172@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151013080800.GY17172@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 13, 2015 at 09:08:00AM +0100, Lee Jones wrote:
> On Fri, 02 Oct 2015, Charles Keepax wrote:
> 
> > Add additional bindings to allow configuration of the system specific
> > microphone detection settings.
> > 
> > Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/mfd/arizona.txt |   21 +++++++++++++++++++++
> >  include/dt-bindings/mfd/arizona.h                 |    5 +++++
> >  2 files changed, 26 insertions(+), 0 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Documentation/devicetree/bindings/mfd/arizona.txt
> > index a8fee60..b98a11b 100644
> > --- a/Documentation/devicetree/bindings/mfd/arizona.txt
> > +++ b/Documentation/devicetree/bindings/mfd/arizona.txt
> > @@ -73,6 +73,27 @@ Optional properties:
> >      If this node is not mentioned or if the value is unknown, then
> >      headphone detection mode is set to HPDETL.
> >  
> > +  - wlf,micd-software-compare : Use a software comparison to determine mic
> > +    presence
> > +  - wlf,micd-detect-debounce : Additional software microphone detection
> > +    debounce specified in milliseconds.
> > +  - wlf,micd-pol-gpio : GPIO specifier for the GPIO controlling the headset
> > +    polarity if one exists.
> > +  - wlf,micd-bias-start-time : Time allowed for MICBIAS to startup prior to
> > +    performing microphone detection, specified as per the ARIZONA_MICD_TIME_XXX
> > +    defines.
> > +  - wlf,micd-rate : Delay between successive microphone detection measurements,
> > +    specified as per the ARIZONA_MICD_TIME_XXX defines.
> > +  - wlf,micd-dbtime : Microphone detection hardware debounces specified as the
> > +    number of measurements to take, valid values being 2 and 4.
> > +  - wlf,micd-timeout : Timeout for microphone detection, specified in
> > +    milliseconds.
> > +  - wlf,micd-force-micbias : Force MICBIAS continuously on during microphone
> > +    detection.
> > +
> > +  - wlf,gpsw : Settings for the general purpose switch, set as one of the
> > +    ARIZONA_GPSW_XXX defines.
> 
> Where are all of these bindings to be consumed?

In the extcon driver it handles all jack detection in the Arizona
devices.

Thanks,
Charles
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
