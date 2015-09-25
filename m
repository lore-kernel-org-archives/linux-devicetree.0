From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH 09/14] ARM: dts: ifc6410: Add missing pinctrl to gsbi7 uart
Date: Fri, 25 Sep 2015 11:54:35 -0700
Message-ID: <CAMAWPa_7U-PBwsngU+qc5SAt4HcCvPwUGvGY9nPUu+pZtPA7Uw@mail.gmail.com>
References: <1442579371-19822-1-git-send-email-srinivas.kandagatla@linaro.org>
	<1442579507-20314-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1442579507-20314-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Andy Gross <agross@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, Tyler Baker <tyler.baker@linaro.org>, Olof Johansson <olof@lixom.net>, Nicolas Dechesne <nicolas.dechesne@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Srini,

On Fri, Sep 18, 2015 at 5:31 AM, Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
> This patch adds missing 2pin uart pinctrl property to gsbi7 uart on
> IFC6410.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

kernelci.org found some new boot failures in -next on 8064[1].  I
bisected it down to this patch, which landed in linux next in the form
of commit d3a578ed4310 ARM: dts: ifc6410: Add missing pinctrl to gsbi7
uart.

Kevin

[1] http://kernelci.org/boot/qcom-apq8064-ifc6410/job/next/kernel/next-20150925/defconfig/multi_v7_defconfig/lab/lab-khilman/?_id=5605083c59b51466d26c3250
