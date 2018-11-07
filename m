From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH 02/12] soc: qcom: ipa: DMA helpers
Date: Wed, 7 Nov 2018 13:17:29 +0100
Message-ID: <CAK8P3a3Hur9Kn=QLrn7XDn-Kpgfta1xTxvuwcBze4n2v7fsULw@mail.gmail.com>
References: <20181107003250.5832-1-elder@linaro.org> <20181107003250.5832-3-elder@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181107003250.5832-3-elder@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Elder <elder@linaro.org>
Cc: David Miller <davem@davemloft.net>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Networking <netdev@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, syadagir@codeaurora.org, mjavid@codeaurora.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 7, 2018 at 1:33 AM Alex Elder <elder@linaro.org> wrote:
>
> This patch includes code implementing the IPA DMA module, which
> defines a structure to represent a DMA allocation for the IPA device.
> It's used throughout the IPA code.
>
> Signed-off-by: Alex Elder <elder@linaro.org>

I looked through all the users of this and couldn't fine one that actually
benefits from it. I'd say better drop this patch entirely and open-code
the contents in the callers. That will help readability since the dma
API is well understood by many people.

Generally speaking, try not to wrap Linux interfaces into driver specific
helper functions.

      Arnd
