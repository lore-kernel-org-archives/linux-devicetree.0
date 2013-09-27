From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 3/3] PCI: imx6: Add support for i.MX6 PCIe controller
Date: Fri, 27 Sep 2013 10:19:27 +0800
Message-ID: <20130927021925.GF25146@S2101-09.ap.freescale.net>
References: <1379319655-20210-1-git-send-email-xobs@kosagi.com>
 <1379319655-20210-4-git-send-email-xobs@kosagi.com>
 <CAJ+vNU32oMZq=jrSCpk_ZjYc08kRBAqhOS8uYfor28gY8WGhnw@mail.gmail.com>
 <0E83723C55F66F43A6041464FE31119D3F7E6A@039-SN2MPN1-012.039d.mgd.msft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <0E83723C55F66F43A6041464FE31119D3F7E6A-RL0Hj/+nBVDAtPZc1oz0FK4g8xLGJsHaLnY5E4hWTkheoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhu Richard-R65037 <r65037-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>, Sean Cross <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 27, 2013 at 01:38:39AM +0000, Zhu Richard-R65037 wrote:
> Hi Tim:
> Thanks for your tests.
> Yes, it is. There are some problems when the PCIe switch is used on the 3.1x kernel at my side too, although the PCIe switch
> is ok on FSL imx_3.0.35 kernels.
> I'm debugging this issue now, and would summit the patches asap.
> 

>From what I read, it seems Sean's series does not support PCIe switch.
At least, he hasn't got any device to test it.  And there is some
problem with PCIe switch running the latest kernel, which might not be
related to the controller driver.

I suggest we ask Bjorn to merge the v7 I sent yesterday, so that people
can have a same base to work on, and add PCIe switch support with
incremental patches.   Does that sound good to you, Tim?

Shawn

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
