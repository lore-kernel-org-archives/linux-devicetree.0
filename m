From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] checkpatch.pl: Add SPDX license tag check for dts files
 and headers
Date: Thu, 23 Feb 2017 12:45:05 -0600
Message-ID: <CAL_JsqL4ZztUvSevr4Co55n6w10TZaydGDyp4HJxHszFNvkVxw@mail.gmail.com>
References: <20170223155644.24213-1-robh@kernel.org> <1487872274.14159.36.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487872274.14159.36.camel-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Whitcroft <apw-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 23, 2017 at 11:51 AM, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org> wrote:
> On Thu, 2017-02-23 at 09:56 -0600, Rob Herring wrote:
>> Add a check for using SPDX-License-Identifier tags to define the license of
>> .dts{i} and DT header files rather than using free form license text. This
>> check looks for GPL, BSD, or X11(really incorrectly labeled MIT license)
>> license text which are the commonly used DT licenses.
>
> Hi Rob.
>
>> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Andy Whitcroft <apw-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
>> Cc: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
>> ---
>>  scripts/checkpatch.pl | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>> index 982c52ca6473..ce802b3146e3 100755
>> --- a/scripts/checkpatch.pl
>> +++ b/scripts/checkpatch.pl
>> @@ -2139,6 +2139,7 @@ sub process {
>>       my $commit_log_has_diff = 0;
>>       my $reported_maintainer_file = 0;
>>       my $non_utf8_charset = 0;
>> +     my $licensefile = '';
>
> Maybe this should be $spdx_license_file
> but what's the actual reason to check if
> multiple license bits are in a single file?

Yes, just to get a single warning per file since the license matching
can get multiple hits.

Really what I'd like to do is warn if an SPDX tag is not present in
any added file. Having a check for something missing doesn't really
work well with checkpatch at least in a scalable way that I saw.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
