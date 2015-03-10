From: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v5 1/4] PCI: Export symbols of PCI functions
Date: Tue, 10 Mar 2015 14:02:37 -0700
Message-ID: <54FF5BED.9090302@broadcom.com>
References: <1425947886-23705-1-git-send-email-rjui@broadcom.com> <1425947886-23705-2-git-send-email-rjui@broadcom.com> <20150310205651.GA32204@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150310205651.GA32204-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazau <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Bjorn,

On 3/10/2015 1:56 PM, Bjorn Helgaas wrote:
> On Mon, Mar 09, 2015 at 05:38:03PM -0700, Ray Jui wrote:
>> Export symbols of the following PCI functions so they can be referenced
>> by a PCI driver compiled as a kernel loadable module:
>>
>> pci_common_swizzle
>> pci_create_root_bus
>> pci_stop_root_bus
>> pci_remove_root_bus
>> pci_assign_unassigned_bus_resources
>> pci_fixup_irqs
> 
> Have you tested your driver as a loadable module?
> 
> If it works to load/unload/reload/etc., I'm OK with exporting these
> symbols.  I would prefer EXPORT_SYMBOL_GPL, though, because these don't
> constitute a very coherent interface right now, and they will likely be
> reworked.  For example, see Yijing Wang's work to sort out the
> pci_bus_add_devices() / resource assignment mess.
> 
> Bjorn

Yes, I tested the driver with load/unload/reload on Cygnus. Console logs
are included in my reply to Arnd's email from another email thread.

I'll wait for more feedback from you on the iProc PCIe driver itself.
But if you have reviewed them and think they are okay then I can go
ahead and submit v6 with changes to use EXPORT_SYMBOL_GPL.

Let me know.

Thanks,

Ray
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
