From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [v4 3/6] media: platform: dwc: Add MIPI CSI-2 platform data
Date: Fri, 9 Aug 2019 17:39:00 +0300
Message-ID: <20190809143900.GC864@valkosipuli.retiisi.org.uk>
References: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
 <1560280855-18085-4-git-send-email-luis.oliveira@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1560280855-18085-4-git-send-email-luis.oliveira@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Luis Oliveira <Luis.Oliveira@synopsys.com>
Cc: mchehab@kernel.org, davem@davemloft.net, gregkh@linuxfoundation.org, Jonathan.Cameron@huawei.com, robh@kernel.org, nicolas.ferre@microchip.com, paulmck@linux.ibm.com, mark.rutland@arm.com, kishon@ti.com, devicetree@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Joao.Pinto@synopsys.com
List-Id: devicetree@vger.kernel.org

Hi Luis,

On Tue, Jun 11, 2019 at 09:20:52PM +0200, Luis Oliveira wrote:
> This allows the driver loading via platform data which makes the driver
> not device tree dependent.
> 
> Signed-off-by: Luis Oliveira <luis.oliveira@synopsys.com>

Platform data? I thought we ceased to add support for platform data long
time ago.

-- 
Regards,

Sakari Ailus
