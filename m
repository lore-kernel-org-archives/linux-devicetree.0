From: Mohit KUMAR DCG <Mohit.KUMAR-qxv4g6HH51o@public.gmane.org>
Subject: RE: [PATCH v3 0/4] dra7: Add PCIe support
Date: Wed, 23 Jul 2014 12:17:52 +0800
Message-ID: <2CC2A0A4A178534D93D5159BF3BCB661A61189AF02@EAPEX1MAIL1.st.com>
References: <1405587643-13808-1-git-send-email-kishon@ti.com>
 <20140722213306.GB25432@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140722213306.GB25432-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Bjorn,

> -----Original Message-----
> From: Bjorn Helgaas [mailto:bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org]
> Sent: Wednesday, July 23, 2014 3:03 AM
> To: Kishon Vijay Abraham I
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-
> pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org; Mohit KUMAR DCG; linux-
> kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
> Subject: Re: [PATCH v3 0/4] dra7: Add PCIe support
> 
> On Thu, Jul 17, 2014 at 02:30:39PM +0530, Kishon Vijay Abraham I wrote:
> > Changes from v2:
> > * Added myself as MAINTAINER of pcie dra7xx driver

[...]

> 
> I applied these to pci/host-designware for v3.17.  This will not be in my first
> pull request because I'm going on vacation and won't have time to get
> everything through -next and tagged.  But I'm planning a second pull request
> that will include this.
> 
> Mohit, I applied your ack of "use untranslated address" from the v1 posting
> (your mail of Jul 09) to the corresponding patch here, since Kishon didn't
> carry it forward.  Let me know if that's not OK.

- yes, OK with me. 

Thanks
Mohit
> 
> I also squashed the last two patches into one so the DT binding
> documentation goes along with the dra7xx driver addition.
> 
> Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
