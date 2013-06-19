From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] ARM: kernel: document ARM CPUs clock-frequency property
Date: Wed, 19 Jun 2013 12:23:24 +0100
Message-ID: <20130619112324.GA32207@e102568-lin.cambridge.arm.com>
References: <1371635237-22860-1-git-send-email-f.fainelli@gmail.com>
 <20130619100450.GA27181@e106331-lin.cambridge.arm.com>
 <CAGVrzcY8oxZ7zUbThvXgsVyEGBCsxcvu4R0it_9s9wsKkJ3W0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAGVrzcY8oxZ7zUbThvXgsVyEGBCsxcvu4R0it_9s9wsKkJ3W0w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 19, 2013 at 11:27:50AM +0100, Florian Fainelli wrote:
> Hello Mark,
> 
> 2013/6/19 Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>:
> > On Wed, Jun 19, 2013 at 10:47:17AM +0100, Florian Fainelli wrote:
> >> ARM CPU device tree nodes may contain an optional clock-frequency
> >> property, when set, this property must contain the CPU frequency in Hz,
> >> which is then used by the topology parsing code in
> >> arch/arm/kernel/topology.c to infer the CPU capacity.
> >
> > I see that arch/arm/kernel/topology.c does a pr_err when clock-frequency isn't
> > present. If we're documenting it as optional, should we not downgrade that or
> > remove it entirely?
> 
> Good question. I think it might be good to just dowgrade the error to
> a simple warning, we should clearly be fixing the binding if we have a
> device_type = "cpu" property but no clock-frequency property.

Well, this means that that pr_err will trigger as soon as the dts
updates hit the mainline, now probably it is silent because cpu nodes
for architectures with "arm,cortex-a15" as cpus miss device_type = "cpu".
ePAPR defines "clock-frequency" as required.

So either we downgrade it to optional or we are in for another slew of dts
updates, I am really looking forward to that. Certainly it has to be added
to the bindings.

Thoughts ?

Lorenzo
