From: Ohad Ben-Cohen <ohad@wizery.com>
Subject: Re: [RESEND v4 0/6] remoteproc: Add driver for STMicroelectronics platforms
Date: Thu, 26 Nov 2015 10:45:00 +0200
Message-ID: <CAK=WgbZbiq_BAUEti9tWUtWqZPU_4gDJ5Mfqur=Ou2N4Ea+2GQ@mail.gmail.com>
References: <1448370862-19120-1-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448370862-19120-1-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: linux-arm <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel@stlinux.com, maxime.coquelin@st.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Nathan_Lynch@mentor.com, f.fainelli@gmail.com, ludovic.barre@st.com, "Anna, Suman" <s-anna@ti.com>
List-Id: devicetree@vger.kernel.org

Hi Lee,

On Tue, Nov 24, 2015 at 3:14 PM, Lee Jones <lee.jones@linaro.org> wrote:
> ST's platforms often have multiple co-processors (usually ST40s or ST231s)
> on-board.  This provides the Linux-side infrastructure to flash and boot
> them successfully.
>
> This set has been tested on an STiH410-B2120.

It would be nice if you could get at least one Reviewed-by tag coming
outside of ST (e.g., Suman or Bjorn who are actively using and
improving remoteproc).

>  arch/arm/boot/dts/stih407-family.dtsi              |  70 +++++

Since this is outside of remoteproc, please have it Acked, preferably
by ARM DT maintainer (Olof?).

Thanks,
Ohad.
