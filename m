From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH v2 2/5] extcon: arizona: Add basic microphone detection
 DT/ACPI bindings
Date: Fri, 19 Jun 2015 20:03:37 +0900
Message-ID: <CAGTfZH2OpzWR_VQrkCVPD+NKf4+D8e4TytsSeek+kDk2BQH_yQ@mail.gmail.com>
References: <1434638631-16451-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
	<1434638631-16451-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
	<CAGTfZH0uds0swf-x0naTJeMRvOB6DkekdmSSGWA5KpNCWVOWZw@mail.gmail.com>
	<20150619081737.GS32730@opensource.wolfsonmicro.com>
	<CAGTfZH1a6H4Virm-mZDeOD9Pt5M-Q13xo7v+bQwBguJuy1AJXg@mail.gmail.com>
	<20150619090839.GT32730@opensource.wolfsonmicro.com>
	<CAGTfZH19cvcb2PXn69pZY-JpkaOYsCsJC1rrQWy06eNav=+VuA@mail.gmail.com>
	<20150619104453.GX32730@opensource.wolfsonmicro.com>
Reply-To: cw00.choi@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150619104453.GX32730@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: Lee Jones <lee.jones@linaro.org>, "myungjoo.ham@samsung.com" <myungjoo.ham@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Fri, Jun 19, 2015 at 7:44 PM, Charles Keepax
<ckeepax@opensource.wolfsonmicro.com> wrote:
> On Fri, Jun 19, 2015 at 07:31:49PM +0900, Chanwoo Choi wrote:
>> On Fri, Jun 19, 2015 at 6:08 PM, Charles Keepax
>> <ckeepax@opensource.wolfsonmicro.com> wrote:
>> > On Fri, Jun 19, 2015 at 05:28:11PM +0900, Chanwoo Choi wrote:
>> >> On Fri, Jun 19, 2015 at 5:17 PM, Charles Keepax
>> >> <ckeepax@opensource.wolfsonmicro.com> wrote:
>> >> > On Fri, Jun 19, 2015 at 11:25:57AM +0900, Chanwoo Choi wrote:
>> >> >> Hi Charles,
>> >> >>
>> >> >> On Thu, Jun 18, 2015 at 11:43 PM, Charles Keepax
>> >> >> <ckeepax@opensource.wolfsonmicro.com> wrote:
>> >> >> > This patch adds bindings for the basic microphone detection platform
>> >> >> > data.
>> >> >> >
>> >> >> > Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
>> >> >> > ---
>> >> >> > +       dbtime = 0;
>> >> >> > +       device_property_read_u32(arizona->dev, "wlf,micd-dbtime", &dbtime);
>> >> >> > +       switch (dbtime) {
>> >> >> > +       case 2:
>> >> >>
>> >> >> I'd like you to define the constant variable for specific integer
>> >> >> value to improve the readability.
>> >> >> e.g.,
>> >> >>
>> >> >> #define MICD_DBTIME_XXX 2
>> >> >> #define MICD_DBTIME_XXX 4
>> >> >>
>> >> >> > +               pdata->micd_dbtime = 0x10000;
>> >> >>
>> >> >> Also, you better to define the constant variable for "0x10000" to
>> >> >> improbe readability in the include/linux/mfd/arizona.h. If you just
>> >> >> use the hex value, the other developer cannot analyze the meaning of
>> >> >> "0x10000".
>> >> >>
>> >> >> > +               break;
>> >> >> > +       case 4:
>> >> >>
>> >> >> ditto.
>> >> >>
>> >> >
>> >> > I am not sure these two really warrant a define the number in DT
>> >> > indicates the number of debounces to perform.
>> >> >
>> >> > #define MICD_DBTIME_TWO 2
>> >>
>> >> No. I mean that you should define the appropriate name of definition
>> >> to indicate the meaning of 2 or 4. Just not 2 -> TWO.
>> >>
>> >> 2 is 2 second? or 2 is milli-second? or Is there any other meaning?
>> >> I can never know the meaning of '2' without any description and any
>> >> proper name of definition.
>> >
>> > It is literally two, two debounces, I really can't see what I
>> > could call the define. What do you think to the idea I suggested
>> > to rename the variable dbtime -> num_debounces?
>>
>> Is it either "debounce time" or "the number of debounce"?
>>
>> Also,
>>
>> When extcon-arizona driver update the bit for micd_dbtime, use the
>> ARIZONA_MICD_DBTIME_MASK (0x0002).
>>
>> In following case, 0x10000 is larger than ARIZONA_MICD_DBTIME_MASK(0x0002).
>>
>>           case 2:
>>                 pdata->micd_dbtime = 0x10000;
>>
>> Is it correct?
>>
>> I thinkt that "arizona->pdata.micd_dbtime <<
>> ARIZONA_MICD_DBTIME_SHIFT" value should be included in the range of
>> ARIZONA_MICD_DBTIME_MASK(0x0002).
>
> Basically this boils down to setting a single bit which chooses
> between 2 and 4 debounces. The tricky thing is that the default
> value for the pdata will be 0, and the value of the bit for 2
> debounces will be 0. So inorder to show we have intentionally set
> the pdata we set a value that is non-zero but won't get written
> into the register. It is a little awkward but I don't want to
> change how the pdata works as there are probably systems out of
> tree that use it.

This method cause the poor readabilidy of extcon-arizona.c.
If you don't explain this complicated reason of this code, me and
other developer will never understand the meaning of this code.

I don't agree your suggestion. you need other way.

Thanks,
Chanwoo Choi
