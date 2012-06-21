From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patch v5 08/13] ARM: imx6q: add config-on-boot gpios
Date: Thu, 21 Jun 2012 16:32:26 -0500
Message-ID: <4FE392EA.7060103@gmail.com>
References: <1339590863-10564-1-git-send-email-richard.zhao@freescale.com> <1339590863-10564-9-git-send-email-richard.zhao@freescale.com> <4FD8AD42.6010702@gmail.com> <20120613152841.GA23590@richard-laptop> <4FD8C4DB.4020908@gmail.com> <20120614013343.GD29684@b20223-02.ap.freescale.net> <4FE1DE53.4070202@gmail.com> <20120620150502.GG2253@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120620150502.GG2253-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Richard Zhao <linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/20/2012 10:05 AM, Shawn Guo wrote:
> On Wed, Jun 20, 2012 at 09:29:39AM -0500, Rob Herring wrote:
>> I mean just something like "fsl,hub-reset-gpios" in the ehci device
>> node. It's at least under a usb node. Whether the ehci driver handles
>> this or you just have a separate piece of code to find this property and
>> setup the gpio is up to you.
>>
> I ever had an argument on this.  If we have "fsl,hub-reset-gpios"
> defined in ehci device node, it should simply be ehci driver who needs
> to find this property and set up the gpio.  Defining the property in
> ehci device node while having platform code to find the property just
> seems wired to me.  That said, if it's not ehci driver who will use
> the property, we should not define the property in in ehci device node.

There's no requirement that 1 DT node be 1 driver. That's purely an OS
decision and it's usually simpler that way. But if it it's just a one
time thing at boot, then its fine for the platform code to handle it.

Rob

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
