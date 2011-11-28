From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 05/14] tegra: fdt: Add Tegra2x device tree file
Date: Mon, 28 Nov 2011 11:56:53 -0700
Message-ID: <4ED3D975.4090903@nvidia.com>
References: <1322106896-23054-2-git-send-email-sjg@chromium.org>
 <1322106896-23054-6-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1322106896-23054-6-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Albert ARIBAUD <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/23/2011 08:54 PM, Simon Glass wrote:
> This was taken from commit 1ea6b8f at:
> git://git.kernel.org/pub/scm/linux/kernel/git/olof/tegra.git

That's not the latest version in linux-next. Also, this doesn't include
quite a few changes that have been sent to the mailing lists but not yet
applied.

In particular, linux-next now includes a minimal USB binding. Should we
just use this in U-Boot for now? We should get review on the kernel
lists before bringing in this more advanced USB binding in U-Boot, and
perhaps even add the binding into the kernel at the same time?

Patches have been posted to:
* Convert to the finalized ARM GIC binding.
* Disable devices in the per-board .dts files that aren't used on those
boards.
* Various other cleanups in order to make the .dts files match the
kernel's non-DT board files.
* Perhaps more that I forget.

I suppose those could be applied to U-Boot as and when they are applied
to the kernel.

-- 
nvpublic
