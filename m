From: Rameshwar Sahu <rsahu@apm.com>
Subject: Re: [PATCH v1 0/4] Crypto: tcrypt: Add test case for APM X-Gene SoC
 CRC32C algo
Date: Thu, 30 Jul 2015 17:50:58 +0530
Message-ID: <CAFd313wpsfYtK=fZ4Qin1y8vtX7-tgAEPPBtVDqAW8wxtisgAw@mail.gmail.com>
References: <1438258268-3099-1-git-send-email-rsahu@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-crypto-owner@vger.kernel.org>
In-Reply-To: <1438258268-3099-1-git-send-email-rsahu@apm.com>
Sender: linux-crypto-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>, dan.j.williams@intel.com, herbert@gondor.apana.org.au, davem@davemloft.net
Cc: linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jcm@redhat.com, patches@apm.com, Rameshwar Prasad Sahu <rsahu@apm.com>
List-Id: devicetree@vger.kernel.org

Hi All,

On Thu, Jul 30, 2015 at 5:41 PM, Rameshwar Prasad Sahu <rsahu@apm.com> wrote:
> This patch adds test case for APM X-Gene SoC CRC32C algorithm.

Please discard this patch description and subject line in this cover
letter, I have resent it again.

Thanks,
Ram

>
> Signed-off-by: Rameshwar Prasad Sahu <rsahu@apm.com>
> ---
>
> Rameshwar Prasad Sahu (4):
>   dmaengine: Add support for new feature CRC32C
>   dmaengine: xgene-dma: Add support for CRC32C calculation via DMA
>     engine
>   Crypto: Add support for APM X-Gene SoC CRC32C h/w accelerator driver
>   Crypto: tcrypt: Add test case for APM X-Gene SoC CRC32C algo
>
>  crypto/tcrypt.c               |   4 +
>  crypto/testmgr.c              |   9 ++
>  drivers/crypto/Kconfig        |   8 ++
>  drivers/crypto/Makefile       |   1 +
>  drivers/crypto/xgene-crc32c.c | 244 ++++++++++++++++++++++++++++++++
>  drivers/dma/dmaengine.c       |   2 +
>  drivers/dma/xgene-dma.c       | 317 ++++++++++++++++++++++++++++++++++++++++--
>  include/linux/dmaengine.h     |   5 +
>  8 files changed, 575 insertions(+), 15 deletions(-)
>  create mode 100755 drivers/crypto/xgene-crc32c.c
>
> --
> 1.8.2.1
