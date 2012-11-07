From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] fdtget-runtest.sh: use printf instead of /bin/echo -e
Date: Tue, 06 Nov 2012 19:27:27 -0700
Message-ID: <5099C70F.5040801@wwwdotorg.org>
References: <1352224831-1355-1-git-send-email-swarren@wwwdotorg.org>
 <20121106232920.GL23553@truffula.fritz.box> <5099AAA1.8090903@wwwdotorg.org>
 <20121107005338.GN23553@truffula.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121107005338.GN23553-W9XWwYn+TF0XU02nzanrWNbf9cGiqdzd@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/06/2012 05:53 PM, David Gibson wrote:
> On Tue, Nov 06, 2012 at 05:26:09PM -0700, Stephen Warren wrote:
>> On 11/06/2012 04:29 PM, David Gibson wrote:
>>> On Tue, Nov 06, 2012 at 11:00:31AM -0700, Stephen Warren wrote:
>>>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>>
>>>> Not all /bin/echo implementations support the -e option. Instead, use
>>>> printf, which appears to be more widely available than /bin/echo -e.
>>>>
>>>> See commit eaec1db "fdtget-runtest.sh: Fix failures when /bin/sh isn't
>>>> bash" for history.
>>>>
>>>> I have tested this on Ubuntu 10.04 with /bin/sh pointing to both dash
>>>> and bash.
>>>>
>>>> Reported-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> # and implemented-by
>>>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>> ---
>>>> Mike, should I re-write this with you as the git author? If so, could
>>>> you please supply an S-o-b line for this?
>>>> ---
>>>>  tests/fdtget-runtest.sh |    2 +-
>>>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>>>
>>>> diff --git a/tests/fdtget-runtest.sh b/tests/fdtget-runtest.sh
>>>> index c3a3559..8d8b058 100755
>>>> --- a/tests/fdtget-runtest.sh
>>>> +++ b/tests/fdtget-runtest.sh
>>>> @@ -8,7 +8,7 @@ rm -f $LOG $EXPECT
>>>>  trap "rm -f $LOG $EXPECT" 0
>>>>  
>>>>  expect="$1"
>>>> -/bin/echo -e $expect >$EXPECT
>>>> +printf '%b\n' "$expect" > $EXPECT
>>>
>>> Um.. this is made to apply on top of the /bin/echo patch, but AFAICT
>>> that was never committed..
>>
>> I believe it's commit eaec1db "fdtget-runtest.sh: Fix failures when
>> /bin/sh isn't bash"; my local git certainly shows Jon as the committer
>> for that change.
> 
> I just pulled from git.jdl.com and I don't see anything after
> e4b497f367a3b2ae99cc52089a14a221b13a76ef, which was on Oct 16.

Yes, Oct 16 is the last commit date I see too, but the patch was
committed long before that:

> commit eaec1dbc5946d5fd01a9ef7120f8461c74d759a0
> Author:     Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> AuthorDate: Tue Mar 20 20:23:46 2012 -0600
> Commit:     Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
> CommitDate: Sat Mar 31 09:00:29 2012 -0500
> 
>     fdtget-runtest.sh: Fix failures when /bin/sh isn't bash
>     
>     On Ubuntu, /bin/sh is dash (at least by default), and dash's echo doesn't
>     accept the -e option. This means that fdtget-runtest.sh's EXPECT file will
>     contain "-e foo" rather than just "foo", which causes a test failure.
>     
>     To work around this, run /bin/echo instead of (builtin) echo, which has
>     more chance of supporting the -e option.
>     
>     Another possible fix is to change all the #! lines to /bin/bash rather
>     than /bin/sh, and change run_tests.sh to invoke sub-scripts using $SHELL
>     instead of just "sh". However, that would require bash specifically, which
>     may not be desirable.
>     
>     Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
>     Acked-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
