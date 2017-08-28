From: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v8 2/3] PCI: iproc: retry request when CRS returned from
 EP
Date: Mon, 28 Aug 2017 14:17:09 -0500
Message-ID: <20170828191708.GJ8154@bhelgaas-glaptop.roam.corp.google.com>
References: <1503551066-23212-1-git-send-email-oza.oza@broadcom.com>
 <1503551066-23212-3-git-send-email-oza.oza@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1503551066-23212-3-git-send-email-oza.oza-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Oza Pawandeep <oza.oza-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Andy Gospodarek <gospo-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Oza Pawandeep <oza.pawandeep-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 24, 2017 at 10:34:25AM +0530, Oza Pawandeep wrote:
> PCIe spec r3.1, sec 2.3.2
> If CRS software visibility is not enabled, the RC must reissue the
> config request as a new request.
> 
> - If CRS software visibility is enabled,
> - for a config read of Vendor ID, the RC must return 0x0001 data
> - for all other config reads/writes, the RC must reissue the
>   request
> 
> iproc PCIe Controller spec:
> 4.7.3.3. Retry Status On Configuration Cycle
> Endpoints are allowed to generate retry status on configuration
> cycles. In this case, the RC needs to re-issue the request. The IP
> does not handle this because the number of configuration cycles needed
> will probably be less than the total number of non-posted operations
> needed.
> 
> When a retry status is received on the User RX interface for a
> configuration request that was sent on the User TX interface,
> it will be indicated with a completion with the CMPL_STATUS field set
> to 2=CRS, and the user will have to find the address and data values
> and send a new transaction on the User TX interface.
> When the internal configuration space returns a retry status during a
> configuration cycle (user_cscfg = 1) on the Command/Status interface,
> the pcie_cscrs will assert with the pcie_csack signal to indicate the
> CRS status.
> When the CRS Software Visibility Enable register in the Root Control
> register is enabled, the IP will return the data value to 0x0001 for
> the Vendor ID value and 0xffff  (all 1’s) for the rest of the data in
> the request for reads of offset 0 that return with CRS status.  This
> is true for both the User RX Interface and for the Command/Status
> interface.  When CRS Software Visibility is enabled, the CMPL_STATUS
> field of the completion on the User RX Interface will not be 2=CRS and
> the pcie_cscrs signal will not assert on the Command/Status interface.
> 
> Per PCIe r3.1, sec 2.3.2, config requests that receive completions
> with Configuration Request Retry Status (CRS) should be reissued by
> the hardware except reads of the Vendor ID when CRS Software
> Visibility is enabled.
> 
> This hardware never reissues configuration requests when it receives
> CRS completions.
> Note that, neither PCIe host bridge nor PCIe core re-issues the
> request for any configuration offset.
> 
> For config reads, this hardware returns CFG_RETRY_STATUS data when
> it receives a CRS completion for a config read, regardless of the
> address of the read or the CRS Software Visibility Enable bit.

I can't remember how Stingray handles the CRS Software Visibility Enable
bit.  Is it a read-only zero?  Is it writable?  Does the hardware look at
it all (I think not)?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
