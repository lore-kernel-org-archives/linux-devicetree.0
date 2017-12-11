From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC] irqchip: add support for LS1021A external interrupt lines
Date: Mon, 11 Dec 2017 18:29:59 +0000
Message-ID: <3b22d1ed-fe8f-b733-1543-86e89b493114@arm.com>
References: <48d2d08c-c57a-ce49-5958-0fd5ad4a2dc7@arm.com>
 <1512743580-15358-1-git-send-email-rasmus.villemoes@prevas.dk>
 <da843420-cede-e787-838d-1fd48e3ca7dd@arm.com>
 <563e0aaa-faf9-ae6a-ccd4-2aa89d7e457b@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <563e0aaa-faf9-ae6a-ccd4-2aa89d7e457b-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Content-Language: en-GB
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <rasmus.villemoes-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/12/17 09:30, Rasmus Villemoes wrote:
> On 2017-12-08 17:02, Marc Zyngier wrote:

[...]

>> Overall, it is a bit annoying that you just copied the driver altogether
>> instead of trying to allow the common stuff to be shared between
>> drivers. Most of this is just boilerplate code...
> 
> Yes, it did annoy me as well. However, the real meat of this is which
> bits of which register to poke to support a negative polarity irq, and
> there doesn't seem to be a good way to express that in DT. The register
> offset and the mapping from external irq# to the GIC one is reasonably
> easy (and would thus get rid of my NIRQ and INTPCR macros), but
> describing the mapping from IRQ# to the bit that needs to be set (or
> cleared) seems much harder. I cannot generalize from one example, so
> lacking documentation for any other Layerscape SOC, whatever I might
> come up with might not actually be useful for other hardware, making it
> rather pointless. But if you have any suggestions for how the DT
> bindings might look, I'm all ears.

You could have a list of <bit irq> pairs defining the mapping, for
example. But I'd encourage you to get in touch with the Freescale/NXP
folks and find out how this HW works. get_maintainers.pl gives me this:

Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Tang Yuantian <Yuantian.Tang-3arQi8VN3Tc@public.gmane.org>
Hou Zhiqiang <Zhiqiang.Hou-3arQi8VN3Tc@public.gmane.org>
Madalin Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
Minghuan Lian <Minghuan.Lian-3arQi8VN3Tc@public.gmane.org>
Yuantian Tang <andy.tang-3arQi8VN3Tc@public.gmane.org>
Yangbo Lu <yangbo.lu-3arQi8VN3Tc@public.gmane.org>
"Horia Geantă" <horia.geanta-3arQi8VN3Tc@public.gmane.org>

I suggest you spam them and find out.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
