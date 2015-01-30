From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH] media: i2c: add support for omnivision's ov2659 sensor
Date: Fri, 30 Jan 2015 15:46:59 +0000
Message-ID: <CA+V-a8vYvWygFEfCQsBOMsBamSLFOfmw50MgjNPYraahVN8Y+w@mail.gmail.com>
References: <1421365163-29394-1-git-send-email-prabhakar.csengg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1421365163-29394-1-git-send-email-prabhakar.csengg@gmail.com>
Sender: linux-media-owner@vger.kernel.org
To: LMML <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Mauro Carvalho Chehab <m.chehab@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hverkuil@xs4all.nl>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
List-Id: devicetree@vger.kernel.org

Hello,

On Thu, Jan 15, 2015 at 11:39 PM, Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> From: Benoit Parrot <bparrot@ti.com>
>
> this patch adds support for omnivision's ov2659
> sensor.
>
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> Signed-off-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>
> ---
>  .../devicetree/bindings/media/i2c/ov2659.txt       |   33 +
>  .../devicetree/bindings/vendor-prefixes.txt        |    1 +
>  MAINTAINERS                                        |   10 +
>  drivers/media/i2c/Kconfig                          |   11 +
>  drivers/media/i2c/Makefile                         |    1 +
>  drivers/media/i2c/ov2659.c                         | 1623 ++++++++++++++++++++
>  include/media/ov2659.h                             |   33 +
>  7 files changed, 1712 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov2659.txt
>  create mode 100644 drivers/media/i2c/ov2659.c
>  create mode 100644 include/media/ov2659.h
>
gentle ping for review comments.

Cheers,
--Prabhakar Lad
