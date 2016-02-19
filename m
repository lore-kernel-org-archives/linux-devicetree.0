From: Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: Re: [PATCH v8 42/45] drivers/of: Rename unflatten_dt_node()
Date: Fri, 19 Feb 2016 14:16:55 +1100
Message-ID: <20160219031655.GA10818@gwshan>
References: <1455680668-23298-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1455680668-23298-43-git-send-email-gwshan@linux.vnet.ibm.com>
 <CAL_JsqJydgmkU=SGcr-0JHsYG8wXk5GEQCQXY7y+FHH2A0LZkw@mail.gmail.com>
Reply-To: Gavin Shan <gwshan@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJydgmkU=SGcr-0JHsYG8wXk5GEQCQXY7y+FHH2A0LZkw@mail.gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Gavin Shan <gwshan@linux.vnet.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, aik@ozlabs.ru, dja@axtens.net, Bjorn Helgaas <bhelgaas@google.com>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 17, 2016 at 08:59:53AM -0600, Rob Herring wrote:
>On Tue, Feb 16, 2016 at 9:44 PM, Gavin Shan <gwshan@linux.vnet.ibm.com> wrote:
>> This renames unflatten_dt_node() to unflatten_dt_nodes() as it
>> populates multiple device nodes from FDT blob. No logical changes
>> introduced.
>>
>> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
>> ---
>>  drivers/of/fdt.c | 14 +++++++-------
>>  1 file changed, 7 insertions(+), 7 deletions(-)
>
>Acked-by: Rob Herring <robh@kernel.org>
>
>I'm happy to take patches 40-42 for 4.6 if the rest of the series
>doesn't go in given they fix a separate problem. I just need to know
>soon (or at least they need to go into -next soon).
>

Thanks for quick response, Rob. It depends how much comments I will
receive for the powerpc/powernv part. Except that, all parts including
this one have been ack'ed. I can discuss it with Michael Ellerman.
By the way, how soon you need the decision to merge 40-42? If that's
one or two weeks later, I don't think the reivew on the whole series
can be done.

Also, I think you probably can merge 40-44 as they're all about
fdt.c. If they can be merged at one time, I needn't bother (cc)
you again if I need send a updated revision. Thanks for your
review.

Thanks,
Gavin

>Rob
>
