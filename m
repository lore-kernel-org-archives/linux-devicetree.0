From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 0/2] of: Add whitelist
Date: Wed, 29 Nov 2017 07:31:27 -0600
Message-ID: <CAL_JsqL5gYh_++1wDLMYjO7MXKOHpzr315FZ1tuN9o5tOe7TYA@mail.gmail.com>
References: <1511816284-12145-1-git-send-email-atull@kernel.org> <da4c9b29-eccc-6a67-291a-73a36c1598b5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <da4c9b29-eccc-6a67-291a-73a36c1598b5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 29, 2017 at 3:20 AM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 11/27/17 15:58, Alan Tull wrote:
>> Here's a proposal for a whitelist to lock down the dynamic device tree.
>>
>> For an overlay to be accepted, all of its targets are required to be
>> on a target node whitelist.
>>
>> Currently the only way I have to get on the whitelist is calling a
>> function to add a node.  That works for fpga regions, but I think
>> other uses will need a way of having adding specific nodes from the
>> base device tree, such as by adding a property like 'allow-overlay;'
>> or 'allow-overlay = "okay";' If that is acceptable, I could use some
>> advice on where that particular code should go.
>>
>> Alan
>>
>> Alan Tull (2):
>>   of: overlay: add whitelist
>>   fpga: of region: add of-fpga-region to whitelist
>>
>>  drivers/fpga/of-fpga-region.c |  9 ++++++
>>  drivers/of/overlay.c          | 73 +++++++++++++++++++++++++++++++++++++++++++
>>  include/linux/of.h            | 12 +++++++
>>  3 files changed, 94 insertions(+)
>>
>
> The plan was to use connectors to restrict where an overlay could be applied.
> I would prefer not to have multiple methods for accomplishing the same thing
> unless there is a compelling reason to do so.

Connector nodes need a mechanism to enable themselves, too. I don't
think connector nodes are going to solve every usecase.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
