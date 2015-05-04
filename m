From: Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 19/21] drivers/of: Support adding sub-tree
Date: Mon, 4 May 2015 10:23:14 +1000
Message-ID: <20150504002314.GA12518@gwshan>
References: <1430460188-31343-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1430460188-31343-20-git-send-email-gwshan@linux.vnet.ibm.com>
 <CAL_JsqKEUevxSe0Q=pGdsWOiT+TW9iAnCsAWuuqOYj3ZPOG7dg@mail.gmail.com>
 <1430493730.7979.58.camel@kernel.crashing.org>
 <CAL_JsqLrBSB4y_0j+i=kXbDA08HO23JuYjJGHR9nhsPnMC_Zyg@mail.gmail.com>
 <1430521038.7979.70.camel@kernel.crashing.org>
 <1430522976.7979.78.camel@kernel.crashing.org>
Reply-To: Gavin Shan <gwshan@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1430522976.7979.78.camel@kernel.crashing.org>
Sender: linux-pci-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Rob Herring <robherring2@gmail.com>, Gavin Shan <gwshan@linux.vnet.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sat, May 02, 2015 at 09:29:36AM +1000, Benjamin Herrenschmidt wrote:
>On Sat, 2015-05-02 at 08:57 +1000, Benjamin Herrenschmidt wrote:
>
>> > Overlay = an FDT blob to graft into a live running system. Sounds like
>> > the same thing.
>> > 
>> > > As for the details of Gavin implementation, I haven't looked at it in
>> > > details yet so there might be issues there, however I don't know what
>> > > you mean by "overlays", any pointer ?
>> > 
>> > CONFIG_OF_OVERLAY
>> > 
>> > http://events.linuxfoundation.org/sites/events/files/slides/dynamic-dt-keynote-v3.pdf
>> 
>> Well, that looks horrendously complicated, poorly documented and totally
>> unused in-tree outside of the unittest stuff, yay ! It has all sort of
>> "features" that I don't really care about.
>
>Looking a bit more at it, I don't quite see how I can attach a subtree
>using that stuff.
>
>Instead, each node in the overlay seems to need extra nodes and
>properties to refer to the original.
>
>So the FW would essentially have to create something a lot more complex
>than just reflattening a bit of its internal tree. For each internal
>node, it will need to add all those __overlay__ nodes and properties.
>
>That is not going to fly for me at all. It's order of magnitudes more
>complex than the solution we are pursuing.
>
>So I think for our use case, we should continue in the direction of
>having a helper to unflatten a piece of FDT underneath an existing
>node. I don't like the "HYBRID" stuff though, we should not refer to
>the original FDT, we should just make them normal dynamic nodes.
>

The original FDT from firmware is copied over to the memory chunk
allocated from slab by kernel. So we refer to the copy of the FDT,
not original one. Yeah, "HYBRID" wouldn't be a good idea. If we
want make all device nodes and properties of the sub-tree "DYNAMIC",
the FDT hasn't to be copied over from skiboot to kernel, indicating
those dynamic device nodes and properties in the subtree can be
figured out directly from the FDT blob, which is owned by firmware.

Also, it just need small changes to code what we have. Not too much
changes needed.

Thanks,
Gavin
