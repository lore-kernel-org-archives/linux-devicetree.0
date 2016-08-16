From: Ramiro Oliveira <Ramiro.Oliveira@synopsys.com>
Subject: Re: [PATCH v2 0/2] OV5647 sensor driver
Date: Tue, 16 Aug 2016 16:35:50 +0100
Message-ID: <952fa435-162a-47b9-2d4d-d033cdb127b5@synopsys.com>
References: <cover.1467107991.git.roliveir@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <cover.1467107991.git.roliveir@synopsys.com>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, mchehab@s-opensource.com, hverkuil@xs4all.nl
List-Id: devicetree@vger.kernel.org

Hello,

Just adding some people in the CC list.

On 16-08-2016 16:26, Ramiro Oliveira wrote:
> Hello,
>
> This patch adds support for the Omnivision OV5647 sensor.
>
> At the moment it only supports 640x480 in Raw 8.
>
> Ramiro Oliveira (2):
>   Add OV5647 device tree documentation
>   Add support for Omnivision OV5647
>
>  .../devicetree/bindings/media/i2c/ov5647.txt       |  19 +
>  MAINTAINERS                                        |   7 +
>  drivers/media/i2c/Kconfig                          |  12 +
>  drivers/media/i2c/Makefile                         |   1 +
>  drivers/media/i2c/ov5647.c                         | 891 +++++++++++++++++++++
>  5 files changed, 930 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5647.txt
>  create mode 100644 drivers/media/i2c/ov5647.c
>
