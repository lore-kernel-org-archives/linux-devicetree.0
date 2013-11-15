From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Strange location and name for platform  devices when device-tree is used.
Date: Fri, 15 Nov 2013 16:37:25 +0900
Message-ID: <20131115073725.83C11C407FE@trevor.secretlab.ca>
References: <20131101145925.66e22f73@notabene.brown> <1383279744.28909.26. camel@pasglop> <1383280054.28909.30.camel@pasglop> <20131101160329.37f3707b @notabene.brown> <1383282516.28909.36.camel@pasglop> <20131101180459. 81793C40A28@trevor.secretlab.ca> <1383338001.28909.42.camel@pasglop>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383338001.28909.42.camel@pasglop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, 02 Nov 2013 07:33:21 +1100, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> On Fri, 2013-11-01 at 11:04 -0700, Grant Likely wrote:
> 
> > There are two problems here. First, making the change moves all the DT
> > populated devices under the /sys/devices/platform tree, not just
> > platform devices.
> 
> All DT populated *platform* devices. There are others that have their
> own locations.

They are all in the same tree! Move the platform devices and everything
else moves to because they are under them.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
