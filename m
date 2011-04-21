From: John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
Subject: Re: [PATCH v3] uio/pdrv_genirq: Add OF support
Date: Fri, 22 Apr 2011 09:46:53 +1000
Message-ID: <BANLkTinBZxBcc3fRo_jc4=VuY3D2pbaAzg@mail.gmail.com>
References: <1303116654-5042-1-git-send-email-monstr@monstr.eu>
	<20110418160658.GD23814@pengutronix.de>
	<BANLkTimFnfgiQ5aMq_KwqHP8p92pjOJJwg@mail.gmail.com>
	<20110421120855.GC2135@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110421120855.GC2135-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Wolfram,

On Thu, Apr 21, 2011 at 10:08 PM, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> On Tue, Apr 19, 2011 at 11:58:25AM +1000, John Williams wrote:
>
>> As we discussed at ELC, putting a real vendor/device in there is also
>> broken because all instances in the system wil bind to the generic
>> uio, which is not necessarily what is desired.
>
> IIRC I pointed you to mpc5200b-psc devices which also have multiple functions
> and have seperate bindings for these functions. It fits the "hardware
> description" character of a dt, because it says this PSC is a UART or an
> SPI or whatever.

Right, and my interpretation of that was basically - modify the device
tree as required to make the correct driver bind to the device.

Is that correct?

It's the same underlying piece of silicon, you are just using the
device tree to tell Linux how it should behave at runtime, and which
driver to bind.

If so, it seems to be exactly what Arnd and Grant don't want - having
the device tree describe Linux behaviour.

In the hardware, it's a multifunction device, so surely a clean DTS
would just have 'mpc5200b', but no attempt to describe how Linux
should bind to it and configure it.  Instead this should be done at
runtime, using some yet-to-be-determined mechanism.

The difference between what you are doing for these multifunction
devices, versus the generic-uio approach, is surely only a matter of
degree rather than fundamentals?

Regards,

John
