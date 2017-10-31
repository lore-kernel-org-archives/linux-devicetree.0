From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v4 0/3] media: ov7740: Add a V4L2 sensor-level driver
Date: Tue, 31 Oct 2017 09:40:21 +0200
Message-ID: <20171031074020.udssku6pazxooa7q@valkosipuli.retiisi.org.uk>
References: <20171031011146.6899-1-wenyou.yang@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171031011146.6899-1-wenyou.yang@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wenyou Yang <wenyou.yang@microchip.com>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, devicetree@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Hans Verkuil <hverkuil@xs4all.nl>, linux-arm-kernel@lists.infradead.org, Linux Media Mailing List <linux-media@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Wenyou,

On Tue, Oct 31, 2017 at 09:11:42AM +0800, Wenyou Yang wrote:
> Add a Video4Linux2 sensor-level driver for the OmniVision OV7740
> VGA camera image sensor.

For the next version, could you rearrange your patches a bit as follows:

1. DT bindings
2. The driver and MAINTAINERS entry

Putting the MAINTAINERS entry separately from the driver emits a warning
from checkpatch.pl. Bindings are naturally separate from driver and should
precede the driver as the driver musn't use undocumented bindings.

Thanks.

-- 
Sakari Ailus
e-mail: sakari.ailus@iki.fi
