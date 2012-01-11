From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] of: Support CONFIG_CMDLINE_EXTEND config option
Date: Wed, 11 Jan 2012 08:39:40 -0800
Message-ID: <CAD=FV=Uc7bhr4Knvr2Th5HVNnoF8TtBHZ7LTE6ZFYGUyNkgM4Q@mail.gmail.com>
References: <1326156853-24840-1-git-send-email-dianders@chromium.org>
 <4F0CF61F.50705@gmail.com> <1326258182.23910.105.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1326258182.23910.105.camel@pasglop>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Ben,

Thank you for the review!  See below for a question...

On Tue, Jan 10, 2012 at 9:03 PM, Benjamin Herrenschmidt
<benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
>> > The new logic is now documented in of_fdt.h and is copied here for
>> > reference:
>> >
>> > - CONFIG_CMDLINE_FORCE=3Dtrue
>> > =A0 =A0 CONFIG_CMDLINE
>> > - CONFIG_CMDLINE_EXTEND=3Dtrue
>> > =A0 =A0 CONFIG_CMDLINE + dt bootargs (even if dt bootargs are empty)
>> > - CMDLINE_FROM_BOOTLOADER=3Dtrue, dt bootargs=3Dnon-empty:
>> > =A0 =A0 dt bootargs
>> > - CMDLINE_FROM_BOOTLOADER=3Dtrue, dt bootargs=3Dempty, @data is non-em=
pty string
>> > =A0 =A0 @data is left unchanged
>> > - CMDLINE_FROM_BOOTLOADER=3Dtrue, dt bootargs=3Dempty, @data is empty =
string
>> > =A0 =A0 CONFIG_CMDLINE (or "" if that's not defined)
>> >
> So if CONFIG_CMDLINE_EXTEND=3Dtrue, dt_bootargs is empty, and @data is non
> empty, I want CONFIG_CMDLINE + @data..

Before I go and recode, can you confirm this?  It doesn't seem to
match the help for CMDLINE_EXTEND, which says that the final command
line should be the kernel's base plus the bootloader's (not combining
the two separate ways that the kernel determined the cmdline).  Here's
the help string:

           The command-line arguments provided by the boot loader will be
           appended to the default kernel command string.

Instead, would you consider the following?  It would seem to match the
concept of @data being a higher-priority alternative to
CONFIG_CMDLINE:

- CONFIG_CMDLINE_EXTEND=3Dtrue, @data is non-empty string
    @data + dt bootargs (even if dt bootargs are empty)
- CONFIG_CMDLINE_EXTEND=3Dtrue, @data is empty string
    CONFIG_CMDLINE + dt bootargs (even if dt bootargs are empty)


In that, there would never be a case of combining @data and
CONFIG_CMDLINE, which I think is OK.


> So if you have CONFIG_CMDLINE_EXTEND, and have a command line in the
> device-tree, you just read it, concat with what's in data but ...
>
> the next node in the device-tree will hit the initial code above again
> which will overwrite what you just did with the content of
> CONFIG_CMDLINE (unless /chosen is the last node in the device-tree,
> probably why it might have worked for you once).
>
> It can still work ... as long as once you've hit the command line above,
> you clear overwrite_incoming_cmdline. You may also clear read_dt_cmdline
> for good measure.

Good catch here.  I didn't have a real test case where @data was set
to something before this function was called, so I unit tested that
particular scenario and didn't catch it there.

I may just move things back to only working properly if the DT has a
"chosen" attribute, like the old code did.  I don't need that fix, so
there's no reason to complicate this patch.


-Doug
