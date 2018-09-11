From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: usb: fusb302: Use usb-connector
 bindings for configuration
Date: Tue, 11 Sep 2018 17:36:06 +0300
Message-ID: <20180911143606.GD22723@kuha.fi.intel.com>
References: <cover.1536580772.git.Adam.Thomson.Opensource@diasemi.com>
 <552e94b9a1cf89069be7d36d6476d5df26970406.1536580772.git.Adam.Thomson.Opensource@diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <552e94b9a1cf89069be7d36d6476d5df26970406.1536580772.git.Adam.Thomson.Opensource@diasemi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Hans de Goede <hdegoede@redhat.com>, Li Jun <jun.li@nxp.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, support.opensource@diasemi.com
List-Id: devicetree@vger.kernel.org

Hi Adam,

On Mon, Sep 10, 2018 at 01:24:27PM +0100, Adam Thomson wrote:
> There are now generic usb-connector bindings which can be used
> to define a port controllers configuration for USB-PD, so device
> specific bindings are no longer necessary.
> 
> This update deprecates 'fcs,operating-sink-microwatt', and references
> the 'usb-connector' bindings instead to achieve the required port
> config.
> 
> Signed-off-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

I've applied this patch to my tree:
https://github.com/krohei/linux/commit/2b486e5939148f1623ecbc8dbe20432e12460e16

I will resend it to Greg together with all the other Type-C patches
that are ready next week after v4.19-rc4 unless Greg has picked it
himself before that.


Thanks,

-- 
heikki
