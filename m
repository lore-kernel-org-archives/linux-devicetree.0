From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH v3] uio/pdrv_genirq: Add OF support
Date: Mon, 18 Apr 2011 13:10:51 +0200
Message-ID: <4DAC1C3B.6020205@monstr.eu>
References: <1303116654-5042-1-git-send-email-monstr@monstr.eu>
	<20110418103513.GA27864@linux-sh.org>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110418103513.GA27864-M7jkjyW5wf5g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Paul Mundt <lethal-M7jkjyW5wf5g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org, john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Paul Mundt wrote:
> On Mon, Apr 18, 2011 at 10:50:54AM +0200, Michal Simek wrote:
>> Adding OF binding to genirq.
>> Version string is setup to the "devicetree".
>>
>> Compatible string is not setup for now but you can add your
>> custom compatible string to uio_of_genirq_match structure.
>>
>> For example with "uio" compatible string:
>> static const struct of_device_id __devinitconst uio_of_genirq_match[] = {
>> 	{ .compatible = "uio", },
>> 	{ /* empty for now */ },
>> };
>>
>> Signed-off-by: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
>>
> Perhaps a silly question, but how are you planning on differentiating
> between uio_pdrv and uio_pdrv_genirq binding if someone has both enabled?

It is not a silly question. OF support in uio_pdrv_genirq can handle both cases 
with/without IRQ (I tested it) and I don't want to add OF support to uio_pdrv.
Not sure if uio_pdrv_genirq without OF can handle UIO without IRQ.

> uio_pdrv obviously doesn't have OF bindings at the moment, but it seems
> like you could easily parse the memory ranges in addition to the IRQ and
> come up with a generic binding that would work for both.

I think the question is if uio_pdrv_genirq can handle both cases, if yes, we can 
completely remove uio_pdrv. But it is up to UIO maintainers.

> 
> We also have a shiny new Documentation/devicetree these days, so it would
> be nice to see the binding documented at the same time.

Sure - make sense.

Michal



-- 
Michal Simek, Ing. (M.Eng)
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel 2.6 Microblaze Linux - http://www.monstr.eu/fdt/
Microblaze U-BOOT custodian
