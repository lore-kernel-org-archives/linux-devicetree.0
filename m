From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC PATCH v3 02/17] Documentation: devicetree: arm: cpus/cpu
 nodes bindings updates
Date: Fri, 26 Apr 2013 12:48:11 +0100
Message-ID: <20130426114811.GD11648@e106331-lin.cambridge.arm.com>
References: <1366824502-19729-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1366824502-19729-3-git-send-email-lorenzo.pieralisi@arm.com>
 <CAL_JsqL2QOjTffogB6g7VK7oRUwDAmJpr=36uvFXjd+hpBL89A@mail.gmail.com>
 <20130426101839.GA3093@e102568-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130426101839.GA3093-7AyDDHkRsp3ZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
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
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Lennert Buytenhek <kernel-OLH4Qvv75CYX/NnBR394Jw@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Barry Song <baohua.song-kQvG35nSl+M@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vinayak Kale <vkale-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 26, 2013 at 11:18:40AM +0100, Lorenzo Pieralisi wrote:
> On Fri, Apr 26, 2013 at 03:51:10AM +0100, Rob Herring wrote:
> > On Wed, Apr 24, 2013 at 12:28 PM, Lorenzo Pieralisi
> > <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org> wrote:
> > > In order to extend the current cpu nodes bindings to newer CPUs
> > > inclusive of AArch64 and to update support for older ARM CPUs this
> > > patch updates device tree documentation for the cpu nodes bindings.
> > >
> > > Main changes:
> > >     - adds 64-bit bindings
> > >     - define usage of #address-cells
> > >     - define 32/64 dts compatibility settings
> > >     - defines behaviour on pre and post v7 uniprocessor systems
> > >     - adds ARM 11MPcore specific reg property definition
> > >
> > > Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> > > ---
> > 
> > [...]
> > 
> > > +       - enable-method
> > > +               Value type: <stringlist>
> > > +               Usage and definition depend on ARM architecture version and
> > > +               configuration:
> > > +                       # On ARM v8 64-bit systems running the OS in AArch64,
> > > +                         this property is required and must be "spin-table".
> > 
> > What about PSCI?
> 
> I should add it, at least for ARM v8.

It's worth noting KVM uses it on v7 too, so it should be available for CPUs
that are v7+.

> 
> > I don't think the ePAPR spin-table definition is sufficient for ARM.
> > How do you define wake up by SGI or sev instruction.
> 
> I think Will described the wfe/sev mechanism in:
> 
> Documentation/arm64/booting.txt
> 
> and the ePAPR does the same in 5.5.2.2/5.5.2.3. Since this is a document
> describing cpus/cpu nodes bindings I assume that description does not
> belong here. Question is: do we need to specify an ARM implementation
> specific enable-method to describe SGI/sev wake-up (ePAPR 5.5.3) ?
> 
> > > +                       # On ARM 32-bit systems or ARM v8 systems running
> > > +                         the OS in AArch32 this property is prohibited.
> > 
> > Why?
> 
> Because if we define it optional with no possible set of values basically
> it can be whatever string. I could define it optional with the same
> allowed values as ARM v8 even if it is currently ignored, at least in Linux,
> until PSCI implementations get merged.

I believe kvmtool sets the enable-method to "psci" on v7, though I may be
mistaken. Adding Marc to Cc as he knows better.

Cheers,
Mark.
