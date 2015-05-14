From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH v4 19/21] drivers/of: Support adding sub-tree
Date: Thu, 14 May 2015 17:29:04 +1000
Message-ID: <1431588544.4160.43.camel@kernel.crashing.org>
References: <1430460188-31343-1-git-send-email-gwshan@linux.vnet.ibm.com>
	 <1430460188-31343-20-git-send-email-gwshan@linux.vnet.ibm.com>
	 <CAL_JsqKEUevxSe0Q=pGdsWOiT+TW9iAnCsAWuuqOYj3ZPOG7dg@mail.gmail.com>
	 <1430493730.7979.58.camel@kernel.crashing.org>
	 <CAL_JsqLrBSB4y_0j+i=kXbDA08HO23JuYjJGHR9nhsPnMC_Zyg@mail.gmail.com>
	 <1430521038.7979.70.camel@kernel.crashing.org>
	 <A6DF99C6-7059-4670-86D0-6926861F0164@antoniou-consulting.com>
	 <1430774063.7979.139.camel@kernel.crashing.org>
	 <1431560124.20218.91.camel@kernel.crashing.org>
	 <CAL_JsqKqTa5eg3eOqx3bkeNdO_920WwDiRbQaxwWLEWpCypFmA@mail.gmail.com>
	 <1431564871.4160.8.camel@kernel.crashing.org>
	 <53EAE361-0015-4702-97C6-9F67B87963C2@antoniou-consulting.com>
	 <1431585994.4160.32.camel@kernel.crashing.org>
	 <3988EABE-3DE9-4E1C-9778-22E35138E359@antoniou-consulting.com>
	 <1431587657.4160.37.camel@kernel.crashing.org>
	 <75F026CA-5AC1-4106-B2F0-AB0D006DEF5A@antoniou-consulting.com>
	 <1431588358.4160.42.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1431588358.4160.42.camel@kernel.crashing.org>
Sender: linux-pci-owner@vger.kernel.org
To: Pantelis Antoniou <panto@antoniou-consulting.com>
Cc: Rob Herring <robherring2@gmail.com>, Gavin Shan <gwshan@linux.vnet.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


> So I would have to do a special case on unplug:
> 
> 	if (slot->dt_is_overlay) /* set to false at boot */
> 		remove_subtree_myself();
> 	else
> 		undo_overlay(slot->overlay);

Of course I just inverted the polarity of the if () in the example :-)

But you get the idea...
