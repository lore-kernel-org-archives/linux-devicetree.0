From: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [STLinux Kernel] [PATCH v5 4/7] remoteproc: Supply controller
 driver for ST's Remote Processors
Date: Wed, 16 Mar 2016 16:38:19 +0000
Message-ID: <20160316163819.GA9595@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1452602781-22424-1-git-send-email-lee.jones@linaro.org>
 <1452602781-22424-5-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1452602781-22424-5-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, ohad@wizery.com, devicetree@vger.kernel.org, f.fainelli@gmail.com, kernel@stlinux.com, Nathan_Lynch@mentor.com, s-anna@ti.com
List-Id: devicetree@vger.kernel.org

On Tue, 12 Jan 2016, Lee Jones wrote:

> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/remoteproc/Kconfig         |   9 ++
>  drivers/remoteproc/Makefile        |   1 +
>  drivers/remoteproc/st_remoteproc.c | 297 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 307 insertions(+)
>  create mode 100644 drivers/remoteproc/st_remoteproc.c

Acked-by: Peter Griffin <peter.griffin@linaro.org>

regards,

Peter.
