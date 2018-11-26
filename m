From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcs404: Add WCN3990 WLAN module device node
Date: Mon, 26 Nov 2018 12:31:40 -0200
Message-ID: <CAOMZO5Dne5utQ6i+n_Ab1=9AG7WYcZRhq7GY72rqyEdyau0swA@mail.gmail.com>
References: <20181126142133.16966-1-govinds@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181126142133.16966-1-govinds@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: govinds@codeaurora.org
Cc: Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 26, 2018 at 12:22 PM Govind Singh <govinds@codeaurora.org> wrote:

> +
> +               wifi: wifi@0A000000 {

Please remove the leading zero. Building with W=1 would warn you about that.
