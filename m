From: Peter Chen <peter.chen@freescale.com>
Subject: Re: [PATCH v2] usb: chipidea: Use extcon framework for VBUS and ID
 detect
Date: Thu, 16 Apr 2015 15:46:50 +0800
Message-ID: <20150416074649.GA1709@shlinux2>
References: <1429104915-11079-1-git-send-email-ivan.ivanov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1429104915-11079-1-git-send-email-ivan.ivanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>, cw00.choi@samsung.com
Cc: Kumar Gala <galak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 15, 2015 at 04:35:15PM +0300, Ivan T. Ivanov wrote:
> On recent Qualcomm platforms VBUS and ID lines are not routed to
> USB PHY LINK controller. Use extcon framework to receive connect
> and disconnect ID and VBUS notification.
> 
> Signed-off-by: Ivan T. Ivanov <ivan.ivanov@linaro.org>
> ---
> 
> Changes since v0 [1], as per Peter Chen suggestions:
> 
> * Moved external connector parsing code to ci_get_platdata()
> * Moved external connector related variables to struct ci_hdrc_platform_data
> * Rename ci_host_notifier() to ci_id_notifier()
> * Fixed device bindings description
> * Use select EXTCON framework, instead of depends on.

Hi Chanwoo,

It seems the CONFIG_EXTCON is better as a hide config.
See below thread for GENERIC_PHY.

http://marc.info/?l=linux-kernel&m=142902133811818&w=2

Peter
