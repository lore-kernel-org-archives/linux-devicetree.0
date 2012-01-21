From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v4 07/20] tegra: fdt: Add device tree file for
 Tegra2 Seaboard from kernel
Date: Sat, 21 Jan 2012 09:20:58 -0800
Message-ID: <CAPnjgZ30SdzJVshh8A6tjRo+O7X7UuutwKq+4H--K_CQDpAbfA@mail.gmail.com>
References: <1326342789-5781-1-git-send-email-sjg@chromium.org>
	<1326342789-5781-8-git-send-email-sjg@chromium.org>
	<4F17477B.1030408@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <4F17477B.1030408@nvidia.com>
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
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Tom Warren <TWarren@nvidia.com>, Jerry Van Baren <vanbaren@cideas.com>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Wed, Jan 18, 2012 at 2:28 PM, Stephen Warren <swarren@nvidia.com> wrote:
> On 01/11/2012 09:32 PM, Simon Glass wrote:
>> This was taken from commit b48c54e2 at:
>> git://git.kernel.org/pub/scm/linux/kernel/git/olof/tegra.git
>>
>> Signed-off-by: Simon Glass <sjg@chromium.org>
>
>> diff --git a/board/nvidia/dts/tegra2-seaboard.dts b/board/nvidia/dts/tegra2-seaboard.dts
>
> This is also somewhat out-of-date w.r.t. the latest in kernel tag
> next-20120118. It's probably not too much of an issue, so this is
> probably fine to apply as-is. U-Boot may benefit from the addition of
> many status="disable" properties, and clock-frequency properties for the
> I2C nodes. It'd be good to keep U-Boot up-to-date with the kernel as
> much as possible. Of course, there are ongoing changes being queued for
> the kernel as work is done too...
>

OK once everything is in we can do any updates that then exist based
on what is finalised in the kernel.

Regards,
Simon

> --
> nvpublic
