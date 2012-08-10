From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] gpio: Add Avionic Design N-bit GPIO expander support
Date: Fri, 10 Aug 2012 10:19:02 +0200
Message-ID: <CACRpkdaSk9xBaiSAKCj4Pa2kyyfP178XN53i2Q2+CBFx=RoE0g@mail.gmail.com>
References: <1343044770-6591-1-git-send-email-thierry.reding@avionic-design.de>
 <CACRpkdaZcUvcJMUZTqCEU5FQYhE3EvSSfUEnEx0dYRt-6x5Nig@mail.gmail.com>
 <20120809202054.GA24503@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120809202054.GA24503-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
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
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 9, 2012 at 10:20 PM, Thierry Reding
<thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> On Sun, Jul 29, 2012 at 07:13:57PM +0200, Linus Walleij wrote:
>> > +       client->irq = irq_of_parse_and_map(client->dev.of_node, 0);
>> > +       if (client->irq == NO_IRQ)
>>
>> Just if (!client->irq) since NO_IRQ is 0 nowadays.
>
> At the risk of seeming pedantic, NO_IRQ is in fact quite often not 0.

No. A year back, yes, but not anymore. We went to great lengths in the
ARM architecture to ensure NO_IRQ is *always 0. Russell spent
a lot of time on this.

Consult the following article on LWN:
http://lwn.net/Articles/470820/

Then grep your gitlog and you'll see we got rid of it from ARM.

If this driver is for some other arch like openrisc I might accept
it but please reconsider.

Yours,
Linus Walleij
