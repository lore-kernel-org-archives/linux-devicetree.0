From: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 3/3] dtc: Add support for variable sized cells
Date: Tue, 27 Sep 2011 09:46:17 -0700
Message-ID: <CAF6FioWr_6FVuy535RmgU3z+BfWr5Nsc_HjAV50BQsU8xnBN-w@mail.gmail.com>
References: <1316800974-30129-1-git-send-email-robotboy@chromium.org>
	<1316800974-30129-4-git-send-email-robotboy@chromium.org>
	<20110925110454.GP12286@yookeroo.fritz.box>
	<CAF6FioU6HmPw4UTHmiWFJPyXJGR5KtZR_4CW3be++S5vSR0GaA@mail.gmail.com>
	<20110927005529.GA5361@yookeroo.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110927005529.GA5361-787xzQ0H9iQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 26, 2011 at 5:55 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Mon, Sep 26, 2011 at 10:15:48AM -0700, Anton Staaf wrote:
>> On Sun, Sep 25, 2011 at 4:04 AM, David Gibson
>> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>> > On Fri, Sep 23, 2011 at 11:02:54AM -0700, Anton Staaf wrote:
> [snip]
>> > Uh, so, this is actually worse than what you had before. =A0Remember
>> > print_error() just prints an error, without aborting the parse. =A0So
>> > now, if bits !=3D 32 it will print the error, then add a phandle marker
>> > *and* a bits-sized -1. =A0So later, when we go through and fix up the
>> > REF_PHANDLE markers, we'll assume we're replacing 32-bits of data,
>> > which could overrun the end of the data if the element size is less
>> > than 32.
>> >
>> > So, basically the data_add_marker() needs to be in an else clause.
>>
>> Yup, you're right. =A0I should first ask, I couldn't figure out how to w=
rite
>> a test that tests parse error cases like this. =A0The closest I found wa=
s the
>> check tests. =A0But they are specific to the check messages. =A0Is there=
 a
>> good example of a parse error test? =A0Or should I create a new type of =
test?
>
> Yeah, I don't think we really have any tests like this. =A0In general
> I've been less concerned about testing the error paths than the
> working path, though testing error paths as well is not a bad idea.
>
> So feel free to make a new test if you can think up one that makes
> sense. =A0A simple "doesn't crash" test would be a start, that doesn't
> care about the program's results, as long as it isn't killed by a
> signal. =A0Actually testing that an error message is generated would
> require more work though.

I was thinking of a "does crash" test.  One that we can use to test that
incorrectly formatted or semantically incorrect dts files generate the
appropriate dtc error messages.  I'll look into adding such a test.  But
I think I'll make that a separate patch set.

Ahh, I think I just grokked what you want the "doesn't crash" test for.
It would be used to run a test that hits a syntax error, but ensures
that the continued execution past that point doesn't cause a segfault
or other error.  I'll see what I can do about creating a test harness that
checks both that a specific error was emitted and that the dtc didn't
crash as a result of the bad input data.

Thanks,
    Anton

> --
> David Gibson =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| I'll have my music =
baroque, and my code
> david AT gibson.dropbear.id.au =A0| minimalist, thank you. =A0NOT _the_ _=
other_
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| _way_ _a=
round_!
> http://www.ozlabs.org/~dgibson
>
