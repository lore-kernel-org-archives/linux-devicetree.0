From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V5 2/6] of/slimbus: OF helper for SLIMbus
Date: Thu, 28 Apr 2016 11:54:02 +0200
Message-ID: <7224042.xJrLyG5lxh@wuerfel>
References: <1461801489-16254-1-git-send-email-sdharia@codeaurora.org> <1461801489-16254-3-git-send-email-sdharia@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1461801489-16254-3-git-send-email-sdharia@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Sagar Dharia <sdharia@codeaurora.org>
Cc: gregkh@linuxfoundation.org, bp@suse.de, poeschel@lemonage.de, treding@nvidia.com, broonie@kernel.org, gong.chen@linux.intel.com, andreas.noever@gmail.com, alan@linux.intel.com, mathieu.poirier@linaro.org, daniel@ffwll.ch, jkosina@suse.cz, sharon.dvir1@mail.huji.ac.il, joe@perches.com, davem@davemloft.net, james.hogan@imgtec.com, michael.opdenacker@free-electrons.com, daniel.thompson@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kheitke@audience.com, mlocke@codeaurora.org, agross@codeaurora.org, sheetal.tigadoli@gmail.com, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wednesday 27 April 2016 17:58:05 Sagar Dharia wrote:
> +#if IS_ENABLED(CONFIG_OF)
> +/* OF helpers for SLIMbus */
> +static void of_register_slim_devices(struct slim_controller *ctrl)
> +{
> +       struct device_node *node;
> 

The #ifdef seems useless here, what kind of system would not have CONFIG_OF
enabled? I'd suggest merging this into patch 1 and removing the conditional

	Arnd
