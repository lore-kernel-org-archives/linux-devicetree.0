From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] checkpatch: Enable whitespace checks for DTS files
Date: Mon, 30 Jun 2014 13:18:48 +0200
Message-ID: <CAMuHMdWFxifapG6yU9yeZO0UqxtXSrAxZQpdBwOv+=X3E1Jh3w@mail.gmail.com>
References: <1404122011-11409-1-git-send-email-geert+renesas@glider.be>
	<20140630101137.GA31222@bark>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140630101137.GA31222@bark>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Whitcroft <apw-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Andy,

On Mon, Jun 30, 2014 at 12:11 PM, Andy Whitcroft <apw-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org> wrote:
> On Mon, Jun 30, 2014 at 11:53:31AM +0200, Geert Uytterhoeven wrote:
>> When run on *.dtsi or *.dts files, the whitespace checks were skipped,
>> while they are valid for DTS files.  Hence stop skipping them.
>>
>> I ran checkpatch on all in-tree DTS files, and didn't notice any error or
>> warning messages that are inappropriate for DTS files.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>> ---
>>  scripts/checkpatch.pl | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>> index 010b18ef4ea0..9ae624942a84 100755
>> --- a/scripts/checkpatch.pl
>> +++ b/scripts/checkpatch.pl
>> @@ -2137,7 +2137,7 @@ sub process {
>>               }
>>
>>  # check we are in a valid source file if not then ignore this hunk
>> -             next if ($realfile !~ /\.(h|c|s|S|pl|sh)$/);
>> +             next if ($realfile !~ /\.(h|c|s|S|pl|sh|dtsi|dts)$/);
>
> I think it is this one here which lets the white space checks happen for
> your new file types ...
>
>>  #line length limit
>>               if ($line =~ /^\+/ && $prevrawline !~ /\/\*\*/ &&
>> @@ -2192,7 +2192,7 @@ sub process {
>>               }
>>
>>  # check we are in a valid source file C or perl if not then ignore this hunk
>> -             next if ($realfile !~ /\.(h|c|pl)$/);
>> +             next if ($realfile !~ /\.(h|c|pl|dtsi|dts)$/);
>
> ... so I am supprised to see you also changing this one.  Is there a
> check below here you wanted other than those stated in the patch
> commentary?

No, e.g. "check for space before tabs" (the one that triggered me) is below.

>>  # at the beginning of a line any tabs must come first and anything
>>  # more than 8 must use tabs.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
