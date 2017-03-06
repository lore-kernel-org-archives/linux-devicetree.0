From: Jiri Kosina <jikos@kernel.org>
Subject: Re: [PATCH v5 1/2] devicetree: i2c-hid: Add regulator support
Date: Mon, 6 Mar 2017 13:50:18 +0100 (CET)
Message-ID: <alpine.LSU.2.20.1703061349090.31814@cbobk.fhfr.pm>
References: <20170210020357.10679-1-briannorris@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <20170210020357.10679-1-briannorris@chromium.org>
Sender: linux-input-owner@vger.kernel.org
To: Brian Norris <briannorris@chromium.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, Caesar Wang <wxt@rock-chips.com>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Doug Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

On Thu, 9 Feb 2017, Brian Norris wrote:

> From: Caesar Wang <wxt@rock-chips.com>
> 
> Document a "vdd-supply" and an initialization delay. Can be used for
> powering on/off a HID.
> 
> Signed-off-by: Caesar Wang <wxt@rock-chips.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Jiri Kosina <jikos@kernel.org>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
> Sorry for the delay on resending this. I *think* I've addressed all the
> concerns from last time though?

Both patches applied to for-4.12/i2c-hid. Thanks,

-- 
Jiri Kosina
SUSE Labs

