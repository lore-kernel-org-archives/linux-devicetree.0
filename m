From: Amit Tomer <amittomer25-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7] PCI: Xilinx-NWL-PCIe: Added support for Xilinx NWL
 PCIe Host Controller
Date: Wed, 4 Nov 2015 13:14:29 +0530
Message-ID: <CABHD4K_BWU7-c1NM0y5ZwFkfpG0+c9_9DpwyNXNcTvavmy8rJw@mail.gmail.com>
References: <1446564227-4704-1-git-send-email-bharatku@xilinx.com>
	<5638DE62.6050605@arm.com>
	<8520D5D51A55D047800579B09414719801693C20@XAP-PVEXMBX01.xlnx.xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8520D5D51A55D047800579B09414719801693C20-4lKfpRxZ5enZMOc0yg5rMog+Gb3gawCHQz34XiSyOiE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bharat Kumar Gogada <bharat.kumar.gogada-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michal Simek <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Soren Brinkmann <sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "tinamdar-qTEPVZfXA3Y@public.gmane.org" <tinamdar-qTEPVZfXA3Y@public.gmane.org>, "treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org" <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "m-karicheri2-l0cyMroinI0@public.gmane.org" <m-karicheri2-l0cyMroinI0@public.gmane.org>, "hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org" <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, "dhdang-qTEPVZfXA3Y@public.gmane.org" <dhdang-qTEPVZfXA3Y@public.gmane.org>, "sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org" <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ravikiran Gummaluri <rgummal@xilin>
List-Id: devicetree@vger.kernel.org

> Without #ifdefs if we compile driver for legacy, MSI structures will not be available and we get compile time error.

Sorry for nitpicking but at least can we use elegant version of
#ifdefs .i.e. #if IS_ENABLED() here ?

Thanks,
Amit.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
