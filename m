From: Mathias Nyman <mathias.nyman-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCHv5 07/20] usb: host: xhci-plat: add clock support
Date: Mon, 12 May 2014 20:43:59 +0300
Message-ID: <5371085F.2010400@linux.intel.com>
References: <1399832288-19899-1-git-send-email-thomas.petazzoni@free-electrons.com> <1399832288-19899-8-git-send-email-thomas.petazzoni@free-electrons.com> <5370DEC7.9080708@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5370DEC7.9080708-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/12/2014 05:46 PM, Gregory CLEMENT wrote:
> Hi Mathias, Felipe,
>
> On 11/05/2014 20:17, Thomas Petazzoni wrote:
>> From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>>
>> Some platforms (such as the Armada 38x ones) can gate the clock of
>> their USB controller. This patch adds the support for one clock in
>> xhci-plat, by enabling it during probe and disabling it on remove.
>>
>> To achieve this, it adds a 'struct clk *' member in xhci_hcd. While
>> only used for now in xhci-plat, it might be used by other drivers in
>> the future. Moreover, the xhci_hcd structure already holds other
>> members such as msix_count and msix_entries, which are MSI-X specific,
>> and therefore only used by xhci-pci.
>
> Felpie,
>
> would you agree to add your acked-by on this patch. You gave it on
> the 3rd version however as pointed by Thomas there was some issues,
> what do you think of this version?
>
>
> Mathias,
>
> as the xHCI maintainer what is your opinion on this patch. Do you plan
> to take it? do you expect a pull request?
>
> We submitted the first version of this series one month ago and we didn't
> receive any feedback from you. Maybe it was just because you were happy
> with the patch sent, but I would like to be sure that you noticed this
> series.
>
> I have the same question for the patch before: "[PATCHv5 06/20] usb: host:
> xhci-plat: sort the headers in alphabetic order" and the three following:
> "[PATCHv5 07/20] usb: host: xhci-plat: add clock support", "[PATCHv5 08/20]
>   usb: host: xhci-plat: add support for the Armada 375/38x XHCI controllers"
> and "[PATCHv5 09/20] Documentation: dt-bindings: update xhci-platform DT
> binding".
>

Hi

Sorry about the delay, Only thing I found was a sparse warning, otherwise looks ok.

-Mathias

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
