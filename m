From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: at24/eeprom: add an undocumented compatible
 string
Date: Thu, 7 Dec 2017 16:50:45 -0600
Message-ID: <20171207225045.tm3rnyjaylx46nxy@rob-hp-laptop>
References: <20171206101219.14011-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171206101219.14011-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Mark Rutland <mark.rutland@arm.com>, Wolfram Sang <wsa@the-dreams.de>, Divagar Mohandass <divagar.mohandass@intel.com>, Javier Martinez Canillas <javier@dowhile0.org>, David Lechner <david@lechnology.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 06, 2017 at 11:12:19AM +0100, Bartosz Golaszewski wrote:
> The "atmel,sdp" compatible is reported by checkpatch as undocumented.
> 
> Add it to the device tree bindings document for at24.
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  Documentation/devicetree/bindings/eeprom/eeprom.txt | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
