From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v6 14/16] tegra: fdt: Add LCD definitions for
	Seaboard
Date: Mon, 08 Oct 2012 16:39:26 -0600
Message-ID: <5073561E.4030907@wwwdotorg.org>
References: <1349735293-18832-5-git-send-email-sjg@chromium.org>
	<1349735293-18832-15-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1349735293-18832-15-git-send-email-sjg@chromium.org>
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
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Jerry Van Baren <vanbaren@cideas.com>, Stephen Warren <swarren@nvidia.com>, Tom Warren <twarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

On 10/08/2012 04:28 PM, Simon Glass wrote:
> The Seaboard has a 1366x768 16bpp LCD. The backlight is controlled
> by one of the PWMs.

These 3 updated patches seem OK, but I'd like to see Thierry's ack for
the DT binding changes; they'd need to be ported into the kernel I think.
