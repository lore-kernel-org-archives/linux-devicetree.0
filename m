From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] of: fix PCI bus match for PCIe slots
Date: Tue, 04 Feb 2014 16:54:53 +0000
Message-ID: <20140204165453.37FFDC418B6@trevor.secretlab.ca>
References: <1391441463-12461-1-git-send-email-klebers@linux.vnet.ibm.com> < 20140204143238.E17E3C407C9@trevor.secretlab.ca> < CAL_JsqLjxM3waG+LkQr0NfwhjrJ039v6PQneN=cyfUS2d8=5aQ@mail.gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLjxM3waG+LkQr0NfwhjrJ039v6PQneN=cyfUS2d8=5aQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kleber Sacilotto de Souza <klebers-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Brian King <brking-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 4 Feb 2014 08:44:43 -0600, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, Feb 4, 2014 at 8:32 AM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > On Mon,  3 Feb 2014 13:31:03 -0200, Kleber Sacilotto de Souza <klebers-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org> wrote:
> >> On IBM pseries systems the device_type device-tree property of a PCIe
> >> bridge contains the string "pciex". The of_bus_pci_match() function was
> >> looking only for "pci" on this property, so in such cases the bus
> >> matching code was falling back to the default bus, causing problems on
> >> functions that should be using "assigned-addresses" for region address
> >> translation. This patch fixes the problem by also looking for "pciex" on
> >> the PCI bus match function.
> >>
> >> v2: added comment
> >>
> >> Signed-off-by: Kleber Sacilotto de Souza <klebers-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> >
> > Applied, thanks.
> 
> I was planning to apply for 3.14 and stable.

Okay, I'll drop it and let you pick it up. You can add my:

Acked-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
