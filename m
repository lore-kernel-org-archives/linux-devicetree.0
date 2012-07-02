From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH 5/5] usb: gadget: composite: parse dt overrides
Date: Mon, 02 Jul 2012 17:46:45 -0500
Message-ID: <4FF224D5.5090602@gmail.com>
References: <1340720833-781-1-git-send-email-aletes.xgr@gmail.com> <1340720833-781-6-git-send-email-aletes.xgr@gmail.com> <20120702073522.GE16670@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20120702073522.GE16670@arwen.pp.htv.fi>
Sender: linux-doc-owner@vger.kernel.org
To: balbi@ti.com
Cc: Alexandre Pereira da Silva <aletes.xgr@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Landley <rob@landley.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Li Yang <leoli@freescale.com>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Roland Stigge <stigge@antcom.de>
List-Id: devicetree@vger.kernel.org

On 07/02/2012 02:35 AM, Felipe Balbi wrote:
> Hi,
> 
> On Tue, Jun 26, 2012 at 11:27:13AM -0300, Alexandre Pereira da Silva wrote:
>> Grab the devicetree node properties to override VendorId, ProductId,
>> bcdDevice, Manucacturer, Product and SerialNumber
>>
>> Signed-off-by: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
> 
> I need Grant's acked-by to queue this one.
> 

Grant is pretty much offline for the next 2 months, so:

Acked-by: Rob Herring <rob.herring@calxeda.com>

Rob
