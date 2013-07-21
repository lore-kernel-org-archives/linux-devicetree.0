From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] [ATTEND] Handling of devicetree bindings
Date: Sun, 21 Jul 2013 13:33:24 +0200
Message-ID: <CACRpkdZ+QFi8mRCVYE2j0_dxHwpKu9HdugthoHHwPGQdw0VwUQ@mail.gmail.com>
References: <60BA5429A0E1584BA3633194F6F993B502AF6D65@NA-MBX-03.mgc.mentorg.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <60BA5429A0E1584BA3633194F6F993B502AF6D65-0dz9ie/QGrnnlEkxMdpx1dQH9K4/4qFeAL8bYrjMMd8@public.gmane.org>
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
To: "Chaiken, Alison" <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jul 21, 2013 at 10:05 AM, Chaiken, Alison
<Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org> wrote:

> Linus Walleij (linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org) responds:

>>multiple things are compiled together and stuffed into
>>an image, the device tree and kernel is always recompiled at every
>>image composition. Everything is versioned in sync.
>
> Are you objecting to the concept of a multicomponent image?
> Or the idea that the kernel and device-tree are always updated together?

Not really. I should have been clearer on this.

(There are other people who are against the multi-component images
for other reasons, but that is a side issue.)

I am worried that the concurrent versioning of the constituent parts
of such an image invites engineers to updates both sides - the
kernel code and the device tree - to fit a certain deployment deadline.

Because there is no policeing of the device trees out there, no
conformance test and no guarding entity, beyond the devicetree@vger
mailing list.

> If one board has a large amount of flash storage and another has
> a smaller amount, assuredly they will need different device-tree blobs?

Yes. Varying parameters is not as big a thing as altering
bindings. I should have been clear on this - altering a device
tree to fit a board is fine. But altering device tree *bindings*
is a sin.

The idea is however, that once that device tree with a board is
deployed, it is not to change. Ever. Like it's this contract.

i.e., while a device tree may fluctuate during development because
of new interesting hardware needing new bindings etc, there must
come a time when the product is deployed, and then that's it - no
more updating the DTS/DTB files. Especially not updates altering
existing bindings.

I am worried that with these composite images this is not what
is happening - you get a firmware-over-the-air update and then there
is a brand new device tree there, and the new kernel would not boot
without it, and the old kernel will not boot on it either.

This is especially a problem in enterprise settings where a new
kernel is deployed separately from any hardware descriptions and
cannot follow the embedded industry's idea to keep nuts and bolts
in sync.

Currently for ACPI or USB or any other standard there is a process
and procedure in place to take that final decision that this is it.
We are missing this from the DT world.

I bet things are not as elegant as they may look in theory,
someone will inevitably bring out an example of runtime-patched
DSDT ACPI tables and BIOS upgrades chaning system bindings,
but I think the pure *ambition* to have these things stable is
what we are missing right now.

>> Or to put it another way: I think this is caused by embedded
>> companies constantly having one finger pressing the fast-forward
>> button.
>
> Because companies have their fingers on the fast-forward button,
> I suspect that many simply have not thought the issues through.

We are in total agreement...

Yours,
Linus Walleij
