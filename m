From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] nvmem: imx-ocotp: add write support
Date: Mon, 3 Apr 2017 08:18:09 -0500
Message-ID: <20170403131809.6j2sfg57mukksum2@rob-hp-laptop>
References: <1490621491-28247-1-git-send-email-richard.leitner@skidata.com>
 <1490621491-28247-2-git-send-email-richard.leitner@skidata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1490621491-28247-2-git-send-email-richard.leitner@skidata.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Leitner <richard.leitner@skidata.com>
Cc: linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org, maxime.ripard@free-electrons.com, mark.rutland@arm.com, devicetree@vger.kernel.org, dev@g0hl1n.net
List-Id: devicetree@vger.kernel.org

On Mon, Mar 27, 2017 at 03:31:31PM +0200, Richard Leitner wrote:
> Implement write routine for OCOTP controller found in i.MX6 SoC's.
> Furthermore add locking to the read function to prevent race conditions.
> The write routine code is based on the fsl_otp driver from Freescale.
> 
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> ---
>  .../devicetree/bindings/nvmem/imx-ocotp.txt        |   4 +

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/nvmem/imx-ocotp.c                          | 210 ++++++++++++++++++++-
>  2 files changed, 212 insertions(+), 2 deletions(-)
