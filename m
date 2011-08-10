From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: Subject: L2x0 OF properties do not include interrupt #
Date: Wed, 10 Aug 2011 16:12:56 +0100
Message-ID: <20110810151256.GN10121@e102144-lin.cambridge.arm.com>
References: <000201cc575b$c1229010$4367b030$@rutland@arm.com>
	<201108101609.56995.arnd@arndb.de> <4E42965A.9010500@calxeda.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4E42965A.9010500-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "workgroup.linux-kQvG35nSl+M@public.gmane.org" <workgroup.linux-kQvG35nSl+M@public.gmane.org>, "weizeng.he-kQvG35nSl+M@public.gmane.org" <weizeng.he-kQvG35nSl+M@public.gmane.org>, "tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org" <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 10, 2011 at 03:31:54PM +0100, Rob Herring wrote:
> Here's all the interrupts on the PL310:
> 
> DECERRINTR Decode error received on master ports from L3
> SLVERRINTR Slave error received on master ports from L3
> ERRRDINTR Error on L2 data RAM read
> ERRRTINTR Error on L2 tag RAM read
> ERRWDINTR Error on L2 data RAM write
> ERRWTINTR Error on L2 tag RAM write
> PARRDINTR Parity error on L2 data RAM read
> PARRTINTR Parity error on L2 tag RAM read
> ECNTRINTR Event Counter Overflow/Increment
> L2CCINTR L2CC Combined Interrupt Output
> 
> It's likely that you would want to split these to different drivers.
> EDAC for parity/bus errors and hw-events for event counters, for example.

I completely agree with you here. In reality, I expect we'll be lucky if
even the combined interrupt is wired up so maybe the individual property
names should only be added on an as-needed basis? For the time being we can
happily get by with something like combined-interrupt = <...>.

Or would you rather specify everything up front?

Will
