Return-Path: <robherring2@gmail.com>
Date: Thu, 31 May 2018 12:27:13 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/1] dw9807: Use the dongwoon,dw9807-vcm compatible string
Message-ID: <20180531172713.GA3654@rob-hp-laptop>
References: <20180529122554.3325-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180529122554.3325-1-sakari.ailus@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, bingbu.cao@linux.intel.com, tian.shu.qiu@linux.intel.com, rajmohan.mani@intel.com
List-ID: <devicetree@vger.kernel.org>

On Tue, May 29, 2018 at 03:25:54PM +0300, Sakari Ailus wrote:
> The original dw9807 DT bindings patch proposed the dongwoon,dw9807
> compatible string. However, the device also includes an EEPROM on a
> different I�C address. Indicate that this is just the VCM part of the
> entire device.
> 
> The EEPROM part is compatible with the at24c64 for read-only access, with
> 1 kiB page size.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> Hi Rob, others,
> 
> The original bindings were missing the EEPROM bit. This change recognises
> it's there, and allows adding more elaborate support for it later on if
> needed.
> 
> If this change is fine, I'll squash it to the original patches that are
> not yet merged:

Looks fine to me.

> 
> <URL:https://patchwork.linuxtv.org/patch/49613/>
> <URL:https://patchwork.linuxtv.org/patch/49614/>
> 
> Thanks.
> 
>  Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807.txt | 2 +-
>  drivers/media/i2c/dw9807.c                                      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
