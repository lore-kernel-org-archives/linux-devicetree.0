From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 2/4] crypto: amlogic: Add crypto accelerator for amlogic GXL
Date: Sat, 27 Jul 2019 14:17:38 +0200
Message-ID: <CAFBinCD7pgUaBJgeGHTOu-uZRA9a6K2kxPsu+huKe23wcnKPoA@mail.gmail.com>
References: <1564083776-20540-1-git-send-email-clabbe@baylibre.com> <1564083776-20540-3-git-send-email-clabbe@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1564083776-20540-3-git-send-email-clabbe@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Labbe <clabbe@baylibre.com>
Cc: davem@davemloft.net, herbert@gondor.apana.org.au, khilman@baylibre.com, mark.rutland@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, baylibre-upstreaming@groups.io, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Corentin,

it's great to see you working on this :)

On Thu, Jul 25, 2019 at 9:45 PM Corentin Labbe <clabbe@baylibre.com> wrote:
>
> This patch adds support for the amlogic GXL cryptographic offloader present
> on GXL SoCs.
>
> This driver supports AES cipher in CBC/ECB mode.
>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  drivers/crypto/Kconfig                  |   2 +
>  drivers/crypto/Makefile                 |   1 +
>  drivers/crypto/amlogic/Kconfig          |  24 ++
>  drivers/crypto/amlogic/Makefile         |   2 +
>  drivers/crypto/amlogic/amlogic-cipher.c | 358 ++++++++++++++++++++++++
>  drivers/crypto/amlogic/amlogic-core.c   | 326 +++++++++++++++++++++
>  drivers/crypto/amlogic/amlogic.h        | 172 ++++++++++++
>  7 files changed, 885 insertions(+)
>  create mode 100644 drivers/crypto/amlogic/Kconfig
>  create mode 100644 drivers/crypto/amlogic/Makefile
>  create mode 100644 drivers/crypto/amlogic/amlogic-cipher.c
>  create mode 100644 drivers/crypto/amlogic/amlogic-core.c
>  create mode 100644 drivers/crypto/amlogic/amlogic.h
there are two different crypto IPs on Amlogic SoCs:
- GXL and newer use the "BLKMV" crypto IP
- GXBB, Meson8/Meson8b/Meson8m2 (and probably older SoCs) use the
"NDMA" crypto IP

personally I think it makes sense to either have the IP name (blkmv)
or SoC name (GXL) in the file or directory names as well as being
consistent with that in the Kconfig option names

(I have no experience with the crypto framework so I cannot comment on
the driver implementation itself)


Martin
