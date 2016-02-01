From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v7 1/4] dt/bindings: add bindings for optee
Date: Mon, 1 Feb 2016 08:11:23 -0600
Message-ID: <20160201141123.GA7792@rob-hp-laptop>
References: <1454318140-7962-1-git-send-email-jens.wiklander@linaro.org>
 <1454318140-7962-2-git-send-email-jens.wiklander@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1454318140-7962-2-git-send-email-jens.wiklander@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, valentin.manea@huawei.com, jean-michel.delorme@st.com, emmanuel.michel@st.com, javier@javigon.com, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Mark Rutland <mark.rutland@arm.com>, Michal Simek <michal.simek@xilinx.com>, Will Deacon <will.deacon@arm.com>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 01, 2016 at 10:15:37AM +0100, Jens Wiklander wrote:
> Introduces linaro prefix and adds bindings for ARM TrustZone based OP-TEE
> implementation.
> 
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  .../bindings/arm/firmware/linaro,optee-tz.txt      | 31 ++++++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.txt        |  1 +
>  2 files changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.txt

Acked-by: Rob Herring <robh@kernel.org>
