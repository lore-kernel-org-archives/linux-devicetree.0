From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH 2/2] iio: mxs-lradc: check ranges of ts properties
Date: Fri, 26 Dec 2014 21:50:37 +0100 (CET)
Message-ID: <1377154085.658607.1419627037868.JavaMail.open-xchange@oxbaltgw05.schlund.de>
References: <1419250476-2393-1-git-send-email-stefan.wahren@i2se.com> <1419250476-2393-3-git-send-email-stefan.wahren@i2se.com> <549D2905.4050801@kernel.org>
Reply-To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <549D2905.4050801-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: kristina.martsenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jonathan,

> Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> hat am 26. Dezember 2014 um 10:23
> geschrieben:
>
> [...]
> >
> > - lradc->over_sample_delay = 2;
> > - ret = of_property_read_u32(lradc_node, "fsl,ave-delay", &adapt);
> > - if (ret == 0)
> > + if (of_property_read_u32(lradc_node, "fsl,ave-delay", &adapt)) {
> > + lradc->over_sample_delay = 2;
> > + } else {
> > + if (adapt < 2 || adapt > LRADC_DELAY_DELAY_MASK+1) {
> please run checkpatch.pl over these. Should be spaces around the +

i'm afraid my checkpatch.pl doesn't find this issue. I'll fix it in the next
version.

Stefan
