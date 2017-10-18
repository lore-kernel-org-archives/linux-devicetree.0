From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [Ksummit-discuss] Devicetree Workshop at Kernel Summit Prague (26
 Oct 2017)
Date: Wed, 18 Oct 2017 18:53:40 -0500
Message-ID: <CAL_JsqJTE5p0zjm-66D2143dEx+xQ0uKCV-20kMt-kq=SOa-8Q@mail.gmail.com>
References: <CACxGe6sxKzNKZbdGA-G=Th2oHwuanyC2kGYuaFcKbSRkuhep+Q@mail.gmail.com>
 <20171017114823.58476908@bbrezillon> <CAGb2v67GU4uW7uPMrqFjTW0qBR6LPNeX4Md+tf9S=HRWT_GVqA@mail.gmail.com>
 <20171018110958.mh76pngzluazmc7y@sirena.co.uk> <20171018175910.GP12015@bill-the-cat>
 <FD387FCC-3F95-48DF-B412-3384EF96FCFC@fubar.geek.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <FD387FCC-3F95-48DF-B412-3384EF96FCFC-/GQUgJ3qWXsIvnNNuaVxrw@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Turner <andrew-/GQUgJ3qWXsIvnNNuaVxrw@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 18, 2017 at 6:28 PM, Andrew Turner <andrew-/GQUgJ3qWXsIvnNNuaVxrw@public.gmane.org> wrote:
>
>> On 18 Oct 2017, at 18:59, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>>
>> On Wed, Oct 18, 2017 at 12:09:58PM +0100, Mark Brown wrote:
>>> On Wed, Oct 18, 2017 at 06:35:24PM +0800, Chen-Yu Tsai wrote:
>>>
>>>> I'd like to add something on the topic of non-Linux projects. In this
>>>> case it's diverging DT bindings from U-boot:
>>>
>>>> https://patchwork.ozlabs.org/patch/823158/
>>>
>>>> U-boot already has a set of devicetree binding additions:
>>>> https://github.com/u-boot/u-boot/tree/master/doc/device-tree-bindings
>>>
>>>> The patch in question wants to ab(use) the regulator-name property for
>>>> driver instance binding. In my opinion this is not going to fly, as
>>>> boards are free to define the names. This either sees no use other than
>>>> as a dirty workaround for dts files that aren't following the PMIC
>>>> regulator bindings (regulator node names should follow well defined,
>>>> identifying names), or results in divergence of the DT files.
>>>
>>> One meta issue I'm seeing here is that the u-boot people appear to have
>>> their own divergent copy of some of the binding documents.
>>
>> Putting on my U-Boot hat now, it's mostly unintentional and something in
>> general (yes, the initial topic here is not such an example) we try and
>> avoid, or use u-boot, as the prefix on as it's something that had been
>> previously rejected or deemed inappropriate to be in the upstream
>> version of the binding.
>>
>> But perhaps it's time to try and force the issue again, given what Rob
>> and others have said in other parts of the thread.
>
> From the FreeBSD perspective I’d like it if there was a common repo for all devicetree consumers to share. We are trying to not have FreeBSD specific properties as this has caused issues in the past where we had (and still have) FreeBSD specific dts files. We are trying to remove these as drivers are updated to handle the common bindings.

Are you aware of this repo[1]? I don't have a sense for how widely
used it is. If not, it is intended to provide a common repository of
binding docs and dts files. If so, what are your issues with using it?
It's generated from the kernel tree with git-filter-branch and through
the kernel tree is the only way to add things currently. But there's
no requirement that you add a Linux driver to submit a binding or dts
change. We could consider taking patches against the tree directly,
and the maintainers (me) can fixup the paths and apply to the kernel
tree.

If there's bindings in the kernel tree you think are crap and Linux
specific, I'd like to know that too. We should start flagging those.

> I have also spoken with some NetBSD and OpenBSD developers. They are both using devicetree to handle device enumeration. Having all 5 projects using a common set of dts files and binding would simplify keeping them in sync.

There's more than 5 likely: linux, 3x BSD, u-boot, barebox, zephyr,
ARM trusted firmware?, UEFI?, ?

Rob

[1] https://git.kernel.org/pub/scm/linux/kernel/git/devicetree/devicetree-rebasing.git/
