From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH 05/14] tegra: fdt: Add Tegra2x device tree file
Date: Thu, 1 Dec 2011 17:24:49 -0800
Message-ID: <CAPnjgZ11cFm15E9MHXno_YGp0NxdOHhGBavYbQBP5Nu_TOtx7A@mail.gmail.com>
References: <1322106896-23054-2-git-send-email-sjg@chromium.org>
	<1322106896-23054-6-git-send-email-sjg@chromium.org>
	<4ED3D975.4090903@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <4ED3D975.4090903@nvidia.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Stephen Warren <swarren@nvidia.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Tom Warren <TWarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Mon, Nov 28, 2011 at 10:56 AM, Stephen Warren <swarren@nvidia.com> wrote:
> On 11/23/2011 08:54 PM, Simon Glass wrote:
>> This was taken from commit 1ea6b8f at:
>> git://git.kernel.org/pub/scm/linux/kernel/git/olof/tegra.git
>
> That's not the latest version in linux-next. Also, this doesn't include
> quite a few changes that have been sent to the mailing lists but not yet
> applied.

OK I see a newer version in 'next' that now has USB so have picked
that up. I picked 'master' originally.

>
> In particular, linux-next now includes a minimal USB binding. Should we
> just use this in U-Boot for now? We should get review on the kernel
> lists before bringing in this more advanced USB binding in U-Boot, and
> perhaps even add the binding into the kernel at the same time?

I copied my email to the device-tree mailing list. Hopefully that is
enough to get a review there. It feels wrong to send U-Boot patches to
the kernel list...?

>
> Patches have been posted to:
> * Convert to the finalized ARM GIC binding.
> * Disable devices in the per-board .dts files that aren't used on those
> boards.
> * Various other cleanups in order to make the .dts files match the
> kernel's non-DT board files.
> * Perhaps more that I forget.

Well I would prefer to pick these up when they are actually applied!

>
> I suppose those could be applied to U-Boot as and when they are applied
> to the kernel.

Yes I think so.

Regards,
Simon

>
> --
> nvpublic
>
