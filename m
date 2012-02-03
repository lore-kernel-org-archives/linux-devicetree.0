From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH v2] irq_domain/microblaze: Convert microblaze to use
 irq_domains
Date: Fri, 03 Feb 2012 11:33:28 +0100
Message-ID: <4F2BB7F8.7000608@monstr.eu>
References: <1328183974-3767-1-git-send-email-monstr@monstr.eu>
 <20120202185948.GS15343@ponder.secretlab.ca>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120202185948.GS15343-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Grant Likely wrote:
> On Thu, Feb 02, 2012 at 12:59:34PM +0100, Michal Simek wrote:
>> From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>>
>> Move get_irq to asm/irq.h from hardirq.h.
>>
>> Grant: Why does your patch setup NR_IRQS to 64? It seems to me
>> pretty big value because intc support up to 32 interrupts.
>> The main problem was with get_irq function because there must
>> check status of IVR.
> 
> It doesn't really need to do that.  I can drop that change, but you
> will need to either enable sparse irq or make that number larger if
> you ever set up cascaded interrupt controllers.

I have never seen cascaded interrupt controllers on Microblaze system
that's why it is better to have simpler/faster code.

> 
>> Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>> Signed-off-by: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
>> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>> Cc: John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
>> Cc: John Linn <john.linn-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>>
>> ---
>> This builds on top of my irq_domain tree:
>> git://git.secretlab.ca/git/linux-2.6 irqdomain/next
>>
>> v2: Turn off SPARSE_IRQ because we don't need it.
> 
> Is this all that you changed?  Do I need to drop the version in my
> tree to pick up this version of the patch, or am I okay to simply drop
> the SPARSE_IRQ hunk?
> 

Not only that. In second email you see that changes about concurrent irq.

Thanks,
Michal


-- 
Michal Simek, Ing. (M.Eng)
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel 2.6 Microblaze Linux - http://www.monstr.eu/fdt/
Microblaze U-BOOT custodian
