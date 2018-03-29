From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 4/7] dt-bindings: phy-qcom-qmp: Update bindings for sdm845
Date: Thu, 29 Mar 2018 12:39:11 -0700
Message-ID: <CAD=FV=W-OfjagiDxchV-aBNzhfV-2=MN+CJtoLAMe2jGYUc4uA@mail.gmail.com>
References: <1522321466-21755-1-git-send-email-mgautam@codeaurora.org> <1522321466-21755-5-git-send-email-mgautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1522321466-21755-5-git-send-email-mgautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manu Gautam <mgautam@codeaurora.org>, Rob Herring <robh+dt@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Stephen Boyd <sboyd@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Vivek Gautam <vivek.gautam@codeaurora.org>, Evan Green <evgreen@chromium.org>, linux-arm-msm@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Varadarajan Narayanan <varada@codeaurora.org>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Mar 29, 2018 at 4:04 AM, Manu Gautam <mgautam@codeaurora.org> wrote:
> Update compatible strings for USB3 PHYs on SDM845.
> One is QMPv3 DisplayPort-USB combo PHY and other one
> is USB UNI PHY which is single lane USB3 PHY without
> DP capability. While at it also remove "qcom,qmp-v3-usb3-phy"
> compatible string which was earlier added for sdm845
> only as there wouldn't be any user of same.
>
> Reviewed-by: Rob Herring <robh@kernel.org>

IMHO you should remove Rob's Review until he re-reviews.  I want to
make sure he's OK with the removal of the "qcom,qmp-v3-usb3-phy".
Rob: that compatible string was _just_ added and was intended for
SDM845.  It's not expected that there are any users yet.  IMHO that
means it's OK to remove, but it would be good to get your confirmation
that you agree.  See the discussion at
<https://patchwork.kernel.org/patch/10302761/>.


> Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
