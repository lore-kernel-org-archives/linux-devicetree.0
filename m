From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH v4 19/21] drivers/of: Support adding sub-tree
Date: Sat, 02 May 2015 01:22:10 +1000
Message-ID: <1430493730.7979.58.camel@kernel.crashing.org>
References: <1430460188-31343-1-git-send-email-gwshan@linux.vnet.ibm.com>
	 <1430460188-31343-20-git-send-email-gwshan@linux.vnet.ibm.com>
	 <CAL_JsqKEUevxSe0Q=pGdsWOiT+TW9iAnCsAWuuqOYj3ZPOG7dg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKEUevxSe0Q=pGdsWOiT+TW9iAnCsAWuuqOYj3ZPOG7dg@mail.gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Gavin Shan <gwshan@linux.vnet.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2015-05-01 at 07:54 -0500, Rob Herring wrote:

> The difference seems to be whether you allocate space or just point to
> the FDT for various strings/data. Is that right?
> 
> >    * of_fdt_add_subtree() is the introduced API to do the work.
> 
> Have you looked at overlays and if so why do they not work for your purposes?
> 
> Why do you need to do this with the flattened tree?

The basic idea I asked Gavin to implement is that since the FW needs to
provide a bunch of DT updates to Linux at runtime in the form of new
nodes below an existing one, rather than doing it via some new/custom
format, instead, have it send a bit of FDT blob to expand under an
existing node.

As for the details of Gavin implementation, I haven't looked at it in
details yet so there might be issues there, however I don't know what
you mean by "overlays", any pointer ?

Cheers,
Ben.
