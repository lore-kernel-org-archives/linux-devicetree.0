From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH v2 2/5] extcon: arizona: Add basic microphone detection
	DT/ACPI bindings
Date: Fri, 19 Jun 2015 12:59:17 +0100
Message-ID: <20150619115917.GZ32730@opensource.wolfsonmicro.com>
References: <1434638631-16451-1-git-send-email-ckeepax@opensource.wolfsonmicro.com> <1434638631-16451-3-git-send-email-ckeepax@opensource.wolfsonmicro.com> <CAGTfZH0uds0swf-x0naTJeMRvOB6DkekdmSSGWA5KpNCWVOWZw@mail.gmail.com> <20150619081737.GS32730@opensource.wolfsonmicro.com> <CAGTfZH1a6H4Virm-mZDeOD9Pt5M-Q13xo7v+bQwBguJuy1AJXg@mail.gmail.com> <20150619090839.GT32730@opensource.wolfsonmicro.com> <CAGTfZH19cvcb2PXn69pZY-JpkaOYsCsJC1rrQWy06eNav=+VuA@mail.gmail.com> <20150619104453.GX32730@opensource.wolfsonmicro.com> <CAGTfZH2OpzWR_VQrkCVPD+NKf4+D8e4TytsSeek+kDk2BQH_yQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGTfZH2OpzWR_VQrkCVPD+NKf4+D8e4TytsSeek+kDk2BQH_yQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 19, 2015 at 08:03:37PM +0900, Chanwoo Choi wrote:
> On Fri, Jun 19, 2015 at 7:44 PM, Charles Keepax
> <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
> > On Fri, Jun 19, 2015 at 07:31:49PM +0900, Chanwoo Choi wrote:
> >> On Fri, Jun 19, 2015 at 6:08 PM, Charles Keepax
> >> <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
> >> > On Fri, Jun 19, 2015 at 05:28:11PM +0900, Chanwoo Choi wrote:
> >> >> On Fri, Jun 19, 2015 at 5:17 PM, Charles Keepax
> >> >> <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
> >> >> > On Fri, Jun 19, 2015 at 11:25:57AM +0900, Chanwoo Choi wrote:
> >> >> >> Hi Charles,
> >> >> >>
> >> >> >> On Thu, Jun 18, 2015 at 11:43 PM, Charles Keepax
> >> >> >> <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
> >> >> >> > This patch adds bindings for the basic microphone detection platform
> >> >> >> > data.
> >> >> >> >
> >> >> >> > Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> >> >> >> > ---
> >> >> >> > +       dbtime = 0;
> >> >> >> > +       device_property_read_u32(arizona->dev, "wlf,micd-dbtime", &dbtime);
> >> >> >> > +       switch (dbtime) {
> >> >> >> > +       case 2:
> >> >> >>
> >> >> >> I'd like you to define the constant variable for specific integer
> >> >> >> value to improve the readability.
> >> >> >> e.g.,
> >> >> >>
> >> >> >> #define MICD_DBTIME_XXX 2
> >> >> >> #define MICD_DBTIME_XXX 4
> >> >> >>
> >> >> >> > +               pdata->micd_dbtime = 0x10000;
> >> >> >>
> >> >> >> Also, you better to define the constant variable for "0x10000" to
> >> >> >> improbe readability in the include/linux/mfd/arizona.h. If you just
> >> >> >> use the hex value, the other developer cannot analyze the meaning of
> >> >> >> "0x10000".
> >> >> >>
> >> >> >> > +               break;
> >> >> >> > +       case 4:
> >> >> >>
> >> >> >> ditto.
> >> >> >>
> >> >> >
> >> >> > I am not sure these two really warrant a define the number in DT
> >> >> > indicates the number of debounces to perform.
> >> >> >
> >> >> > #define MICD_DBTIME_TWO 2
> >> >>
> >> >> No. I mean that you should define the appropriate name of definition
> >> >> to indicate the meaning of 2 or 4. Just not 2 -> TWO.
> >> >>
> >> >> 2 is 2 second? or 2 is milli-second? or Is there any other meaning?
> >> >> I can never know the meaning of '2' without any description and any
> >> >> proper name of definition.
> >> >
> >> > It is literally two, two debounces, I really can't see what I
> >> > could call the define. What do you think to the idea I suggested
> >> > to rename the variable dbtime -> num_debounces?
> >>
> >> Is it either "debounce time" or "the number of debounce"?
> >>
> >> Also,
> >>
> >> When extcon-arizona driver update the bit for micd_dbtime, use the
> >> ARIZONA_MICD_DBTIME_MASK (0x0002).
> >>
> >> In following case, 0x10000 is larger than ARIZONA_MICD_DBTIME_MASK(0x0002).
> >>
> >>           case 2:
> >>                 pdata->micd_dbtime = 0x10000;
> >>
> >> Is it correct?
> >>
> >> I thinkt that "arizona->pdata.micd_dbtime <<
> >> ARIZONA_MICD_DBTIME_SHIFT" value should be included in the range of
> >> ARIZONA_MICD_DBTIME_MASK(0x0002).
> >
> > Basically this boils down to setting a single bit which chooses
> > between 2 and 4 debounces. The tricky thing is that the default
> > value for the pdata will be 0, and the value of the bit for 2
> > debounces will be 0. So inorder to show we have intentionally set
> > the pdata we set a value that is non-zero but won't get written
> > into the register. It is a little awkward but I don't want to
> > change how the pdata works as there are probably systems out of
> > tree that use it.
> 
> This method cause the poor readabilidy of extcon-arizona.c.
> If you don't explain this complicated reason of this code, me and
> other developer will never understand the meaning of this code.
> 
> I don't agree your suggestion. you need other way.

Well alright if you are sure, I guess if they are out of tree
anyway we don't really care whether we break their code from
mainline. I will respin to change the symantics of the pdata to
be more sensible.

Thanks,
Charles
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
