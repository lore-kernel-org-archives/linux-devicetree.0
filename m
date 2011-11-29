From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: Configurable interrupt sources, and DT bindings
Date: Tue, 29 Nov 2011 10:55:38 +0000
Message-ID: <20111129105538.GC2851@opensource.wolfsonmicro.com>
References: <4ED40B5F.6030603@nvidia.com>
 <20111129013055.GH3508@truffala.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111129013055.GH3508-MK4v0fQdeXQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 29, 2011 at 12:30:55PM +1100, David Gibson wrote:
> On Mon, Nov 28, 2011 at 03:29:51PM -0700, Stephen Warren wrote:

> > One possibility is to describe this directly in the binding for each
> > interrupt source. I originally proposed the following for the WM8903:

...

> > Mark Brown pointed out that we probably want to standardize the binding,
> > so that every interrupt source doesn't do something different.

> Um.. why?  These new properties don't appear to give any information
> that isn't already in the interrupts property (albeit in irq
> controller dependent form).

If nothing else because doing a custom binding for every single
interrupt controller out there is depressingly redundant; even if we've
got a bunch of legacy devices with odd bindings it's going to be better
all round if we have something new devices can just pick up.  Pretty
much every single interrupt controller in the embedded space is going to
need this information.

There's also the issue of communicating the setting to the interrupt
consumer, though this isn't really directly relevant to the device tree
bindings.

> Auto-configuration is the only one that actually seems to do something
> new.  It is a potentially interesting problem, one example of a fairly
> common class with modern device tree bindings, where things
> traditionally assumed to be fixed properties of the hardware are often
> runtime configurable in modern setups.

Actually there's a large element of things being fixed by the board but
the hardware being able to run with a wide range of board configurations
depending on what amuses the electrical engineers and what restrictions
the other devices in the system have.  For example, if there are pulls
on the board we would want the idle configuration to be whatever the
pull value is.
