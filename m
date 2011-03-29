From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 0/6] ARM device tree support improvements
Date: Tue, 29 Mar 2011 14:46:32 +0800
Message-ID: <20110329064631.GA18775@S2100-06.ap.freescale.net>
References: <20110328195231.10235.36716.stgit@ponder>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110328195231.10235.36716.stgit@ponder>
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
Cc: linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, wd-ynQEQJNshbs@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 28, 2011 at 01:58:25PM -0600, Grant Likely wrote:
> Hi Jerry & Wolfgang,
> 
> The following series fixes a bug in the device tree code and
> eliminates the CONFIG_OF_LIBFDT dependency on CONFIG_SYS_BOOTMAPSZ.
> It also adds parsing of the reserved mem regions so that U-Boot
> doesn't decide to use a regions set aside for another purpose.
> 
> Finally, the last patch adds CONFIG_OF_LIBFDT to a bunch of boards.
> I'm not expecting the last patch to be picked up in mainline (yet),
> but it will be picked up into the Linaro tree for the 11.05 release.
> 
> John, this same series applies cleanly on the linaro-stable u-boot
> tree.  Can you pick them up please?  Or would you prefer me to send
> you a pull request?
> 
> g.
> 
> ---
> 
> Grant Likely (6):
>       Stop passing around bootmem_base value.
>       Default to bootm_size() when CONFIG_SYS_BOOTMAPSZ is not defined
>       Remove device tree booting dependency on CONFIG_SYS_BOOTMAPSZ
>       Fix off-by-one error in passing initrd end address via device tree
>       Respect memreserve regions specified in the device tree
>       Add CONFIG_OF_LIBFDT to more boards.
> 
On mx51evk (babbage) board:

Tested-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

-- 
Regards,
Shawn
