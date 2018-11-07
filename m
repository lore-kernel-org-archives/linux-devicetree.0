From: Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [PATCH v4 3/4] media: i2c: Add MAX9286 driver
Date: Wed, 7 Nov 2018 18:24:18 +0100
Message-ID: <898b4698-c3c3-9d38-e117-6a4274ba2ca4@lucaceresoli.net>
References: <20181102154723.23662-1-kieran.bingham@ideasonboard.com>
 <20181102154723.23662-4-kieran.bingham@ideasonboard.com>
 <bfae74db-aa54-32b3-966b-b8d17f2e366b@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <bfae74db-aa54-32b3-966b-b8d17f2e366b@ideasonboard.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: kieran.bingham+renesas@ideasonboard.com, Kieran Bingham <kieran.bingham@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org, sakari.ailus@iki.fi, =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>, Jacopo Mondi <jacopo@jmondi.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-kernel@vger.kernel.org, Jacopo Mondi <jacopo+renesas@jmondi.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>
List-Id: devicetree@vger.kernel.org

Hi Kieran,

thanks for the clarification. One additional note below.

On 07/11/18 16:06, Kieran Bingham wrote:
> Hi Luca
> 
> <Top posting for new topic>
> 
>> <lucaceresoli> kbingham: hi, I'm looking at your GMSL v4 patches
>> <lucaceresoli> kbingham: jmondi helped me in understanding parts of it, but I still have a question
>> <lucaceresoli> kbingham: are the drivers waiting for the established link before the remote chips are accessed? where?
> 
> I'm replying here rather than spam the IRC channel with a big paste.
> It's also a useful description to the probe sequence, so I've kept it
> with the driver posting.
> 
> I hope the following helps illustrate the sequences which are involved:
> 
> max9286_probe()
>  - max9286_i2c_mux_close() # Disable all links
>  - max9286_configure_i2c # Configure early communication settings
>  - max9286_init():
>    - regulator_enable() # Power up all cameras
>    - max9286_setup() # Most link setup is done here.
>    ... Set up v4l2/async/media-controller endpoints
>    - max9286_i2c_mux_init() # Start configuring cameras:
>      - i2c_mux_alloc() # Create our mux device
>      - for_each_source(dev, source)
>            i2c_mux_add_adapter() # This is where sensors get probed.
> 
> So yes sensors are only communicated with once the link is brought up as
> much as possible.

For the records, an additional bit of explanation I got from Kieran via IRC.

The fact that link is already up when the sensors are probed is due to
the fact that the power regulator has a delay of *8 seconds*. This is
intended, because there's an MCU on the camera modules that talks on the
I2C bus during that time, and thus the drivers need to wait after it's done.

This delay happens before max9286_setup() is called.

> Because the sensors are i2c devices on the i2c_mux - they are not probed
> until their adapters are created and added.
> 
> At this stage the i2c-mux core framework will iterate all the devices
> described by the DT for that adapter.
> 
> As each one is probed - the i2c_mux framework will call
> max9286_i2c_mux_select() and enable only the single link.
> 
> This allows us to configure each camera independently
> 
> (which is essential because they are all configured to the same i2c
> address by default at power on)
> 
> 
> Hope this helps, and feel free to ask if you have any more questions.
-- 
Luca
