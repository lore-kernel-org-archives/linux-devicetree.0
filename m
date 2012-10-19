From: Albert ARIBAUD <albert.u.boot@aribaud.net>
Subject: Re: [PATCH] arm: fdt: Relocate fdt along with other data
Date: Fri, 19 Oct 2012 22:52:43 +0200
Message-ID: <20121019225243.179ba7f3@lilith>
References: <1348796515-29008-1-git-send-email-sjg@chromium.org>
	<5065C0C8.6070503@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <5065C0C8.6070503@wwwdotorg.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Jerry Van Baren <vanbaren@cideas.com>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Fri, 28 Sep 2012 09:22:48 -0600, Stephen Warren
<swarren@wwwdotorg.org> wrote:

> On 09/27/2012 07:41 PM, Simon Glass wrote:
> > Rather than leave the fdt down next to the code/data, we really should
> > relocate it along with everything else. For CONFIG_OF_EMBED this happens
> > automatically, but for CONFIG_OF_SEPARATE it does not.
> > 
> > Add code to copy the fdt and point to the new copy after relocation.
> 
> Tested-by: Stephen Warren <swarren@nvidia.com>
> 
> (on Tegra Harmony board, on top of a merge of current u-boot/master,
> u-boot-usb/master, u-boot-tegra/next plus my CONFIG_SYS_BOOTMAPSZ and
> standard environment variable patches for Tegra)
> 

Applied to u-boot-arm/master, thanks!

Amicalement,
-- 
Albert.
