From: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [RESEND PATCH 00/10] crypto: k3: Add sa2ul driver
Date: Thu, 27 Jun 2019 21:53:18 -0700
Message-ID: <20190628045318.GC673@sol.localdomain>
References: <20190628042745.28455-1-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190628042745.28455-1-j-keerthy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, robh+dt@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, t-kristo@ti.com, linux-crypto@vger.kernel.org, nm@ti.com
List-Id: devicetree@vger.kernel.org

Hi Keerthy,

On Fri, Jun 28, 2019 at 09:57:35AM +0530, Keerthy wrote:
> The series adds Crypto hardware accelerator support for SA2UL.
> SA2UL stands for security accelerator ultra lite.
> 
> The Security Accelerator (SA2_UL) subsystem provides hardware
> cryptographic acceleration for the following use cases:
> • Encryption and authentication for secure boot
> • Encryption and authentication of content in applications
>   requiring DRM (digital rights management) and
>   content/asset protection
> The device includes one instantiation of SA2_UL named SA2_UL0
> 
> SA2UL needs on tx channel and a pair of rx dma channels.
> 
> This series has dependency on UDMA series. Hence is based on top of:
> 
> https://patchwork.kernel.org/project/linux-dmaengine/list/?series=114105
> 
> The above series adds couple of dmaengine APIs that are used
> by the sa2ul driver. Hence there is a hard dependency on the
> above series.
> 
> Resending with linux-crypto list in Cc.
> 
> Keerthy (10):
>   dt-bindings: crypto: k3: Add sa2ul bindings documentation
>   crypto: sa2ul: Add crypto driver
>   crypto: sa2ul: Add AES ECB Mode support
>   crypto: sa2ul: Add aead support for hmac(sha1)cbc(aes) algorithm
>   crypto: sha256_generic: Export the Transform function
>   crypto: sa2ul: Add hmac(sha256)cbc(aes) AEAD Algo support
>   crypto: sa2ul: Add hmac(sha1) HMAC algorithm support
>   crypto: sa2ul: Add hmac(sha256) HMAC algorithm support
>   sa2ul: Add 3DES ECB & CBC Mode support
>   arm64: dts: k3-am6: Add crypto accelarator node
> 
>  .../devicetree/bindings/crypto/sa2ul.txt      |   47 +
>  arch/arm64/boot/dts/ti/k3-am65-main.dtsi      |   33 +
>  crypto/sha256_generic.c                       |    3 +-
>  drivers/crypto/Kconfig                        |   17 +
>  drivers/crypto/Makefile                       |    1 +
>  drivers/crypto/sa2ul.c                        | 2232 +++++++++++++++++
>  drivers/crypto/sa2ul.h                        |  384 +++
>  include/crypto/sha.h                          |    1 +
>  8 files changed, 2717 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/crypto/sa2ul.txt
>  create mode 100644 drivers/crypto/sa2ul.c
>  create mode 100644 drivers/crypto/sa2ul.h

Did you run the crypto self-tests on this driver?  i.e. boot a kernel with

	# CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
	CONFIG_DEBUG_KERNEL=y
	CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y

What are the results?

Also, this patchset does not compile for me.

Error: arch/arm64/boot/dts/ti/k3-am65-main.dtsi:103.33-34 syntax error
FATAL ERROR: Unable to parse input tree
  DTC     arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb
make[2]: *** [scripts/Makefile.lib:294: arch/arm64/boot/dts/ti/k3-am654-base-board.dtb] Error 1
make[1]: *** [scripts/Makefile.build:489: arch/arm64/boot/dts/ti] Error 2
make[1]: *** Waiting for unfinished jobs....

- Eric
