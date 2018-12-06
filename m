From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sdm845: Add SD nodes for sdm845-mtp
Date: Thu, 6 Dec 2018 15:44:33 -0800
Message-ID: <CAD=FV=W+-+YpPQESSN6GTy_O5UiPOZLvZ9g8fxXFA55g8h9S5g@mail.gmail.com>
References: <20181206184522.118062-1-evgreen@chromium.org> <20181206184522.118062-4-evgreen@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181206184522.118062-4-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Evan Green <evgreen@chromium.org>
Cc: Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Dec 6, 2018 at 10:46 AM Evan Green <evgreen@chromium.org> wrote:
>
> Enable support for one of the micro SD slots on the MTP.
>
> Signed-off-by: Evan Green <evgreen@chromium.org>
> ---
>
> Changes in v2:
>  - Fixed alphabetization of node placement in sdm845-mtp.dtsi (Doug)
>  - Fixed card detect name to match schematics (Doug).
>  - Moved comment about drive strength next to the drive-strength entry
>  (Doug)
>  - Removed drive-strength from card detect input pin (Doug).
>  - Consolidated tlmm nodes in MTP.
>
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 58 ++++++++++++++++++++++++-
>  1 file changed, 56 insertions(+), 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
