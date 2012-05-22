From: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2 07/12] ARM: imx6q: add config-on-boot gpios
Date: Tue, 22 May 2012 14:07:14 +0800
Message-ID: <20120522060713.GS6206@b20223-02.ap.freescale.net>
References: <1337592237-5090-1-git-send-email-richard.zhao@freescale.com>
 <201205220722.00653.marex@denx.de>
 <CAAQ0ZWSS3ONsF=MLQOJ2u1h3mGErfZ4W2QoSNk4+MQHTC830MQ@mail.gmail.com>
 <201205220727.30910.marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201205220727.30910.marex-ynQEQJNshbs@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-MeMPY/F8WlbQT0dZR+AlfA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 22, 2012 at 07:27:30AM +0200, Marek Vasut wrote:
> Dear Shawn Guo,
> 
> > On 22 May 2012 13:22, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org> wrote:
> > > Something like that ... but didn't Linus complain that we have too many
> > > files in arch/arm/ ?
> > 
> > So what do you exactly mean by per-board driver?
> 
> Exactly such fixup as there's for mx6q-sabrelite. But then, if you have too 
> broken bootloader, you'll need such a fixup for every such board. Or do you want 
> to let mach-imx6q.c grow in size with each broken board?
As Shawn said, this patch is trying to abstract common things.
We don't need to repeat the code that interpret output-gpios.

Generally discuss often draw no conclusion. So let's talk about
code.

Thanks
Richard
> 
> > Regards,
> > Shawn
> 
> Best regards,
> Marek Vasut
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
