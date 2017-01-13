From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] iio: distance: srf08: add trivial DT binding
Date: Fri, 13 Jan 2017 11:18:47 -0600
Message-ID: <20170113171847.wrjre7cp6ak6pgzz@rob-hp-laptop>
References: <20170110184744.GA15520@andreas>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170110184744.GA15520@andreas>
Sender: linux-i2c-owner@vger.kernel.org
To: Andreas Klinger <ak@it-klinger.de>
Cc: jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, ktsai@capellamicro.com, wsa@the-dreams.de, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, trivial@kernel.org, mranostay@gmail.com, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 10, 2017 at 07:47:44PM +0100, Andreas Klinger wrote:
> Add DT binding for devantech,srf08
> Add vendor devantech to vendor list
> 
> Signed-off-by: Andreas Klinger <ak@it-klinger.de>
> ---
>  Documentation/devicetree/bindings/i2c/trivial-devices.txt | 1 +
>  Documentation/devicetree/bindings/vendor-prefixes.txt     | 1 +
>  2 files changed, 2 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
