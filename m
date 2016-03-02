From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v8 42/45] drivers/of: Rename unflatten_dt_node()
Date: Tue, 1 Mar 2016 20:40:12 -0600
Message-ID: <CAL_JsqJFacEMD6jwi=YsT83BTVp5Asjmw4nYU6Msct-DcR2W9Q@mail.gmail.com>
References: <1455680668-23298-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1455680668-23298-43-git-send-email-gwshan@linux.vnet.ibm.com>
 <CAL_JsqJydgmkU=SGcr-0JHsYG8wXk5GEQCQXY7y+FHH2A0LZkw@mail.gmail.com> <20160219031655.GA10818@gwshan>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160219031655.GA10818@gwshan>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, aik-sLpHqDYs0B2HXe+LvDLADg@public.gmane.org, dja-Yfaxwxk/+vWsTnJN9+BGXg@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 18, 2016 at 9:16 PM, Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org> wrote:
> On Wed, Feb 17, 2016 at 08:59:53AM -0600, Rob Herring wrote:
>>On Tue, Feb 16, 2016 at 9:44 PM, Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org> wrote:
>>> This renames unflatten_dt_node() to unflatten_dt_nodes() as it
>>> populates multiple device nodes from FDT blob. No logical changes
>>> introduced.
>>>
>>> Signed-off-by: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
>>> ---
>>>  drivers/of/fdt.c | 14 +++++++-------
>>>  1 file changed, 7 insertions(+), 7 deletions(-)
>>
>>Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>
>>I'm happy to take patches 40-42 for 4.6 if the rest of the series
>>doesn't go in given they fix a separate problem. I just need to know
>>soon (or at least they need to go into -next soon).
>>
>
> Thanks for quick response, Rob. It depends how much comments I will
> receive for the powerpc/powernv part. Except that, all parts including
> this one have been ack'ed. I can discuss it with Michael Ellerman.
> By the way, how soon you need the decision to merge 40-42? If that's
> one or two weeks later, I don't think the reivew on the whole series
> can be done.

Well, it's been 2 weeks now. I need to know this week.

> Also, I think you probably can merge 40-44 as they're all about
> fdt.c. If they can be merged at one time, I needn't bother (cc)
> you again if I need send a updated revision. Thanks for your
> review.

I did not include 43 and 44 as they are only needed for the rest of your series.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
