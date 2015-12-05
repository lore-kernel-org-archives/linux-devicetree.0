From: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH for-4.4 2/2] doc: dt: mtd: partitions: add compatible
 property to "partitions" node
Date: Sat, 5 Dec 2015 12:45:36 +0100
Message-ID: <CAOiHx=kP8hT-UH=tfUZYYpr__i458-ZL3bOhcAJb8hmSbqBdCA@mail.gmail.com>
References: <1449194529-145705-1-git-send-email-computersforpeace@gmail.com> <1449194529-145705-2-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449194529-145705-2-git-send-email-computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: MTD Maling List <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>, Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 4, 2015 at 3:02 AM, Brian Norris
<computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> As noted here [1], there are potentially future conflicts if we try to
> use MTD's "partitions" subnode to describe anything besides just the
> fixed-in-the-device-tree partitions currently described in this
> document. Particularly, there was a proposal to use this node for the
> AFS parser too.
>
> It can pose a (small) problem to try to differentiate the following
> nodes:
>
>         // using binding as currently specified
>         partitions {
>                 #address-cells = <x>;
>                 #size-cells = <y>;
>                 partition@0 {
>                         ...;
>                 };
>         };
>
> and
>
>         // proposed future binding
>         partitions {
>                 compatible = "arm,arm-flash-structure";
>         };
>
> It's especially difficult if other uses of this node start having
> subnodes.
>
> So, since the "partitions" node is new in v4.4, let's fixup the binding
> before release so that it requires a compatible property, so it's much
> clearer to distinguish. e.g.:
>
>         // proposed
>         partitions {
>                 compatible = "partitions";

"partitions" sounds mode like a device_type thing than a compatible
name, maybe "fixed-partitions"? IMHO that would describe better what
these are, and doesn't invite to think using compatible =
"arm,arm-flash-structure", "partitions"; is a good idea.

>                 #address-cells = <x>;
>                 #size-cells = <y>;
>                 partition@0 {
>                         ...;
>                 };
>         };


Jonas
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
