From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v4 07/10] tegra: fdt: Add keyboard definitions
	for Seaboard
Date: Mon, 23 Apr 2012 14:59:31 -0600
Message-ID: <4F95C2B3.6020509@wwwdotorg.org>
References: <1334689297-13489-1-git-send-email-sjg@chromium.org>
	<1334689297-13489-8-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1334689297-13489-8-git-send-email-sjg@chromium.org>
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
Cc: Anton Staff <robotboy@chromium.org>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

On 04/17/2012 01:01 PM, Simon Glass wrote:
> From: Anton Staff <robotboy@chromium.org>
> 
> Seaboard uses a QUERTY keyboard. We add key codes for this to

Q*W*ERTY?

Do you want to add the nvidia,ghost-filter property so that ghost
filtering is enabled? See the Tegra KBC binding documentation in the
kernel (which I don't see included in these patches for reference)
Documentation/devicetree/bindings/input/tegra-kbc.txt.

Otherwise,
Acked-by: Stephen Warren <swarren@wwwdotorg.org>

(note: I didn't actually validate any of the content of the keymap)
