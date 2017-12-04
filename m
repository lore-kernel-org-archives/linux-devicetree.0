From: Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] of: dynamic: add overlay-allowed DT property
Date: Mon, 4 Dec 2017 14:12:16 -0600
Message-ID: <CANk1AXQ0KuzFucbTQ1LtF8F-XMqTw4y2xmVA-rqHcMAQH7hsnw@mail.gmail.com>
References: <20171204191357.3211-1-atull@kernel.org> <20171204191357.3211-3-atull@kernel.org>
 <CAL_Jsq+f4q=8rvxndbJNkp5KNMYRoKHs-zKOL1zwXfS0T2A3mA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+f4q=8rvxndbJNkp5KNMYRoKHs-zKOL1zwXfS0T2A3mA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 4, 2017 at 2:04 PM, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Mon, Dec 4, 2017 at 1:13 PM, Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> Allow DT nodes to be marked as valid targets for DT
>> overlays by the added "overlay-allowed" property.
>
> Why do you need a property for this? I'm not all that keen on putting
> this policy into the DT. It can change over time in the kernel. For
> example, as we define use cases that work, then we can loosen
> restrictions in the kernel.

For FPGA regions, I don't need it.  Yes, if the other patch is
accepted, I'm sure we will hear more from people who will need some
specific loosening.  I was trying to anticipate that, but I don't have
a specific need.

Alan

>
> Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
