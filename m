From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH for-4.4 2/2] doc: dt: mtd: partitions: add compatible
 property to "partitions" node
Date: Mon, 7 Dec 2015 09:58:35 -0800
Message-ID: <20151207175835.GM120110@google.com>
References: <1449194529-145705-1-git-send-email-computersforpeace@gmail.com>
 <1449194529-145705-2-git-send-email-computersforpeace@gmail.com>
 <CAOiHx=kP8hT-UH=tfUZYYpr__i458-ZL3bOhcAJb8hmSbqBdCA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOiHx=kP8hT-UH=tfUZYYpr__i458-ZL3bOhcAJb8hmSbqBdCA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: MTD Maling List <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>, Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Dec 05, 2015 at 12:45:36PM +0100, Jonas Gorski wrote:
> On Fri, Dec 4, 2015 at 3:02 AM, Brian Norris
> <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >         // proposed
> >         partitions {
> >                 compatible = "partitions";
> 
> "partitions" sounds mode like a device_type thing than a compatible
> name, maybe "fixed-partitions"? IMHO that would describe better what
> these are, and doesn't invite to think using compatible =
> "arm,arm-flash-structure", "partitions"; is a good idea.

"fixed-partitions" sounds OK to me. If no objections, I'll apply these
patches, with (approximately) a:

s/"partitions"/"fixed-partitions"/

Thanks,
Brian

> >                 #address-cells = <x>;
> >                 #size-cells = <y>;
> >                 partition@0 {
> >                         ...;
> >                 };
> >         };
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
