From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: usb: fusb302: Use usb-connector
 bindings for  configuration
Date: Fri, 31 Aug 2018 08:17:40 -0400
Message-ID: <20180831121740.GA21868@bogus>
References: <cover.1534853047.git.Adam.Thomson.Opensource@diasemi.com>
 <6472fd66d20df31165f9645eb49f4f30a0a51468.1534853047.git.Adam.Thomson.Opensource@diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6472fd66d20df31165f9645eb49f4f30a0a51468.1534853047.git.Adam.Thomson.Opensource@diasemi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Hans de Goede <hdegoede@redhat.com>, Li Jun <jun.li@nxp.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, support.opensource@diasemi.com
List-Id: devicetree@vger.kernel.org

On Tue, 21 Aug 2018 13:28:22 +0100, Adam Thomson wrote:
> There are now generic usb-connector bindings which can be used
> to define a port controllers configuration for USB-PD, so device
> specific bindings are no longer necessary.
> 
> This update deprecates 'fcs,operating-sink-microwatt', and references
> the 'usb-connector' bindings instead to achieve the required port
> config.
> 
> Signed-off-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> ---
>  .../devicetree/bindings/usb/fcs,fusb302.txt        | 32 +++++++++++++++++-----
>  1 file changed, 25 insertions(+), 7 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
