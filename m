From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v2 2/8] [media] stm32-dcmi: STM32 DCMI camera interface
 driver
Date: Mon, 3 Apr 2017 12:37:23 +0200
Message-ID: <06d75af6-1d2e-8cfd-e3f6-96d36ce014f2@xs4all.nl>
References: <1490887667-8880-1-git-send-email-hugues.fruchet@st.com>
 <1490887667-8880-3-git-send-email-hugues.fruchet@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1490887667-8880-3-git-send-email-hugues.fruchet@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hugues Fruchet <hugues.fruchet@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Yannick Fertre <yannick.fertre@st.com>
List-Id: devicetree@vger.kernel.org

On 03/30/2017 05:27 PM, Hugues Fruchet wrote:
> This V4L2 subdev driver enables Digital Camera Memory Interface (DCMI)
> of STMicroelectronics STM32 SoC series.
> 
> Signed-off-by: Yannick Fertre <yannick.fertre@st.com>
> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
> ---
>  drivers/media/platform/Kconfig            |   12 +
>  drivers/media/platform/Makefile           |    2 +
>  drivers/media/platform/stm32/Makefile     |    1 +
>  drivers/media/platform/stm32/stm32-dcmi.c | 1417 +++++++++++++++++++++++++++++
>  4 files changed, 1432 insertions(+)
>  create mode 100644 drivers/media/platform/stm32/Makefile
>  create mode 100644 drivers/media/platform/stm32/stm32-dcmi.c

Reviewed-by: Hans Verkuil <hans.verkuil@cisco.com>

Looks good!

Regards,

	Hans
