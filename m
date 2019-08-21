From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] Add optional chip erase functionality to AT25 EEPROM
 driver.
Date: Wed, 21 Aug 2019 16:21:11 -0500
Message-ID: <20190821212111.GA26116@bogus>
References: <20190809125358.24440-1-joe.burmeister@devtank.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190809125358.24440-1-joe.burmeister@devtank.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Burmeister <joe.burmeister@devtank.co.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, YueHaibing <yuehaibing@huawei.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 09, 2019 at 01:53:55PM +0100, Joe Burmeister wrote:
> Many, though not all, AT25s have an instruction for chip erase.
> If there is one in the datasheet, it can be added to device tree.
> Erase can then be done in userspace via the sysfs API with a new
> "erase" device attribute. This matches the eeprom_93xx46 driver's
> "erase".
> 
> Signed-off-by: Joe Burmeister <joe.burmeister@devtank.co.uk>
> ---
>  .../devicetree/bindings/eeprom/at25.txt       |  2 +

Please split bindings to a separate patch.

>  drivers/misc/eeprom/at25.c                    | 83 ++++++++++++++++++-
>  2 files changed, 82 insertions(+), 3 deletions(-)
