From: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH TIP 02/14] x86: Add device tree support
Date: Mon, 24 Jan 2011 10:04:27 +0530
Message-ID: <20110124043427.GA20274@www.tglx.de>
References: <1295843342-1122-1-git-send-email-bigeasy@linutronix.de>
	<1295843342-1122-3-git-send-email-bigeasy@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1295843342-1122-3-git-send-email-bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

* Sebastian Andrzej Siewior | 2011-01-24 09:58:50 [+0530]:

>This patch adds minimal support for device tree support on x86. It will
>be passed to the kernel via setup_data which requires atleast boot
>protocol 2.09.
>Memory size, restricted memory regions, boot arguments are gathered the
>traditional way so things like cmd_line are just here to let the code
>compile.
>The current plan is use the device tree as an extension and to gather
>informations from it which can not be enumerated and have to be
>hardcoded otherwise. This includes things like
>- which devices are on this I2C/ SPI bus?
>- how are the interrupts wired to IO APIC?
>- where could my hpet be?
>

Andres, this patch moves some of the OF defines you added for OLPC from
irq.c to prom.c which requires CONFIG_X86_OF to be enabled. A later
patch changes irq_create_of_mapping() from returning intspec[0] to
actually doing something. Could you please check how of OLPC gets broken
and what we could do about it? :)

Sebastian
