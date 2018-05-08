Return-Path: <SRS0=2PWB=H3=gmail.com=festevam@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20180507155655.1555-1-rui.silva@linaro.org>
References: <20180507155655.1555-1-rui.silva@linaro.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 8 May 2018 10:29:59 -0300
Message-ID: <CAOMZO5APU9CTGukYsQarPCvp=e8P6LgOWbNFx-dhnKM_3UHf+A@mail.gmail.com>
Subject: Re: [PATCH 0/4] media: ov2680: follow up from initial version
Content-Type: text/plain; charset="UTF-8"
To: Rui Miguel Silva <rui.silva@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh+dt@kernel.org>, linux-media <linux-media@vger.kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Ryan Harkin <ryan.harkin@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Hi Rui,

On Mon, May 7, 2018 at 12:56 PM, Rui Miguel Silva <rui.silva@linaro.org> wrote:
> Sorry I have Out-of-Office some part of last week, I had v6 of the original
> series ready but since I have received the notification from patchwork that the
> v5 was accepted, I am sending this as a follow up tha address Fabio comments.
>
> - this adds the power supplies to this sensor
> - fix gpio polarity and naming.
>
> Cheers,
>    Rui
>
>
> Rui Miguel Silva (4):
>   media: ov2680: dt: add voltage supplies as required
>   media: ov2680: dt: rename gpio to reset and fix polarity
>   media: ov2680: rename powerdown gpio and fix polarity
>   media: ov2680: add regulators to supply control

As the initial ov2680 series has not been applied, I think it would be
better if you send a new version with all these fixes.
