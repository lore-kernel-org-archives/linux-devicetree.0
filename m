From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v10 3/3] backlight arcxcnn add support for ArcticSand
 devices
Date: Mon, 8 May 2017 15:30:58 +0100
Message-ID: <20170508143058.3as24eijzndare4f@dell>
References: <1493823859-22402-1-git-send-email-olimpiu@arcticsand.com>
 <1493823859-22402-3-git-send-email-olimpiu@arcticsand.com>
 <20170505075712.xroroafofrkfxux4@dell>
 <000001d2c5c1$e00500f0$a00f02d0$@arcticsand.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <000001d2c5c1$e00500f0$a00f02d0$@arcticsand.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Olimpiu Dejeu <olimpiu@arcticsand.com>
Cc: robh@kernel.org, linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org, jingoohan1@gmail.com, Brian Dodge <bdodge@arcticsand.com>, joe@perches.com, daniel.thompson@linaro.org, lkp@intel.com, fengguang.wu@intel.com
List-Id: devicetree@vger.kernel.org

On Fri, 05 May 2017, Olimpiu Dejeu wrote:

> >> backlight: Add support for Arctic Sand LED backlight driver chips
> 
> >This should be the subject line of the patch.
> 
> >Out of interest, how are you submitting your patches?
> 
> >If you're not already, you should be using:
> 
>  > `git format-patch ...`
>  > `git send-email ...`
>   
> >> This driver provides support for the Arctic Sand arc2c0608 chip, 
> >>     and provides a framework to support future devices.
> 
> >'\n' here.
> 
> >> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> >> Signed-off-by: Olimpiu Dejeu <olimpiu@arcticsand.com>
> 
> >Biggest point however is that this patch is already in Mainline.
> 
> The only reason for this set of patches is based on the request from Rob Herring for vendor name change from 'arc' to 'arctic'. Not sure how to proceed, please advise.

You need to only re-send the patches which have not been accepted
already.  So fix the comments I gave you on the vendor name patch and
only re-send that one.

> >> ---
> >> v9 => v10:
> >> - Per Rob Herring's request changed vendor-prefix to arctic
> >> v8 => v9:
> >> - Addressing kbuild test robot WARNING: PTR_ERR_OR_ZERO can be used
> >> v7 => v8:
> >> - Version updated to match other patch in set. No other changes.
> >> v6 => v7:
> >> - Addressing issues brought up by Daniel Thompson
> >> v5 => v6:
> >> - Addressing issues brought up by Daniel Thompson
> >> v4 => v5:
> >> - Code style changes per Joe Perches and Jingoo Han
> >> v3 => v4:
> >> - Code style changes per Joe Perches and Jingoo Han
> >> v2 => v3:
> >> - Renamed variables to comply with conventions on naming
> >> - Corrected device name in arcxcnn.h
> >> v1 => v2:
> >> - Removed "magic numbers" to initialize registers
> >> - Cleaned up device tree bindings
> >> - Fixed code style to address comments and pass "checkpatch"
> >> - Removed unneeded debug and testing code
> >> 
> >> 
> >>  drivers/video/backlight/Kconfig      |   7 +
> >>  drivers/video/backlight/Makefile     |   1 +
> >>  drivers/video/backlight/arcxcnn_bl.c | 419 
> >> +++++++++++++++++++++++++++++++++++
> >>  3 files changed, 427 insertions(+)
> >>  create mode 100644 drivers/video/backlight/arcxcnn_bl.c
> >> 
> 
> 

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
