From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v2 1/4] media: ov5695: add support for OV5695 sensor
Date: Wed, 3 Jan 2018 16:30:01 +0200
Message-ID: <20180103143000.527cgl5au43uvvw4@valkosipuli.retiisi.org.uk>
References: <1514534905-21393-1-git-send-email-zhengsq@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1514534905-21393-1-git-send-email-zhengsq@rock-chips.com>
Sender: linux-media-owner@vger.kernel.org
To: Shunqian Zheng <zhengsq@rock-chips.com>
Cc: mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, ddl@rock-chips.com, tfiga@chromium.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 29, 2017 at 04:08:22PM +0800, Shunqian Zheng wrote:
> This patch adds driver for Omnivision's ov5695 sensor,
> the driver supports following features:
>  - supported resolutions
>    + 2592x1944 at 30fps
>    + 1920x1080 at 30fps
>    + 1296x972 at 60fps
>    + 1280x720 at 30fps
>    + 640x480 at 120fps
>  - test patterns
>  - manual exposure/gain(analog and digital) control
>  - vblank and hblank
>  - media controller
>  - runtime pm
> 
> Signed-off-by: Shunqian Zheng <zhengsq@rock-chips.com>

The same comments I've given on the other driver mostly appear to apply
this one as well.

-- 
Sakari Ailus
e-mail: sakari.ailus@iki.fi
