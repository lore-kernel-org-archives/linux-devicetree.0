From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: iio: imx7d-adc: Add
 #io-channel-cells to required
Date: Tue, 23 Apr 2019 09:52:42 +0800
Message-ID: <20190423015240.GA16166@dragon>
References: <20190414183403.21538-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190414183403.21538-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Apr 14, 2019 at 11:34:00AM -0700, Andrey Smirnov wrote:
> Add #io-channel-cells to list of required properties. Needed to be
> able to reference that node by phandle.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: linux-kernel@vger.kernel.org
> Cc: devicetree@vger.kernel.org

Applied, thanks.
