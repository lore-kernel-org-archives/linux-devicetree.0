From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/1] arm64: dts: qcom: Add Lenovo Yoga C630
Date: Tue, 3 Sep 2019 07:20:40 +0100
Message-ID: <20190903062040.GC26880@dell>
References: <20190902132400.14084-1-lee.jones@linaro.org>
 <20190903054451.GV6167@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190903054451.GV6167@minitux>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 02 Sep 2019, Bjorn Andersson wrote:

> On Mon 02 Sep 06:24 PDT 2019, Lee Jones wrote:
> 
> > From: Bjorn Andersson <bjorn.andersson@linaro.org>
> > 
> > The Lenovo Yoga C630 is built on the SDM850 from Qualcomm, but this seem
> > to be similar enough to the SDM845 that we can reuse the sdm845.dtsi.
> > 
> > Supported by this patch is: keyboard, battery monitoring, UFS storage,
> > USB host and Bluetooth.
> 
> Applied this to next-20190829 and booted it, got a little bit of EFI FB,
> then the screen goes blank and after a while I'm back in GRUB.
> 
> I've not been able to figure out what's causing this though.

Probably DMA.  There is still an issue in the COM GENI Serial Engine
Driver which reboots the system when a DMA transaction is initiated.

However, with a workaround patch applied to the Serial Engine driver
(drivers/soc/qcom/qcom-geni-se.c) this DTS has no issue booting the
system.

We have ~12 weeks to either fix or elegantly work around the Serial
Engine issue.  IMHO is makes no sense to hold back this enablement
patch (which cannot go in via the -rcs) for something which is likely
to be fixed and applied during v3.4-rcX.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
