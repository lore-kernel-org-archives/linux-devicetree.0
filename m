From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 0/4] Support for device-tree appended to zImage
Date: Tue, 1 Mar 2011 10:58:37 +0800
Message-ID: <20110301025836.GA3920@S2100-06.ap.freescale.net>
References: <20110228233153.24836.24176.stgit@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110228233153.24836.24176.stgit@riker>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi John,

On Mon, Feb 28, 2011 at 03:33:18PM -0800, John Bonesio wrote:
> The following series support for device tree binary blobs (dtb) that are
> appended to the compressed kernel image (zImage).
> 
> Having appended dtb data is not required to boot with a device tree. If no dtb
> data is appended to zImage, the kernel will boot using prior methods.
> 
> ---
> 
> John Bonesio (4):
>       ARM:boot:device tree: Allow the device tree binary to be appended to zImage
>       ARM:boot:device tree: Merge specific atags into the device tree
>       ARM:boot:device tree: Add puthex routine for use in the boot wrapper
>       ARM:boot:device tree: Allow multiple device trees to be appended to zImage
> 
> 
>  arch/arm/Kconfig                  |    7 ++
>  arch/arm/boot/compressed/Makefile |   31 +++++++-
>  arch/arm/boot/compressed/atags.c  |   70 +++++++++++++++++++
>  arch/arm/boot/compressed/head.S   |  136 +++++++++++++++++++++++++++++++++++--
>  arch/arm/boot/compressed/misc.c   |  134 ++++++++++++++++++++++++++++++++++++
>  5 files changed, 365 insertions(+), 13 deletions(-)
>  create mode 100644 arch/arm/boot/compressed/atags.c
> 
I'm trying to test and use it.  But it does not apply against any tree
that I can find, neither mainline nor Grant's tree.  Need rebasing?

-- 
Regards,
Shawn
