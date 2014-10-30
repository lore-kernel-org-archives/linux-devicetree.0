From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 01/20] usb: dwc3: enable hibernation if to be supported
Date: Thu, 30 Oct 2014 12:35:56 +0100
Message-ID: <4077930.b7qzaS4pBb@wuerfel>
References: <1414663725-2195-1-git-send-email-ray.huang@amd.com> <1414663725-2195-2-git-send-email-ray.huang@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1414663725-2195-2-git-send-email-ray.huang@amd.com>
Sender: linux-pci-owner@vger.kernel.org
To: Huang Rui <ray.huang@amd.com>
Cc: Felipe Balbi <balbi@ti.com>, Alan Stern <stern@rowland.harvard.edu>, Bjorn Helgaas <bhelgaas@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Paul Zimmerman <Paul.Zimmerman@synopsys.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Jason Chang <jason.chang@amd.com>, Vincent Wan <vincent.wan@amd.com>, Tony Li <tony.li@amd.com>, linux-usb@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thursday 30 October 2014 18:08:26 Huang Rui wrote:
> It enables hibernation if the function is set in coreConsultant.
> 
> Suggested-by: Felipe Balbi <balbi@ti.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Felipe Balbi <balbi@ti.com>
> 

Something went wrong with the Signed-off-by lines here. 
You should never add someone else's Signed-off-by below yours.

I took a brief look at the entire series and the patches all look good
to me, but you have made the same mistake with the Signed-off-by
multiple times.

	Arnd
