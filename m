From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 2/3] checks: Add unit-address checks for simple-bus and default
Date: Fri, 1 Apr 2016 13:50:18 -0500
Message-ID: <CAL_JsqLup+esWdQ1dzpOaj17BaE2d2CJ6sJAqBUcNx2xBvNFKg@mail.gmail.com>
References: <1458780021-5052-1-git-send-email-robh@kernel.org>
 <1458780021-5052-2-git-send-email-robh@kernel.org> <20160331052912.GE416@voom.redhat.com>
 <CAL_JsqJO+9Wna4mjeRLj+ELy7BwL7K=QEVrNGs3CuAaE3Y_Q3A@mail.gmail.com> <20160401022735.GJ416@voom.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160401022735.GJ416-1s0os16eZneny3qCrzbmXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 31, 2016 at 9:27 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Thu, Mar 31, 2016 at 11:18:25AM -0500, Rob Herring wrote:
>> On Thu, Mar 31, 2016 at 12:29 AM, David Gibson
>> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>> > On Wed, Mar 23, 2016 at 07:40:20PM -0500, Rob Herring wrote:
>> >> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> >
>> > Minor nit: before doing these tests, we should probably add a check
>> > which ensures that any bus bridge node *has* a #address-cells and
>> > #size-cells value.
>>
>> I'll check, but I thought we already had that check because any bridge
>> node has reg or ranges.
>>
>> >
>> >> ---
>> >>  checks.c                                    | 87 +++++++++++++++++++++++++++--
>> >>  tests/run_tests.sh                          |  4 ++
>> >>  tests/unit-addr-leading-0s.dts              | 10 ++++
>> >>  tests/unit-addr-leading-0x.dts              | 10 ++++
>> >>  tests/unit-addr-simple-bus-comma.dts        | 18 ++++++
>> >>  tests/unit-addr-simple-bus-reg-mismatch.dts | 18 ++++++
>> >>  6 files changed, 142 insertions(+), 5 deletions(-)
>> >>  create mode 100644 tests/unit-addr-leading-0s.dts
>> >>  create mode 100644 tests/unit-addr-leading-0x.dts
>> >>  create mode 100644 tests/unit-addr-simple-bus-comma.dts
>> >>  create mode 100644 tests/unit-addr-simple-bus-reg-mismatch.dts
>> >>
>> >> diff --git a/checks.c b/checks.c
>> >> index 48e926e..82a7f38 100644
>> >> --- a/checks.c
>> >> +++ b/checks.c
>> >> @@ -20,6 +20,11 @@
>> >>
>> >>  #include "dtc.h"
>> >>
>> >> +#define node_addr_cells(n) \
>> >> +     (((n)->addr_cells == -1) ? 2 : (n)->addr_cells)
>> >> +#define node_size_cells(n) \
>> >> +     (((n)->size_cells == -1) ? 1 : (n)->size_cells)
>> >> +
>> >>  #ifdef TRACE_CHECKS
>> >>  #define TRACE(c, ...) \
>> >>       do { \
>> >> @@ -578,12 +583,88 @@ static bool is_simple_bridge(struct node *node)
>> >>       return false;
>> >>  }
>> >>
>> >> +static void default_unit_addr(struct check *c, struct node *dt, struct node *node)
>> >> +{
>> >> +     const char *unitname = get_unitname(node);
>> >> +
>> >> +     if (strstr(unitname, "0x") == unitname) {
>> >> +             FAIL(c, "Node %s unit address should not have leading \"0x\"",
>> >> +                  node->fullpath);
>> >> +             /* skip over 0x for next test */
>> >> +             unitname += 2;
>> >> +     }
>> >> +     if (unitname[0] == '0' && isxdigit(unitname[1]))
>> >> +             FAIL(c, "Node %s unit address should not have leading 0s",
>> >> +                  node->fullpath);
>> >
>> > Explicitly checking various aspects of the format seems a bit weird to
>> > me.  Why not just generate the expected address from 'reg' and
>> > strcmp()?
>>
>> Because for the default check, I'm only testing these aspects. I found
>> some cases running this thru the kernel tree dts files that the full
>> simple-bus check is too strict. For example, we want to warn on
>> "@0x002,4", but not "@2,4" or "@2blah".
>
> Ok.  Thinking about it, I think this might work a bit better separated
> (mostly) from the bus type stuff.  Basically treat it as a "common
> unit name problems" test, that will skip itself if a bus type is set
> (which will allow more thorough testing of the unit name).

Ha! That's pretty much back to my original patch, but with the
addition of skipping the test if the bus type is known.

Rob
