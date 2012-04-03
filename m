From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v3 22/23] tegra: fdt: Add EMC data for Tegra2
	Seaboard
Date: Mon, 2 Apr 2012 22:22:30 -0700
Message-ID: <CAOesGMh1OaJ9DDj+xxfOf268J93WbOmpZSJutBLB3xQ+6W4C-w@mail.gmail.com>
References: <1333408743-28720-1-git-send-email-sjg@chromium.org>
	<1333408743-28720-23-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1333408743-28720-23-git-send-email-sjg@chromium.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Simon Glass <sjg@chromium.org>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Stephen Warren <swarren@nvidia.com>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 2, 2012 at 4:19 PM, Simon Glass <sjg@chromium.org> wrote:
> This adds timings for T20 and T25 Seaboards, using the bindings found here:
>
> http://patchwork.ozlabs.org/patch/132928/
>
> We supply both full speed options for normal running, and half speed options
> for testing / development.
>
> Signed-off-by: Simon Glass <sjg@chromium.org>

This seems incorrect to me. You provide both T20 and T25 EMC tables in
the same device tree with no way to determine which one to use.

Unfortunately nvidia didn't use the boot straps to tell if they were
on a t20 or t25 seaboard, so you'll just have to know. At the kernel
side we chose to just ditch T20 since most boards still in use are
T25.



-Olof
