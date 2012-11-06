From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] fdtget-runtest.sh: Fix failures when /bin/sh isn't bash
Date: Tue, 06 Nov 2012 10:27:46 -0700
Message-ID: <50994892.1070504@wwwdotorg.org>
References: <1332296626-19707-1-git-send-email-swarren@wwwdotorg.org>
 <201211021626.50503.vapier@gentoo.org> <5097F9D2.2040103@wwwdotorg.org>
 <20121106072656.GF23553@truffula.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121106072656.GF23553-W9XWwYn+TF0XU02nzanrWNbf9cGiqdzd@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/06/2012 12:26 AM, David Gibson wrote:
> On Mon, Nov 05, 2012 at 10:39:30AM -0700, Stephen Warren wrote:
>> On 11/02/2012 02:26 PM, Mike Frysinger wrote:
>>> On Tuesday 20 March 2012 22:23:46 Stephen Warren wrote:
>>>> On Ubuntu, /bin/sh is dash (at least by default), and dash's echo
>>>> doesn't accept the -e option. This means that fdtget-runtest.sh's
>>>> EXPECT file will contain "-e foo" rather than just "foo", which
>>>> causes a test failure.
>>>>
>>>> To work around this, run /bin/echo instead of (builtin) echo,
>>>> which has more chance of supporting the -e option.
>>>>
>>>> Another possible fix is to change all the #! lines to /bin/bash
>>>> rather than /bin/sh, and change run_tests.sh to invoke
>>>> sub-scripts using $SHELL instead of just "sh". However, that
>>>> would require bash specifically, which may not be desirable.
>>>>
>>>> --- a/tests/fdtget-runtest.sh +++ b/tests/fdtget-runtest.sh
>>>>
>>>> -echo -e $expect >$EXPECT +/bin/echo -e $expect >$EXPECT
>>>
>>> the better fix is to use printf and %b: printf '%b\n' "$expect" >
>>> $EXPECT
>>
>> What is the relative availability (e.g. on anything other than a
>> modern Linux distro) of a printf binary vs. a /bin/echo binary that
>> supports -e? I certainly heard about /bin/echo -e long before I knew
>> about /usr/bin/printf, although it's quite possible that has no
>> correlation with where /usr/bin/printf is actually installed.
> 
> That's the crux of the matter, really.  I just had a look on a FreeBSD
> box I have access to and /bin/echo does *not* support -e, but there is
> a printf(1).  So the /bin/echo -e approach is definitely no good,
> printf might be but I don't know how widespread it is.

Out of curiosity, does FreeBSD's sh's built-in echo accept the -e
option? In other words, did the switch to /bin/echo break anything there?

For reference, I just booted my ancient Red Hat 7.3 virtual machine, and
it has printf, so I guess it's fairly widely available.

A quick search yields the following:

http://old.nabble.com/Re%3A-portability-of-%27printf%27-command-td28144087.html

which comes to the conclusion that printf is widely available enough to
be OK.

Oh, and if you find "Portable Shell Scripting" by Peter Seebach on
Google Books or in print, page 18 discusses the portability of printf,
and concludes that it's almost pervasive.
