From: Simon Desfarges <simon.desfarges-s/S/64wAxt+H1Tvi1vFFB9BPR1lH4CV8@public.gmane.org>
Subject: Re: Interruption on PCI Bus
Date: Thu, 16 Apr 2009 17:12:00 +0200
Message-ID: <49E74AC0.4000508@fr.thalesgroup.com>
References: <49E6E542.5090504@fr.thalesgroup.com>
	<49E6F14A.9010800@firmworks.com>
	<fa686aa40904160720s77efa749u56392d7027467a4a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <fa686aa40904160720s77efa749u56392d7027467a4a-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org



Grant Likely a =E9crit :
> On Thu, Apr 16, 2009 at 2:50 AM, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org> wrote:
>> Sorry for being so vague.  As the person who originally devised this
>> interrupt tree stuff, I'm pretty sure about the intention, but much less
>> sure about what specific versions of Linux and U-Boot actually do.
>>  Hopefully someone else can give you a definitive answer about that.
> =

> U-Boot doesn't really do anything with interrupts.  It usually just
> polls everything.
> =

> Linux arch/powerpc does walk the device tree to get irq routing and
> resolve to a Linux-internal virtual IRQ number.  I'm pretty sure that
> the IRQ registers are normally ignored unless something goes wrong
> with parsing the tree.  See arch/powerpc/kernel/pci-common.c and
> search for of_irq_map_pci().
> =

> g.
> =

OK, thank you very much for your answers, you are very helpful for a =

newbie like me.

So, if I understood well, of_irq_map_pci() maps the IRQs by reading the =

device tree and doesn't use the irq_line register (if there is nothing =

wrong) of the PCI device and doesn't initialize it. My problem is PCI =

device drivers are using this field (I have read this in the ldd book). =

I think I have missed something because it seems to work well like this.

Regards,
Simon Desfarges
