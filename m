From: "AnilKumar, Chimata" <anilkumar-l0cyMroinI0@public.gmane.org>
Subject: RE: [PATCH v3] Input: matrix-keypad - Add device tree support
Date: Mon, 5 Nov 2012 08:29:12 +0000
Message-ID: <331ABD5ECB02734CA317220B2BBEABC13EA63472@DBDE01.ent.ti.com>
References: <1351854182-10978-1-git-send-email-anilkumar@ti.com>
 <50941739.1000404@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <50941739.1000404-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
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
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: "l.fu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <l.fu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

+Luotao Fu

On Sat, Nov 03, 2012 at 00:25:53, Stephen Warren wrote:
> On 11/02/2012 05:03 AM, AnilKumar Ch wrote:
> > Add device tree support to matrix keypad driver and usage details
> > are added to device tree documentation. Driver was tested on AM335x
> > EVM.
> 
> > +++ b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt
> 
> > +Optional Properties:
> 
> > +- clustered-irq:	have clustered irq number, that is needed if the irq
> > +			is a combined irq source for the whole matix keypad.
> > +			This is useful if rows and columns of the keypad are
> > +			connected to a GPIO expander.
> > +- clustered-irq-flags:	clustered irq flags
> 
> Shouldn't the GPIO expander itself be an IRQ controller too? What are
> the clustered-irq-flags values?

These are clustered-irq corresponding flags whether the IRQ is
IRQF_TRIGGER_RISING (or) IRQF_TRIGGER_FALLING (or) both and etc.
I have given the pointers based on this patch
https://lkml.org/lkml/2010/5/27/45

I am not able to provide the further details because my hardware is
different. Luotao Fu have added the clustered-irq support he might
have some pointers here.

Hi Luotao Fu,

Do you have any comments here?

Thanks
AnilKumar
