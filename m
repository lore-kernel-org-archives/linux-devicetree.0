From: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: Add SDHCI support for STMicroelectronics SoCs
Date: Mon, 2 Jun 2014 11:29:30 +0100
Message-ID: <20140602102930.GB437@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1400771902-26553-1-git-send-email-peter.griffin@linaro.org>
 <537E1B55.1090807@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-mmc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <537E1B55.1090807@st.com>
Sender: linux-mmc-owner@vger.kernel.org
To: Maxime Coquelin <maxime.coquelin@st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, patrice.chotard@st.com, srinivas.kandagatla@gmail.com, chris@printf.net, ulf.hansson@linaro.org, kernel@stlinux.com, lee.jones@linaro.org, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Maxime,

On Thu, 22 May 2014, Maxime Coquelin wrote:

> >Initially it supports the stih416 and stih415 SoCs, and has
> >been tested on a stih416-b2020 board.
> 
> In next version, could you also add  drivers/mmc/host/sdhci-st.c in
> the ARM/STI ARCHITECTURE field of MAINTAINERS file?

Was out on hols last week. I have fixed it in v2.

Cheers,

Peter

