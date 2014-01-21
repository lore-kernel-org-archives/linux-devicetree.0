From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 1/2] dmaengine: add Qualcomm BAM dma driver
Date: Wed, 22 Jan 2014 00:12:56 +0100
Message-ID: <3380039.pmsbzceqbf@wuerfel>
References: <1389380874-22753-1-git-send-email-agross@codeaurora.org> <5548936.L46nLkuVIz@wuerfel> <20140121230103.GA3554@qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20140121230103.GA3554@qualcomm.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Gross <agross@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tuesday 21 January 2014 17:01:03 Andy Gross wrote:
> 
> Thanks for the clarification.  I think I'll probably do:
> ARCH_MSM_DT || (COMPILE_TEST && ARM)
> 
> The latter due to my use of writel_relaxed.

Yes, looks good.

	Arnd
