Return-Path: <SRS0=CSxX=XC=gmail.com=marek.vasut@kernel.org>
Subject: Re: [PATCH] of: Fix of_empty_ranges_quirk()
References: <20190809173321.19944-1-marek.vasut@gmail.com>
 <CAL_JsqJyYQ99ENOkNd6yzn1eYwLTGLNihFxtovSPJajtF9SVvg@mail.gmail.com>
 <10818888-6476-f4b1-1a2e-e10c3159327f@gmail.com>
 <5d393d4b-b8dc-39e1-991e-de367649cf58@gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <1fef7c3e-0a87-aec7-ee24-3bfc85041cd9@gmail.com>
Date: Sat, 7 Sep 2019 17:15:58 +0200
MIME-Version: 1.0
In-Reply-To: <5d393d4b-b8dc-39e1-991e-de367649cf58@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 8/10/19 9:47 PM, Frank Rowand wrote:
> On 8/10/19 6:39 AM, Marek Vasut wrote:
>> On 8/10/19 12:34 AM, Rob Herring wrote:
>>> On Fri, Aug 9, 2019 at 11:33 AM <marek.vasut@gmail.com> wrote:
>>>>
>>>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>>
>>>> The of_empty_ranges_quirk() returns a mix of boolean and signed integer
>>>> types, which cannot work well.
>>>
>>> It never returns a negative. The negative is used as an uninitialized
>>> flag. Note quirk_state is static.
>>
>> It's still mixing boolean and signed int types though, which isn't right.
> 
> From a code readability aspect, Marek is correct.
> 
> The code author used "stupid (or clever) coding tricks" (tm) to save a
> little bit of memory.  A more readable implementation would be:
> 
> 
> static bool of_empty_ranges_quirk(struct device_node *np)
> {
>         /*
>          * As far as we know, the missing "ranges" problem only exists on Apple
> 	 * machines, so only enable the exception on powerpc. --gcl
>          */
> 
>         if (IS_ENABLED(CONFIG_PPC)) {
>                 /* Cache the result for global "Mac" setting */
>                 static int quirk_state_initialized = 0;
>                 static bool quirk_state;
> 
>                 /* PA-SEMI sdc DT bug */
>                 if (of_device_is_compatible(np, "1682m-sdc"))
>                         return true;
> 
>                 if (!quirk_state_initialized)
> 			quirk_state_initialized = 1;
>                         quirk_state =
>                                 of_machine_is_compatible("Power Macintosh") ||
>                                 of_machine_is_compatible("MacRISC");
>                 return quirk_state;
>         }
>         return false;
> }
> 
> 
> I would also rename of_empty_ranges_quirk() to something like
> of_missing_ranges_is_ok() or of_missing_ranges_allowed().
> "quirk" does not convey any useful information while my proposed rename
> describes what the function is actually checking for.
> 
> The comment that I added is currently in the caller of of_empty_ranges_quirk(),
> but instead belongs in of_empty_ranges_quirk().  When I read that comment in
> of_translate_one(), my reaction was to look for the check for powerpc in
> of_translate_one() and to be puzzled when I could not find it.  I also
> modified the comment for the changed context.  Thus the "--gcl" portion
> of the comment should also be removed from of_translate_one().
> 
> The more readable implementation (IMNSHO) uses slightly more memory and
> slightly more code, but it is more direct about what it is doing and thus
> more readable.

Thanks for the input, sorry for the delay, let me send a V2.

-- 
Best regards,
Marek Vasut
