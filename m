From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v3 0/2] Simple irq_domain implementation
Date: Thu, 28 Jul 2011 16:20:35 -0600
Message-ID: <20110728222035.GE4674@ponder.secretlab.ca>
References: <20110726093141.12508.48108.stgit@ponder>
	<alpine.LFD.2.02.1107281127040.2660@ionos>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.02.1107281127040.2660@ionos>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sebastian Sewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 28, 2011 at 11:31:03AM +0200, Thomas Gleixner wrote:
> On Tue, 26 Jul 2011, Grant Likely wrote:
> 
> > In the interest of getting this infrastructure merged, I've reworked the
> > basic irq_domain patch to implement only what is required for ARM device
> > tree board support.  That means it doesn't affect any architectures other
> > than ARM, and I'll send follow-on patches targeted at v3.2 to migrate
> > MIPS, Microblaze, x86 embedded and PowerPC over to it.
> 
> There is also this GPIO driver pending for quite some time ...
>  
> > Thomas, can you please take a look?  I've got devicetree board support
> > queued up and ready to be merged but for this infrastructure.
> 
> Looks reasonable, please merge them through your tree.
> 
> Reviewed-by: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> 
> Thanks,
> 
> 	tglx

Thanks Thomas.  Arnd has sent it as part of his DT board support pull
req to Linus.

g.
