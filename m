From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v5 0/7] gpio: daVinci: cleanup and feature enhancement
Date: Mon, 11 Nov 2013 17:52:02 +0200
Message-ID: <5280FD22.8060107@ti.com>
References: <1383905510-31760-1-git-send-email-prabhakar.csengg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <1383905510-31760-1-git-send-email-prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: Prabhakar Lad <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DLOS <davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, LAK <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Prabhakar Lad,

On 11/08/2013 12:11 PM, Prabhakar Lad wrote:
> From: KV Sujith <sujithkv-l0cyMroinI0@public.gmane.org>
>
> This patch series does the following
> 1> Ports the driver to use irqdomain.
> 2> Adds dt binding support for gpio-davinci.
> 3> Adds DA850 dt support goio.
>
> Changes for v5:
> 1: Fixed review comments pointed by Grygorii.
> 2: Dropped the fixup patch
>
> This patch series is based on following fixup series
> http://us.generation-nt.com/answer/patch-0-2-davinci-gpio-fixes-help-212978272.html

Few comments to this series - the rest looks ok to me.
  Hope it will pass review of bindings :P

>
> KV Sujith (3):
>    gpio: davinci: add OF support
>    ARM: davinci: da850: add GPIO DT node
>    ARM: davinci: da850 evm: add GPIO pinumux entries DT node
>
> Lad, Prabhakar (4):
>    gpio: davinci: remove unnecessary printk
>    gpio: davinci: use readl/writel instead of __raw_*
>    gpio: davinci: use irqdomain
>    gpio: davinci: remove unused variable intc_irq_num
>
>   .../devicetree/bindings/gpio/gpio-davinci.txt      |   39 +++++
>   arch/arm/boot/dts/da850-evm.dts                    |   20 +++
>   arch/arm/boot/dts/da850.dtsi                       |   14 ++
>   arch/arm/mach-davinci/da830.c                      |    1 -
>   arch/arm/mach-davinci/da850.c                      |    1 -
>   arch/arm/mach-davinci/dm355.c                      |    1 -
>   arch/arm/mach-davinci/dm365.c                      |    1 -
>   arch/arm/mach-davinci/dm644x.c                     |    1 -
>   arch/arm/mach-davinci/dm646x.c                     |    1 -
>   drivers/gpio/gpio-davinci.c                        |  170 +++++++++++++-------
>   include/linux/platform_data/gpio-davinci.h         |    3 +-
>   11 files changed, 185 insertions(+), 67 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/gpio/gpio-davinci.txt
>
Regards,
- grygorii
