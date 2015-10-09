From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 1/4] Docs: dt: Add PCI MSI map bindings
Date: Fri, 9 Oct 2015 13:00:51 -0500
Message-ID: <CAL_Jsq+Jk_HoQ_vGWbEak2HNAXYG4J=LBVWk7_LoRBzG2_pkqQ@mail.gmail.com>
References: <1444342250-6196-1-git-send-email-ddaney.cavm@gmail.com>
 <1444342250-6196-2-git-send-email-ddaney.cavm@gmail.com> <CAL_JsqK1kB30h=zse1LcaBisjYEGSBhD4FutvtqbUxpSU+2NjA@mail.gmail.com>
 <5617E75F.2090907@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5617E75F.2090907-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 9, 2015 at 11:12 AM, David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org> wrote:
> On 10/09/2015 06:20 AM, Rob Herring wrote:
>>
>> On Thu, Oct 8, 2015 at 5:10 PM, David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>
>>> From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>>>
>>> Currently msi-parent is used by a few bindings to describe the
>>> relationship between a PCI root complex and a single MSI controller, but
>>> this property does not have a generic binding document.
>>>
>>> Additionally, msi-parent is insufficient to describe more complex
>>> relationships between MSI controllers and devices under a root complex,
>>> where devices may be able to target multiple MSI controllers, or where
>>> MSI controllers use (non-probeable) sideband information to distinguish
>>> devices.
>>>
>>> This patch adds a generic binding for mapping PCI devices to MSI
>>> controllers. This document covers msi-parent, and a new msi-map property
>>> (specific to PCI*) which may be used to map devices (identified by their
>>> Requester ID) to sideband data for each MSI controller that they may
>>> target.
>>>
>>> Acked-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
>>> Signed-off-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>>> Signed-off-by: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>>
>>
>> I acked v3. Please add it so I can stop paying attention.
>>
>
> My apologies for missing that.
>
> The Acked-by is now in my local tree.  Can the MSI maintainer take it as is
> and add your Acked-by?  If not, I can resend with this added.

Usually they should pick up acks on the current version, but not
previous versions. Given the discussion here though, that should be
enough. IOW, don't resend stuff just to add acks.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
