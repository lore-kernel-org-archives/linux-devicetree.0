From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] of: Improve of_phandle_iterator_next() error message
Date: Wed, 10 Apr 2019 09:07:27 -0500
Message-ID: <20190410140727.GA17374@bogus>
References: <20190403175633.1839-1-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190403175633.1839-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 03, 2019 at 10:56:33AM -0700, Florian Fainelli wrote:
> Understanding why of_phandle_iterator_next() returns an error can
> sometimes be hard to decipher based solely on the error message, a
> typical error example is that #foo-cells = <X> and the phandle property
> used has a smaller number of cells specified, e.g.:
> 
> 	#thermal-sensor-cells = <1>;
> 	phandle = <&scmi_sensor>
> 
> instead of:
> 
> 	phandle <&scmi_sensor 0>;
> 
> Instead, make it clear what the expectations are towards debugging
> incorrect Device Tree faster:
> 
> OF: /thermal-zones/scmi-thermal: #thermal-sensor-cells = 1, found 0 instead
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  drivers/of/base.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied.

Rob
