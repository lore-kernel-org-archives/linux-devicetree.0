From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Testing on ARM (omap)
Date: Tue, 18 Jan 2011 23:05:21 -0700
Message-ID: <20110119060521.GA2545@angua.secretlab.ca>
References: <E6BA3EFB-21A0-4F75-872C-1CBB23DD5A5A@jonmasters.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <E6BA3EFB-21A0-4F75-872C-1CBB23DD5A5A-Zp4isUonpHBD60Wz+7aTrA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jon Masters <jonathan-Zp4isUonpHBD60Wz+7aTrA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 04, 2011 at 04:16:46AM -0500, Jon Masters wrote:
> Folks,
> 
> Anyone point me to the latest status for testing fdt on ARM? (e.g. OMAP3)
> 
> Jon.

Hi Jon

Sorry for the delay in answering.

I published a new branch today that makes it a lot easier to start
playing around with fdt on ARM.

  git://git.secretlab.ca/git/linux-2.6 devicetree/arm

Look at the changes to versatile and tegra board support in that
branch to see how to add very basic device tree support to any
machine_desc.

U-boot already has device tree support enabled for beagleboard in the
latest release.

I've not yet published a set of instructions on how to set everything
up; I'll try to get something out there this week.

Cheers,
g.

> 
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
