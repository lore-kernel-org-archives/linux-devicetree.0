From: Jamie Iles <jamie@jamieiles.com>
Subject: Re: [PATCH 1/3] picoxcell: support for Picochip picoxcell devices
Date: Sat, 20 Aug 2011 07:52:51 +0100
Message-ID: <20110820065251.GB18892@gallagher>
References: <1312884661-27205-1-git-send-email-jamie@jamieiles.com>
	<1312884661-27205-2-git-send-email-jamie@jamieiles.com>
	<4E4F54CC.8000506@secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <4E4F54CC.8000506@secretlab.ca>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Grant Likely <glikely@secretlab.ca>
Cc: Jamie Iles <jamie@jamieiles.com>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Grant,

On Fri, Aug 19, 2011 at 11:31:40PM -0700, Grant Likely wrote:
> On 11-08-09 03:10 AM, Jamie Iles wrote:
[...]
> >+VIC required properties:
> >+    - compatible = "arm,pl192-vic-pair".
> >+    - interrupt-controller.
> >+    - reg : The register bank for the devices.  Picoxcell has two VIC's and the
> >+      IRQ outputs are wire-OR'd together so we effectively have a combined
> >+      controller that handles 64 IRQ's.  The first reg tuple is the register
> >+      bank of the VIC that generates IRQ's 0->31 and the second tuple handles
> >+      IRQ's 32->63.
> 
> If they are two separate devices, then it probably should still be
> represented as two separate device tree nodes.  Linux can take care
> of assigning a range of linux irq numbers to each VIC.

The reason I did this is because of the entry macro get_irqnr_and_base 
macro decoding.  If I used irq_domain_generate_simple() rather than 
irq_domain_add_simple() then I guess the ordering of the VIC's in the DT 
wont matter.  I'll give this a test when I have access to hardware again 
and respin.

Many thanks for the review!

Jamie
