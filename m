From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] doc: bindings: Add bindings documentation for mtd nvmem
Date: Sat, 18 Mar 2017 15:58:11 -0500
Message-ID: <CAL_JsqJ=P++NeNCzikBfLy3R_XSX1wzbuuSVinYuD3QkW_Vjqg@mail.gmail.com>
References: <1488875164-30440-1-git-send-email-albeu@free.fr>
 <1488875164-30440-2-git-send-email-albeu@free.fr> <20170315172401.35b5owbme4scqfgn@rob-hp-laptop>
 <20170315204141.1381cd01@tock>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170315204141.1381cd01@tock>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alban <albeu-GANU6spQydw@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 15, 2017 at 2:41 PM, Alban <albeu-GANU6spQydw@public.gmane.org> wrote:
> On Wed, 15 Mar 2017 12:24:01 -0500
> Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
>> On Tue, Mar 07, 2017 at 09:26:03AM +0100, Alban wrote:
>> > Config data for drivers, like MAC addresses, is often stored in MTD.
>> > Add a binding that define how such data storage can be represented in
>> > device tree.
>> >
>> > Signed-off-by: Alban <albeu-GANU6spQydw@public.gmane.org>
>> > ---
>> > Changelog:
>> > v2: * Added a "Required properties" section with the nvmem-provider
>> >       property
>> > ---
>> >  .../devicetree/bindings/nvmem/mtd-nvmem.txt        | 33 ++++++++++++++++++++++
>> >  1 file changed, 33 insertions(+)
>> >  create mode 100644 Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
>> >
>> > diff --git a/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt b/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
>> > new file mode 100644
>> > index 0000000..8ed25e6
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
>> > @@ -0,0 +1,33 @@
>> > += NVMEM in MTD =
>> > +
>> > +Config data for drivers, like MAC addresses, is often stored in MTD.
>> > +This binding define how such data storage can be represented in device tree.
>> > +
>> > +An MTD can be defined as an NVMEM provider by adding the `nvmem-provider`
>> > +property to their node. Data cells can then be defined as child nodes
>> > +of the partition as defined in nvmem.txt.
>> > +
>> > +Required properties:
>> > +nvmem-provider:    Indicate that the device should be registered as
>> > +           NVMEM provider
>>
>> I think we should use a compatible string here (perhaps with a
>> generic fallback), and that can imply it is an nvmem provider. The
>> reason is then the compatible can also imply other information that
>> isn't defined in DT.
>
> That would work for partitions but not for unpartitioned MTD as these
> will already have a compatible string for the MTD hardware. I was also
> under the impression that capabilities/services provided by devices
> were represented with such properties, like interrupt-controller or
> gpio-controller, and not with compatible strings.
>
> There is also another problem with unpartitioned MTD, earlier MTD
> partitions binding allowed to have partitions as direct child nodes
> without any compatible strings. The current nvmem binding do the same
> for the nvmem cells, so it wouldn't be clear if a child node of the MTD
> is a partition using the old binding or an nvmem cell.

Perhaps a sign we should not repeat that.

> As I think this problem could happen with some other device types I
> suggested to re-work the nvmem binding to be more like the current MTD
> partitions. See these threads[1][2], but a short example would look like
> this:
>
> flash {
>         compatible = "vendor,flash-device-model";
>         ...
>         nvmem-provider;
>         nvmem-cells {
>                 compatible = "nvmem-cells";

Isn't the node name or compatible here enough to imply this is a nvmem provider?

>                 #address-cells = <1>;
>                 #size-cells = <1>;
>
>                 cell@100 {
>                         label = "mac-address";
>                         reg = <0x100 0x6>;
>                 };
>         };
> };
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
