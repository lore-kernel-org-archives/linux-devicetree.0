From: Peter Chen <hzpeterchen@gmail.com>
Subject: Re: [RFC PATCH 0/4] Implement USB device/host switch for Vybrid
Date: Fri, 25 Mar 2016 15:40:51 +0800
Message-ID: <20160325074051.GB22398@peterchendt>
References: <cover.1458030082.git.maitysanchayan@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1458030082.git.maitysanchayan@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sanchayan Maity <maitysanchayan@gmail.com>
Cc: Peter.Chen@nxp.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, stefan@agner.ch, ivan.ivanov@linaro.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, shawnguo@kernel.org, marcel@ziswiler.com
List-Id: devicetree@vger.kernel.org

On Tue, Mar 15, 2016 at 02:08:26PM +0530, Sanchayan Maity wrote:
> Hello Peter,
> 
> The existing usage of extcon in Chipidea driver relies on OTG
> registers. In case of SoC with dual role device but not a true
> OTG controller, this does not work. Such SoC's should specify
> the existing CI_HDRC_DUAL_ROLE_NOT_OTG flag and do the role
> switch without checking any of the OTG registers in my opinion.
> This is the case for Vybrid which uses a Chipidea IP but does
> not have a true 5 pin OTG implemented.

Sorry to reply you late due to my new born baby.

Are you sure Vybrid is NOT OTG core? Afaik, it is uses the same
IP base with other Freescale SoCs, just the IP core is 2.40a.
When working at device mode, can you read vbus status through
OTGSC? And if there is an ID pin (input pin) for Vybrid? I mean
SoC, not the board.

-- 
Best Regards,
Peter Chen
