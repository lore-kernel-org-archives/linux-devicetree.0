From: Mathias Nyman <mathias.nyman-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCHv5 08/20] usb: host: xhci-plat: add support for the Armada
 375/38x XHCI controllers
Date: Tue, 13 May 2014 11:24:51 +0300
Message-ID: <5371D6D3.6060809@linux.intel.com>
References: <1399832288-19899-1-git-send-email-thomas.petazzoni@free-electrons.com>	<1399832288-19899-9-git-send-email-thomas.petazzoni@free-electrons.com>	<537103DD.5030906@linux.intel.com> <20140512193617.011aa958@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140512193617.011aa958-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/12/2014 08:36 PM, Thomas Petazzoni wrote:
> Dear Mathias Nyman,
>
> On Mon, 12 May 2014 20:24:45 +0300, Mathias Nyman wrote:
>
>>> +int xhci_mvebu_mbus_init_quirk(struct platform_device *pdev)
>>> +{
>>> +	struct resource	*res;
>>> +	void __iomem *base;
>>> +	const struct mbus_dram_target_info *dram;
>>
>> Hi
>>
>> Sparse warns about this:
>>
>> drivers/usb/host/xhci-mvebu.c:42:5: warning: symbol 'xhci_mvebu_mbus_init_quirk'
>> was not declared. Should it be static?
>
> Not, it should not: it gets called from xhci-plat.c. However,
> xhci-mvebu.c should include its header xhci-mvebu.h so that sparse
> realize that the function is voluntarily exported, and that therefore
> not having the static qualifier is expected.
>
> Should we resend a v6 with just this change?
>

Not if this is the only thing that needs fixing.
But if you anyway need to make a new version (Kishon had some remarks) then please 
include the header to xhci-mvebu at the same time.

-Mathias

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
