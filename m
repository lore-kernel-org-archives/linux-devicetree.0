From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [RESEND PATCH v3 1/2] of: base: Introduce
 of_alias_get_alias_list() to check alias IDs
Date: Mon, 8 Oct 2018 14:19:53 +0200
Message-ID: <1520923c-2e16-cee3-7281-13082f90954c@xilinx.com>
References: <b1772d99d4e8b788448cde0fc5c7dccb1f63b507.1537443710.git.michal.simek@xilinx.com>
 <CAMuHMdW5zze-KJhK=diR-WKbhO_vsMV2b7WuLHmcT2FtRD4J7Q@mail.gmail.com>
 <d27b381e-f091-91dc-cffe-27789583f949@xilinx.com>
 <CAMuHMdW4H6pjpijU2SX1Z=1Ld7CbBnTtFVwp3gac9toQc4iGpg@mail.gmail.com>
 <56c81d1a-e2f8-067e-4908-686cd83d478c@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56c81d1a-e2f8-067e-4908-686cd83d478c@xilinx.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Simek <monstr@monstr.eu>, Greg KH <gregkh@linuxfoundation.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Geert,

On 27.9.2018 09:22, Michal Simek wrote:
> On 27.9.2018 09:19, Geert Uytterhoeven wrote:
>> Hi Michal,
>>
>> On Wed, Sep 26, 2018 at 1:01 PM Michal Simek <michal.simek@xilinx.com> wrote:
>>> On 24.9.2018 09:41, Geert Uytterhoeven wrote:
>>>> On Thu, Sep 20, 2018 at 1:42 PM Michal Simek <michal.simek@xilinx.com> wrote:
>>>>> The function travels the lookup table to record alias ids for the given
>>>>> device match structures and alias stem.
>>>>> This function will be used by serial drivers to check if requested alias
>>>>> is allocated or free to use.
>>>>>
>>>>> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
>>>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>>>
>>>> I know this has already been applied, it just drew my attention.
>>>>
>>>>> --- a/drivers/of/base.c
>>>>> +++ b/drivers/of/base.c
>>>>> @@ -16,6 +16,7 @@
>>>>>
>>>>>  #define pr_fmt(fmt)    "OF: " fmt
>>>>>
>>>>> +#include <linux/bitmap.h>
>>>>>  #include <linux/console.h>
>>>>>  #include <linux/ctype.h>
>>>>>  #include <linux/cpu.h>
>>>>> @@ -1943,6 +1944,57 @@ int of_alias_get_id(struct device_node *np, const char *stem)
>>>>>  EXPORT_SYMBOL_GPL(of_alias_get_id);
>>>>>
>>>>>  /**
>>>>> + * of_alias_get_alias_list - Get alias list for the given device driver
>>>>> + * @matches:   Array of OF device match structures to search in
>>>>> + * @stem:      Alias stem of the given device_node
>>>>> + * @bitmap:    Bitmap field pointer
>>>>> + * @nbits:     Maximum number of alias ID which can be recorded it bitmap
>>>>
>>>> IDs
>>>>
>>>>> + *
>>>>> + * The function travels the lookup table to record alias ids for the given
>>>>> + * device match structures and alias stem.
>>>>> + *
>>>>> + * Return:     0 or -ENOSYS when !CONFIG_OF
>>>>> + */
>>>>> +int of_alias_get_alias_list(const struct of_device_id *matches,
>>>>> +                            const char *stem, unsigned long *bitmap,
>>>>> +                            unsigned int nbits)
>>>>> +{
>>>>> +       struct alias_prop *app;
>>>>> +
>>>>> +       /* Zero bitmap field to make sure that all the time it is clean */
>>>>> +       bitmap_zero(bitmap, nbits);
>>>>> +
>>>>> +       mutex_lock(&of_mutex);
>>>>> +       pr_debug("%s: Looking for stem: %s\n", __func__, stem);
>>>>> +       list_for_each_entry(app, &aliases_lookup, link) {
>>>>> +               pr_debug("%s: stem: %s, id: %d\n",
>>>>> +                        __func__, app->stem, app->id);
>>>>> +
>>>>> +               if (strcmp(app->stem, stem) != 0) {
>>>>> +                       pr_debug("%s: stem comparison doesn't passed %s\n",
>>>>
>>>> didn't pass?
>>>>
>>>>> +                                __func__, app->stem);
>>>>> +                       continue;
>>>>> +               }
>>>>> +
>>>>> +               if (app->id >= nbits) {
>>>>> +                       pr_debug("%s: ID %d greater then bitmap field %d\n",
>>>>
>>>> than
>>>> %u for unsigned int
>>>
>>> I won't fix this now because this can be done together with one change
>>> described below.
>>>
>>>>
>>>>> +                               __func__, app->id, nbits);
>>>>> +                       continue;
>>>>
>>>> Shouldn't this return an error, if of_match_node() below would have matched?
>>>
>>> IIRC Above check is for "serial" name.
>>> This one is for getting XX number from alias "serialXX".
>>> And below is checking compatible string.
>>>
>>> You are calling this function from uartps with 32 lines limit and there
>>> is serial33 alias poiting to uartlite (for example) then you don't want
>>> to break this call for that.
>>>
>>> What can be done is that compatible string is checked first and if this
>>> passed then ids are check and error can be returned or bit sets.
>>
>> That's what I meant: currently any serialN with N >= nbits is ignored, even
>> if the alias applies to the driver that called the function.
> 
> ok. Let me create a patch and check compatible string first and then
> setup bit or fail if N >= nbits.

I have sent a patch with this change. Let's have discussion in that new
thread.

Thanks,
Michal
