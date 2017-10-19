From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [Ksummit-discuss] Devicetree Workshop at Kernel Summit Prague (26
 Oct 2017)
Date: Thu, 19 Oct 2017 09:59:54 -0500
Message-ID: <CAL_Jsq+p=-yTY4BNKXdSccPcBWsCUkP8HPQ-ergZXPB8msY5ig@mail.gmail.com>
References: <CACxGe6sxKzNKZbdGA-G=Th2oHwuanyC2kGYuaFcKbSRkuhep+Q@mail.gmail.com>
 <20171017114823.58476908@bbrezillon> <CAGb2v67GU4uW7uPMrqFjTW0qBR6LPNeX4Md+tf9S=HRWT_GVqA@mail.gmail.com>
 <20171018110958.mh76pngzluazmc7y@sirena.co.uk> <20171018175910.GP12015@bill-the-cat>
 <FD387FCC-3F95-48DF-B412-3384EF96FCFC@fubar.geek.nz> <CAL_JsqJTE5p0zjm-66D2143dEx+xQ0uKCV-20kMt-kq=SOa-8Q@mail.gmail.com>
 <23a238d7-0b3d-8b46-b2fe-88b9d0841aa1@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <23a238d7-0b3d-8b46-b2fe-88b9d0841aa1-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Cc: Andrew Turner <andrew-/GQUgJ3qWXsIvnNNuaVxrw@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 19, 2017 at 9:00 AM, Alexandre Torgue
<alexandre.torgue-qxv4g6HH51o@public.gmane.org> wrote:
> Hi Rob,
>
>
> On 10/19/2017 01:53 AM, Rob Herring wrote:
>> On Wed, Oct 18, 2017 at 6:28 PM, Andrew Turner <andrew-/GQUgJ3qWXsIvnNNuaVxrw@public.gmane.org>
>> wrote:

[...]

>>>  From the FreeBSD perspective I’d like it if there was a common repo for
>>> all devicetree consumers to share. We are trying to not have FreeBSD
>>> specific properties as this has caused issues in the past where we had (and
>>> still have) FreeBSD specific dts files. We are trying to remove these as
>>> drivers are updated to handle the common bindings.
>>
>>
>> Are you aware of this repo[1]? I don't have a sense for how widely
>> used it is. If not, it is intended to provide a common repository of
>> binding docs and dts files. If so, what are your issues with using it?
>> It's generated from the kernel tree with git-filter-branch and through
>> the kernel tree is the only way to add things currently. But there's
>> no requirement that you add a Linux driver to submit a binding or dts
>> change. We could consider taking patches against the tree directly,
>> and the maintainers (me) can fixup the paths and apply to the kernel
>> tree.
>>
>> If there's bindings in the kernel tree you think are crap and Linux
>> specific, I'd like to know that too. We should start flagging those.
>>
>>> I have also spoken with some NetBSD and OpenBSD developers. They are both
>>> using devicetree to handle device enumeration. Having all 5 projects using a
>>> common set of dts files and binding would simplify keeping them in sync.
>>
>>
>> There's more than 5 likely: linux, 3x BSD, u-boot, barebox, zephyr,
>> ARM trusted firmware?, UEFI?, ?
>
>
> First, sorry to come late in this discussion (please be tolerant if you
> already respond to following requests/interrogations in precedent mails :)).
> From STmicro point of view we have the same kind of requests/needs than
> Andrew. We think about the possibility to use same DTS files for Linux,
> U-boot, ATF and Zephir (others could come with other vendors). Currently our
> main concerns about this are:
>
> 1-How to reduce dtb size:
>         --> Reading some thread, you already start this task with Nicolas.
> Does it concerns only XiP system ?

That's the main focus ATM. Nico has looked at shrinking code usage too
such as the tty layer and scheduler, but those have faced resistance.
We need actual products to prove the value (and that's a chicken and
egg problem).

>         -->For example, I want to use the same dtsi files between Linux and
> U-boot. If in u-boot dts file I overload several "status" entry by
> "disabled", is it possible that compiler doesn't build it ? And what about
> not used phandle ?

You certainly could remove disabled nodes in dtc. I'm not sure how
hard it would be to plumb into dtc. I think phandle properties are
already only created if there's a reference to them. If that is
created before you deleted nodes, then it would probably be hard to
find and remove all of those. It would be similar to solving the
device dependency problem. Or do you mean something like disable the
clock controller node if there are no enabled references to it? I
don't think we could do something like that generically and reliably.

We did recently stop creating both "phandle" and "linux,phandle"
properties by default in dtc, so that will save some size.

> 2- The place of DT files (sources/scripts). I see (and clone) your
> "devicetree-rebasing.git" tree, it's a good start point. Currently (correct
> me  if I'm wrong) the Kernel seems to "lead" the devicetree bindings and
> devicetree dts(i) files.

Yes, and there's not really any changing that regardless of where
bindings and dts files live given Linux has the broadest h/w support.

> By using this external repo, it would be maybe
> easier to integrate changes for other components than Linux Kernel ?

Yes, barebox at least regularly imports it.

> We
> could have (per vendor), same dtsi files which describes the hardware (SoC +
> board) and a extra dts files (at least at beginning) per software components
> to overload nodes (to disable some nodes not required (see (1)), to change
> bindings which are different regarding component ...).

You mean dtsi files to disable nodes for linux, u-boot, etc. That may
make sense for mutually exclusive things like FreeBSD vs. Linux, but
for say u-boot, we really want u-boot and Linux (or whatever OS is
loaded) to use the same dtb. Having different dtbs is going to
increase your memory usage.

> It will also allow to have all dt script / tools for all components at only
> one place.
>
> Once again, sorry if I repeat things already discussed but I wanted to
> expose what STMicro has in mind for DT. It will be a good topic to discuss
> at Prague.

Yes, but I won't be there.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
