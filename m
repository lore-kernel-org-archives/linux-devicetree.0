From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/4] iio: potentiometer: mcp4531: Add device tree
 binding documentation
Date: Thu, 30 Jun 2016 21:19:57 -0500
Message-ID: <20160701021957.GA17269@rob-hp-laptop>
References: <1467272091-28087-1-git-send-email-florian.vaussard@heig-vd.ch>
 <1467272091-28087-3-git-send-email-florian.vaussard@heig-vd.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1467272091-28087-3-git-send-email-florian.vaussard@heig-vd.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Vaussard <florian.vaussard@gmail.com>
Cc: devicetree@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Peter Rosin <peda@axentia.se>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Slawomir Stepien <sst@poczta.fm>, Joachim Eastwood <manabian@gmail.com>, Matt Ranostay <mranostay@gmail.com>, Cristina Moraru <cristina.moraru09@gmail.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Florian Vaussard <florian.vaussard@heig-vd.ch>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 30, 2016 at 09:34:49AM +0200, Florian Vaussard wrote:
> Add the device tree documentation for all the supported parts. Apart the
> compatible string and standard I2C binding, no other binding is currently
> needed.
> 
> Signed-off-by: Florian Vaussard <florian.vaussard@heig-vd.ch>
> ---
>  .../devicetree/bindings/i2c/trivial-devices.txt    | 64 ++++++++++++++++++++++
>  1 file changed, 64 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
