From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/8] dt-bindings: tpm: document properties for cr50
Date: Tue, 9 Jul 2019 08:41:26 -0600
Message-ID: <20190709144126.GA12345@bogus>
References: <20190613180931.65445-1-swboyd@chromium.org>
 <20190613180931.65445-5-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190613180931.65445-5-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Andrey Pronin <apronin@chromium.org>, linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-integrity@vger.kernel.org, devicetree@vger.kernel.org, Duncan Laurie <dlaurie@chromium.org>, Guenter Roeck <groeck@chromium.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 13, 2019 at 11:09:27AM -0700, Stephen Boyd wrote:
> From: Andrey Pronin <apronin@chromium.org>
> 
> Add TPM2.0 PTP FIFO compatible SPI interface for chips with Cr50
> firmware.
> 
> Signed-off-by: Andrey Pronin <apronin@chromium.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
> 
> This is a resend of https://lkml.kernel.org/r/1469757314-116169-2-git-send-email-apronin@chromium.org
> with status removed.
> 
>  .../bindings/security/tpm/cr50_spi.txt        | 19 +++++++++++++++++++

google,cr50.txt instead.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

>  1 file changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/security/tpm/cr50_spi.txt
