From: Stefano Stabellini <stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>
Subject: Re: [PATCH v3 06/25] docs: Xen ARM DT bindings
Date: Wed, 12 Sep 2012 19:14:58 +0100
Message-ID: <alpine.DEB.2.02.1209121849200.15568@kaball.uk.xensource.com>
References: <alpine.DEB.2.02.1208161618550.4850@kaball.uk.xensource.com>
	<1345131377-14713-6-git-send-email-stefano.stabellini@eu.citrix.com>
	<503BFCD8.5090804@gmail.com>
	<alpine.DEB.2.02.1208281823270.15568@kaball.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1208281823270.15568-7Z66fg9igcxYtxbxJUhB2Dgeux46jI+i@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Stefano Stabellini <Stefano.Stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>
Cc: "xen-devel-GuqFBffKawuULHF6PoxzQEEOCMrvLtNR@public.gmane.org" <xen-devel-GuqFBffKawuULHF6PoxzQEEOCMrvLtNR@public.gmane.org>, "linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org" <linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Ian Campbell <Ian.Campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "konrad.wilk-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org" <konrad.wilk-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, "catalin.marinas-5wv7dgnIgG8@public.gmane.org" <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "Tim (Xen.org)" <tim-LM2mM/qkH7s@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Vrabel <david.vrabel-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 12 Sep 2012, Stefano Stabellini wrote:
> On Tue, 28 Aug 2012, Rob Herring wrote:
> > You should look at ePAPR 1.1 which defines hypervisor related bindings.
> > While it is a PPC doc, we should reuse or extend what makes sense.
> > 
> > See section 7.5:
> > 
> > https://www.power.org/resources/downloads/Power_ePAPR_APPROVED_v1.1.pdf
> 
> Thanks for the link, I wasn't aware of ePAPR.
> 
> The hypervisor node defined by ePAPR is not very different from what I
> am proposing. Should I try to be compatible with the hypervisor
> specification above (as in compatible = "epapr,hypervisor-1.1")?
> Or should I just use it as a reference for my own specification?
> 
> Personally I would rather avoid full compatibility with ePAPR.

In particular reading section 7.5, these are the required properties of
the ePAPR hypervisor node:

- compatible = "epapr,hypervisor-1.1"
compared to what I am proposing, it is laking information about what
hypervisor we are talking about (xen, kvm, vmware, etc) and the version
of the ABI (xen-4.2).

- hcall-instructions
potentially interesting, but given that for Xen we are quite happy with
HVC, we are not going to add any secondary hypercall mechanisms,
therefore at the moment it would just result in a BUG if the specified
hcall instruction is != HVC. Besides if somebody else wanted to
implemented the Xen hypercall interface in a different way they could
just reimplement the hypercall wrappers, that would be easier than
trying to do it with this property.

- guest-id
we usually make a point in trying not to tell the guest its own domid
because if the VM gets migrated to a different host it acquires a new
domid, therefore it should not rely on it.

- guest-name
we could pass the guest name here, but I don't see how it could be
of any use.



On the other hand, thinking more about what Xen needs in the device
tree, I think we could improve the current spec by clarifying the
meaning of the memory region and interrupt properties we currently
require. I thought about moving them to two separate children node with
an explicit name:

---

* Xen hypervisor device tree bindings

Xen ARM virtual platforms shall have the following properties and
children nodes:

- compatible property:
	compatible = "xen,xen", "xen,xen-<version>";
  where <version> is the version of the Xen ABI of the platform.

- grant_table child with the following properties:
    - name:
	    name = "grant_table";
	- reg: specifies the base physical address and size of a region in
	    memory where the grant table should be mapped to, using an
        HYPERVISOR_memory_op hypercall. 

- events child with the following properties:
    - name:
        name = "events";
	- interrupts: the interrupt used by Xen to inject event notifications.


Example:
hypervisor {
		compatible = "xen,xen", "xen,xen-4.2";
		#address-cells = <1>;
		#size-cells = <1>;
		#interrupt-cells = <3>;
		ranges = <0xb0000000 0xb0000000 0x20000>;

		grant_table {
			name = "grant_table";
			reg = <0xb0000000 0x20000>;
		};

		events {
			name = "events";
			interrupts = <1 15 0xf08>;
		};
	};
