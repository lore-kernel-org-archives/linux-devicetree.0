From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: Add Dragonboard 845c
Date: Thu, 6 Jun 2019 00:29:09 -0700
Message-ID: <20190606072909.GU22737@tuxbook-pro>
References: <20190606043851.18050-1-bjorn.andersson@linaro.org>
 <CAFp+6iG66C-6ySw81bVsxbWqP+qCza0+QxuQ4Z-MXqB6DV2KZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAFp+6iG66C-6ySw81bVsxbWqP+qCza0+QxuQ4Z-MXqB6DV2KZg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu 06 Jun 00:26 PDT 2019, Vivek Gautam wrote:

> Hi Bjorn,
> 
> On Thu, Jun 6, 2019 at 10:10 AM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > This adds an initial dts for the Dragonboard 845. Supported
> > functionality includes Debug UART, UFS, USB-C (peripheral), USB-A
> > (host), microSD-card and Bluetooth.
> >
> > Initializing the SMMU is clearing the mapping used for the splash screen
> > framebuffer, which causes the board to reboot. This can be worked around
> > using:
> >
> >   fastboot oem select-display-panel none
> 
> This works well with your SMR handoff RFC series too?
> 

With the SMR handoff series this is no longer necessary, we can boot the
board with boot splash enabled.

> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> 
> Patch looks good, so
> Reviewed-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> 

Thanks,
Bjorn
