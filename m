From: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH v2 3/4] arm: dts: qcom: apq8064: Add display DT nodes
Date: Wed, 7 Sep 2016 15:19:24 -0700
Message-ID: <CALAqxLUe8cTnsCbkH-1Z6LaPSyjbRBWr_a4s6wB-owoUQ3-2+A@mail.gmail.com>
References: <1467957354-7620-1-git-send-email-architt@codeaurora.org>
 <1472737015-29382-1-git-send-email-architt@codeaurora.org> <1472737015-29382-4-git-send-email-architt@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1472737015-29382-4-git-send-email-architt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Archit Taneja <architt@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, Rob Clark <robdclark@gmail.com>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 1, 2016 at 6:36 AM, Archit Taneja <architt@codeaurora.org> wrote:
> APQ8064 contains a MDP4 based display controller. It contains a HDMI, LVDS
> and 2 DSI outputs.
>
> Add display DT nodes for MDP4, HDMI TX and HDMI PHY. MDP4 based display
> blocks have a flat device hierarchy.

While the nexus7 uses DSI (and requires additional dts changes), the
mdp4 bits here are required to get things going.

Tested-by: John Stultz <john.stultz@linaro.org>

thanks
-john
