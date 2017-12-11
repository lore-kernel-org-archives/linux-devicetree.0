From: Rasmus Villemoes <rasmus.villemoes-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Subject: Re: [RFC] irqchip: add support for LS1021A external interrupt lines
Date: Mon, 11 Dec 2017 14:45:39 +0100
Message-ID: <42019fb5-393a-08b0-924d-bf1a97e078fe@prevas.dk>
References: <48d2d08c-c57a-ce49-5958-0fd5ad4a2dc7@arm.com>
 <58297576-cc32-819d-c6b3-7d1355095482@prevas.dk>
 <5117875.4tMaEC1223@ws-stein> <2475814.YIHTfursNv@ws-stein>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2475814.YIHTfursNv@ws-stein>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>
Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2017-12-11 11:02, Alexander Stein wrote:

> Oh, and what is the content of register SCFG_SCFGREVCR?

Good point. On my board it's 0xffffffff, set even before U-boot starts,
and lots board support code in U-boot expects this. I can't immediately
find examples in the linux source code that actually writes to the scfg,
so I don't know if we already have that as an implicit assumption as
well. But it would be kind of nasty to have to make the code read
SCFG_SCFGREVCR and decide the bit pattern to use based on that -
especially since I wouldn't be able to test it.

Who thought such a magic switch could ever be a good idea?

-- 
Rasmus Villemoes
Software Developer
Prevas A/S
Hedeager 3
DK-8200 Aarhus N
+45 51210274
rasmus.villemoes-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org
www.prevas.dk
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
