From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4] mfd: arizona: Add DT options for max_channels_clocked
 and PDM speaker config
Date: Fri, 23 Sep 2016 08:30:25 -0500
Message-ID: <20160923133025.GA20371@rob-hp-laptop>
References: <1473757544-6490-1-git-send-email-rf@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1473757544-6490-1-git-send-email-rf@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
Cc: lee.jones@linaro.org, patches@opensource.wolfsonmicro.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 13, 2016 at 10:05:44AM +0100, Richard Fitzgerald wrote:
> This patch adds DT settings for the max_channels_clocked, spk_fmt and
> spk_mute pdata.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
> ---
>  Documentation/devicetree/bindings/mfd/arizona.txt | 18 ++++++++++++++
>  drivers/mfd/arizona-core.c                        | 30 +++++++++++++++++++++++
>  2 files changed, 48 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
