Return-Path: <SRS0=RHPx=KS=gondor.apana.org.au=herbert@kernel.org>
Date: Fri, 3 Aug 2018 21:58:35 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH V2 0/3] Hisilicon SEC crypto driver (hip06 / hip07)
Message-ID: <20180803135835.coqeqgnftcu7c4ek@gondor.apana.org.au>
References: <20180723154955.12944-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180723154955.12944-1-Jonathan.Cameron@huawei.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-crypto@vger.kernel.org, davem@davemloft.net, smueller@chronox.de, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linuxarm@huawei.com, xuzaibo@huwei.com, fanghao11@huawei.com, liguozhu@hisilicon.com, wangxiongfeng2@huawei.com
List-ID: <devicetree@vger.kernel.org>

On Mon, Jul 23, 2018 at 04:49:52PM +0100, Jonathan Cameron wrote:
> The driver provides in kernel support for the Hisilicon SEC accelerator
> found in the hip06 and hip07 SoCs.  There are 4 such units on the D05
> board for which an appropriate DT binding has been provided.  ACPI also
> works with an appropriate UEFI build.
> 
> The hardware does not update the IV in chaining or counting modes.
> This is done in the drive ron completion of the cipher operation.
> 
> The driver support AES, DES and 3DES block ciphers in a range of
> modes (others to follow). Hash and AAED support to follow.
> 
> Sorry for the delay on this one, other priorities and all that...
> 
> Changes since V1.
> 1) DT binding fixes suggested by Rob Herring in patches 1 and 3.
> 2) Added XTS key check as suggested by Stephan Muller.
> 3) A trivial use after free found during testing of the above.
> 
> Changes since RFC.
> 1) Addition of backlog queuing as needed to support dm-crypt usecases.
> 2) iommu presence tests now done as Robin Murphy suggested.
> 3) Hardware limiation to 32MB requests worked aroud in driver so it will
>    now support very large requests (512*32MB).  Larger request handling
>    than this would require a longer queue with the associate overheads and
>    is considered unlikely to be necessary.
> 4) The specific handling related to the inline IV patch set from Stephan
>    has been dropped for now.
> 5) Interrupt handler was previous more complex than necessary so has been
>    reworked.
> 6) Use of the bounce buffer for small packeets is dropped for now.  This is a
>    performance optimization that made the code harder to review and can be
>    reintroduced as necessary at a later date.
> 7) Restructuring of some code to simplify hash and aaed (hash implemented
>    but not ready fo upstream at this time)
> 8) Various minor fixes and reworks of the code
>    * several off by one errors in the cleanup paths
>    * single template for enc and dec
>    * drop dec_key as not used (enc_key was used in both cases)
>    * drop dma pool for IVs as it breaks chaining.
>    * lots of spinlocks changed to mutexes as not taken in atomic context.
>    * nasty memory leak cleaned up.
> 
> Jonathan Cameron (3):
>   dt-bindings: Add bindings for Hisilicon SEC crypto accelerators.
>   crypto: hisilicon SEC security accelerator driver
>   arm64: dts: hisi: add SEC crypto accelerator nodes for hip07 SoC
> 
>  .../bindings/crypto/hisilicon,hip07-sec.txt        |   67 +
>  arch/arm64/boot/dts/hisilicon/hip07.dtsi           |  284 +++++
>  drivers/crypto/Kconfig                             |    2 +
>  drivers/crypto/Makefile                            |    1 +
>  drivers/crypto/hisilicon/Kconfig                   |   14 +
>  drivers/crypto/hisilicon/Makefile                  |    2 +
>  drivers/crypto/hisilicon/sec/Makefile              |    3 +
>  drivers/crypto/hisilicon/sec/sec_algs.c            | 1122 +++++++++++++++++
>  drivers/crypto/hisilicon/sec/sec_drv.c             | 1323 ++++++++++++++++++++
>  drivers/crypto/hisilicon/sec/sec_drv.h             |  428 +++++++
>  10 files changed, 3246 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/crypto/hisilicon,hip07-sec.txt
>  create mode 100644 drivers/crypto/hisilicon/Kconfig
>  create mode 100644 drivers/crypto/hisilicon/Makefile
>  create mode 100644 drivers/crypto/hisilicon/sec/Makefile
>  create mode 100644 drivers/crypto/hisilicon/sec/sec_algs.c
>  create mode 100644 drivers/crypto/hisilicon/sec/sec_drv.c
>  create mode 100644 drivers/crypto/hisilicon/sec/sec_drv.h

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
