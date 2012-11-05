From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] fdtget-runtest.sh: Fix failures when /bin/sh isn't bash
Date: Mon, 05 Nov 2012 10:39:30 -0700
Message-ID: <5097F9D2.2040103@wwwdotorg.org>
References: <1332296626-19707-1-git-send-email-swarren@wwwdotorg.org>
 <201211021626.50503.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201211021626.50503.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
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
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/02/2012 02:26 PM, Mike Frysinger wrote:
> On Tuesday 20 March 2012 22:23:46 Stephen Warren wrote:
>> On Ubuntu, /bin/sh is dash (at least by default), and dash's echo
>> doesn't accept the -e option. This means that fdtget-runtest.sh's
>> EXPECT file will contain "-e foo" rather than just "foo", which
>> causes a test failure.
>> 
>> To work around this, run /bin/echo instead of (builtin) echo,
>> which has more chance of supporting the -e option.
>> 
>> Another possible fix is to change all the #! lines to /bin/bash
>> rather than /bin/sh, and change run_tests.sh to invoke
>> sub-scripts using $SHELL instead of just "sh". However, that
>> would require bash specifically, which may not be desirable.
>> 
>> --- a/tests/fdtget-runtest.sh +++ b/tests/fdtget-runtest.sh
>> 
>> -echo -e $expect >$EXPECT +/bin/echo -e $expect >$EXPECT
> 
> the better fix is to use printf and %b: printf '%b\n' "$expect" >
> $EXPECT

What is the relative availability (e.g. on anything other than a
modern Linux distro) of a printf binary vs. a /bin/echo binary that
supports -e? I certainly heard about /bin/echo -e long before I knew
about /usr/bin/printf, although it's quite possible that has no
correlation with where /usr/bin/printf is actually installed.
