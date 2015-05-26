From: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Subject: Re: [PATCH v2] usb: chipidea: Use extcon framework for VBUS and ID
 detect
Date: Tue, 26 May 2015 10:47:08 +0300
Message-ID: <1432626428.2348.15.camel@linaro.org>
References: <1429104915-11079-1-git-send-email-ivan.ivanov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429104915-11079-1-git-send-email-ivan.ivanov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Chen <Peter.Chen@freescale.com>
Cc: Kumar Gala <galak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Wed, 2015-04-15 at 16:35 +0300, Ivan T. Ivanov wrote:
> On recent Qualcomm platforms VBUS and ID lines are not routed to
> USB PHY LINK controller. Use extcon framework to receive connect
> and disconnect ID and VBUS notification.
> 
> Signed-off-by: Ivan T. Ivanov ivanov@linaro.org>
> ---
> 
> Changes since v0 [1], as per Peter Chen suggestions:
> 
> * Moved external connector parsing code to ci_get_platdata()
> * Moved external connector related variables to struct ci_hdrc_platform_data
> * Rename ci_host_notifier() to ci_id_notifier()
> * Fixed device bindings description
> * Use select EXTCON framework, instead of depends on.
> 
> [1] https://lkml.org/lkml/2015/4/9/116

Hi Peter, 

Did you have any further comments on this patch
or what is your plan about it.

Regards,
Ivan
