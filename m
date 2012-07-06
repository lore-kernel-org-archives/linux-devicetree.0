From: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: OF_DYNAMIC usage
Date: Fri, 6 Jul 2012 10:57:08 -0700
Message-ID: <a5a955e0-679e-45b1-9508-495620ad2163@VA3EHSMHS002.ehs.local>
References: <4FF586D1.2050407@monstr.eu> <4FF594AD.6000401@gmail.com>
 <1341521210.6330.16.camel@pasglop> <4FF67F96.1040902@monstr.eu>
 <1341555562.6330.51.camel@pasglop> <4FF68ADE.3060609@monstr.eu>
 <1341558520.6330.54.camel@pasglop> <4FF69B83.3000400@monstr.eu>
 <1341562219.6330.57.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Class: urn:content-classes:message
In-Reply-To: <1341562219.6330.57.camel@pasglop>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: devicetree-discuss [mailto:devicetree-discuss-
> bounces+stephen.neuendorffer=xilinx.com-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org] On Behalf Of
> Benjamin Herrenschmidt
> Sent: Friday, July 06, 2012 1:10 AM
> To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Subject: Re: OF_DYNAMIC usage
> 
> On Fri, 2012-07-06 at 10:02 +0200, Michal Simek wrote:
> 
> > ok. How that FDT blob segment should look like?
> > It can't be just one node because it also requires path where it is
> connected.
> >
> > It means at least the part like below for injecting.
> 
> No, my idea was to pass 3 arguments:
> 
>  - action (enum)
>  - path (string)
>  - segment (blob)
> 
> action would be typically add/remove
> 
>  * add: add node under <path> whose content is in <segment>
> 
>  * remove: remove node <path> and all children
> 
> (or we could require children removal to be done explicitly).

I've implemented something like Michal's suggestion, although I never
worked out the details of removing.  Primarily, I was interested in the
slightly simpler case of a PCIe endpoint, whose contents are described
by a device tree.  This means that the device tree fragment has
to be able to be independent of its context.  Basically, I added a
function: 

+/**
+ * unflatten_partial_device_tree - create tree of device_nodes from
flat blob
+ *
+ * unflattens the device-tree passed by the firmware, creating the
+ * tree of struct device_node. It also fills the "name" and "type"
+ * pointers of the nodes so the normal device-tree walking functions
+ * can be used.
+ */
+void unflatten_partial_device_tree(unsigned long *blob, struct
device_node **mynodes)

That can be called by a device driver, like:

+       unflatten_partial_device_tree(drvdata->fw_entry->data,
+                                     &drvdata->child_nodes);
+
+       /* Generate child devices from the device tree */
+       of_platform_bus_probe(drvdata->child_nodes, NULL, &pdev->dev);

Part of the reason for implementing it this way is that it allows the
result to work on x86, where
there may not be a toplevel device tree, so adding and deleting device
nodes is handled at the device level, rather than having the device
trees themselves be dynamic.  The downside, of course it that it is
harder to get references from one device tree fragment into another.
However, in the case of either partial reconfiguration or PCIe, I think
this makes more sense than the OF_DYNAMIC way.

We demonstrated this working in a PCIe system and posted the patches
several years ago, but they were never mainlined, and the
architecture-independent device tree pieces have gone through a lot of
change since then.  Maybe Michal can get them to compile and post
updated versions for more comment?

Steve


> 
> Cheers,
> Ben.
> 
> > /dts-v1/;
> > / {
> > 	#address-cells = <1>;
> > 	#size-cells = <1>;
> > 	compatible = "xlnx,microblaze";
> >
> > 	mb_plb: plb@0 {
> > 		#address-cells = <1>;
> > 		#size-cells = <1>;
> > 		compatible = "xlnx,plb-v46-1.00.a", "simple-bus";
> > 		DIP_Switches_4Bit: gpio@81440000 {
> > 			#gpio-cells = <2>;
> > 			compatible = "xlnx,xps-gpio-1.00.a";
> > 			gpio-controller ;
> > 			reg = < 0x81440000 0x10000 >;
> > 			/* ... */
> > 		} ;
> > 	} ;
> > };
> >
> > Not sure if this can be used for removing. I mean if you want to
> remove node
> > if make sense to pass the whole node.
> >
> >
> > Thanks,
> > Michal
> >
> >
> 
> 
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss


This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
