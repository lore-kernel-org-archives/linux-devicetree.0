From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: zImage: allow supplementing appended DTB with
	traditional ATAG data
Date: Tue, 21 Jun 2011 15:00:59 +0800
Message-ID: <20110621070058.GA9228@S2101-09.ap.freescale.net>
References: <1308632955-11070-1-git-send-email-nico@fluxnic.net>
	<1308632955-11070-5-git-send-email-nico@fluxnic.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1308632955-11070-5-git-send-email-nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Cc: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 21, 2011 at 01:09:15AM -0400, Nicolas Pitre wrote:
> From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> Some old bootloaders can't be updated to a device tree capable one,
> yet they provide ATAGs with memory configuration, the ramdisk address,
> the kernel cmdline string, etc.  To allow a device tree enabled
> kernel to be used with such bootloaders, it is necessary to convert those
> ATAGs into FDT properties and fold them into the DTB appended to zImage.
> 
> Currently the following ATAGs are converted:
> 
> 	ATAG_CMDLINE
> 	ATAG_MEM (up to 8 memory regions)
> 	ATAG_INITRD2
> 
> If the corresponding information already exists in the appended DTB, it
> is replaced, otherwise the required node is created to hold it.
> 
> The code looks for ATAGs at the location pointed by the value of r2 upon
> entry into the zImage code.  If no ATAGs are found there, an attempt at
> finding ATAGs at the typical 0x100 offset from start of RAM is made.
> Otherwise the DTB is left unchanged.
> 
> Thisstarted from an older patch from John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>,
> with contributions from David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>.
> 
> Signed-off-by: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---

With this patch applied, I saw nothing coming from kernel on imx51
babbage serial port.

-- 
Regards,
Shawn
