From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Subject: Re: [PATCH 1/2] usb: phy: msm: Use extcon framework for VBUS and ID
 detection
Date: Tue, 21 Apr 2015 10:28:32 +0300
Message-ID: <1429601312.15866.11.camel@mm-sol.com>
References: <1428568462-20193-1-git-send-email-ivan.ivanov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1428568462-20193-1-git-send-email-ivan.ivanov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Thu, 2015-04-09 at 11:34 +0300, Ivan T. Ivanov wrote:
> On recent Qualcomm platforms VBUS and ID lines are not routed to
> USB PHY LINK controller. Use extcon framework to receive connect
> and disconnect ID and VBUS notification.
> 
> Signed-off-by: Ivan T. Ivanov ivanov@linaro.org>

Hi Felipe,

Did you have any comments on this and/or following patches?

Regards,
Ivan
