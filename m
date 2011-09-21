From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 0/3] GIC OF bindings
Date: Wed, 21 Sep 2011 17:43:14 +0800
Message-ID: <20110921094313.GD28907@S2100-06.ap.freescale.net>
References: <1316550244-3655-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1316550244-3655-1-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 20, 2011 at 03:24:01PM -0500, Rob Herring wrote:
> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> 
> Hopefully, this is the final or near final version of GIC binding support.
> 
> Changes from the previous version:
> - SPIs and PPIs are numbered starting at 0. Now the gic has it's own irq
>   domain translate function instead of the simple domain one.
> - interrupt cell format has changed based on Grant's proposal.
> - Dropped "ARM: gic: allow irq_start to be 0". Instead, the first 16 irqs
>   are skipped and the domain irq_base adjusted accordingly.
> - Added a fix to of_irq_find_parent when the parent == child.
> - Renamed intc_desc.parent to intc_desc.interrupt_parent.
> - Implemented Grant's algorithm for walking the list of interrupt
>   controllers. Added a return value to interrupt init functions, so they
>   don't get added to the parent list on a init failure.
> 
> The changes are significant enough that I did not include previous
> acked/reviewed/tested-by's.
> 
You can add mine back.  On imx6q:

Tested-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Hopefully, this is the last round of binding scheme change.  There are
63 nodes in imx6q dts with 'interrupts' property.  I have changed them
3 times :)

-- 
Regards,
Shawn
