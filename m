From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: Device Tree on ARM status report
Date: Tue, 08 Feb 2011 11:51:35 +0000
Message-ID: <1297165895.31587.62.camel@e102568-lin.cambridge.arm.com>
References: <AANLkTikLvO0Y44nCxEfCsNxU-Na+PzcLXZUjOsMUM1_A@mail.gmail.com>
	<20110207084613.GC2723@matterhorn.lan>
	<AANLkTi=dK2qYTH7vThJb8-3wED5F_5Hcmr7nNidxs25c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <AANLkTi=dK2qYTH7vThJb8-3wED5F_5Hcmr7nNidxs25c-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linaro-dev <linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2011-02-07 at 14:28 -0700, Grant Likely wrote:
> On Mon, Feb 7, 2011 at 1:46 AM, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > On 11 Feb 05, Grant Likely wrote:
> >> 2 - Task status
> >> ---------------
> >> Core infrastructure:
> >> [glikely] basic infrastructure to enable dt: DONE
> >> [r-herring] Allow dtb to be located anywhere in RAM: DONE
> >> [bones] Debug dtb corruption during init: INPROGRESS
> >> [glikely] OF clock bindings: INPROGRESS
> >
> > Does this include the common clock framework that Jeremy had been working on?
> > I see no mention of that explicitly, hence the question.
> 
> No, since the common clk patches are taking some time to get right,
> the device tree clock bindings have been decoupled from the common clk
> patches so that dt support doesn't get held up.  When common clk gets
> merged, the dt support will be modified to use it.
> 

Ok Grant, good to know. I did not have time to check how the bindings
changed, but at least for vexpress I was registering and binding clocks
from DT. Here is the vexpress list of tasks updated.

Versatile express tasks:
[lorenzo-pieralisi] enable dtb support in u-boot: DONE within Linaro ?
[lorenzo-pieralisi] enable basic kernel dtb support on versatile
express: DONE
[lorenzo-pieralisi] probe clocks from dt: DONE
[lorenzo-pieralisi] probe irq controllers from device tree: DONE (basic
GIC init - interrupt routing is not there yet)
[lorenzo-pieralisi] register devices from dt: 

Currently all vexpress platform devices are registered from the DT code,
but I have to rebase to see if things changed wrt test-devicetree 
branch.

They include:

smsc911x (mdio inclusive but pending code to probe irq type)
isp1760
flash physmap
amba-pl011
amba-clcd-pl11x
PMU
mmc-pl18x

The GIC and sp804 timers are also initialized from DT (they need not be
platform devices though).

Please let me know if you need further details.

Lorenzo
