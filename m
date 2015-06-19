From: Chanwoo Choi <cwchoi00-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/5] extcon: arizona: Add basic microphone detection
 DT/ACPI bindings
Date: Fri, 19 Jun 2015 17:28:11 +0900
Message-ID: <CAGTfZH1a6H4Virm-mZDeOD9Pt5M-Q13xo7v+bQwBguJuy1AJXg@mail.gmail.com>
References: <1434638631-16451-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
	<1434638631-16451-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
	<CAGTfZH0uds0swf-x0naTJeMRvOB6DkekdmSSGWA5KpNCWVOWZw@mail.gmail.com>
	<20150619081737.GS32730@opensource.wolfsonmicro.com>
Reply-To: cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150619081737.GS32730-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 19, 2015 at 5:17 PM, Charles Keepax
<ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
> On Fri, Jun 19, 2015 at 11:25:57AM +0900, Chanwoo Choi wrote:
>> Hi Charles,
>>
>> On Thu, Jun 18, 2015 at 11:43 PM, Charles Keepax
>> <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
>> > This patch adds bindings for the basic microphone detection platform
>> > data.
>> >
>> > Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
>> > ---
>> > +       dbtime = 0;
>> > +       device_property_read_u32(arizona->dev, "wlf,micd-dbtime", &dbtime);
>> > +       switch (dbtime) {
>> > +       case 2:
>>
>> I'd like you to define the constant variable for specific integer
>> value to improve the readability.
>> e.g.,
>>
>> #define MICD_DBTIME_XXX 2
>> #define MICD_DBTIME_XXX 4
>>
>> > +               pdata->micd_dbtime = 0x10000;
>>
>> Also, you better to define the constant variable for "0x10000" to
>> improbe readability in the include/linux/mfd/arizona.h. If you just
>> use the hex value, the other developer cannot analyze the meaning of
>> "0x10000".
>>
>> > +               break;
>> > +       case 4:
>>
>> ditto.
>>
>
> I am not sure these two really warrant a define the number in DT
> indicates the number of debounces to perform.
>
> #define MICD_DBTIME_TWO 2

No. I mean that you should define the appropriate name of definition
to indicate the meaning of 2 or 4. Just not 2 -> TWO.

2 is 2 second? or 2 is milli-second? or Is there any other meaning?
I can never know the meaning of '2' without any description and any
proper name of definition.

Thanks,
Chanwoo CHOi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
