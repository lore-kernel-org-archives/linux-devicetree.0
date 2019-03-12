From: Evan Green <evgreen@chromium.org>
Subject: Re: [PATCH] arm64: dts: sdm845: Include the interconnect resources DT header
Date: Tue, 12 Mar 2019 16:24:10 -0700
Message-ID: <CAE=gft57bX_CeDJdb=aFUkGBoODLdXipgtHqNWV_-KdpYmXvfg@mail.gmail.com>
References: <20190311140602.12160-1-georgi.djakov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190311140602.12160-1-georgi.djakov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, daidavid1@codeaurora.org, Doug Anderson <dianders@chromium.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 11, 2019 at 7:06 AM Georgi Djakov <georgi.djakov@linaro.org> wrote:
>
> Include the device tree header for the on-chip interconnect endpoint
> resources on sdm845 devices. This will allow using the "interconnects"
> property in DT nodes to describe the interconnect path resources they use.
>
> The sdm845 interconnect provider DT node is already present, but the
> header file with the resources is not included, so let's fix this.
>
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>

Reviewed-by: Evan Green <evgreen@chromium.org>
