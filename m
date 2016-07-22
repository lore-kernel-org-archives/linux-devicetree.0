From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v3 3/8] Input: synaptics-rmi4: Add dribble and palm
 gesture parameters to device tree
Date: Fri, 22 Jul 2016 09:52:39 -0700
Message-ID: <20160722165239.GA5036@dtor-ws>
References: <1468476522-8032-1-git-send-email-aduggan@synaptics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-input-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1468476522-8032-1-git-send-email-aduggan@synaptics.com>
Sender: linux-input-owner@vger.kernel.org
To: Andrew Duggan <aduggan@synaptics.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Vincent Huang <vincent.huang@tw.synaptics.com>, Nick Dyer <nick@shmanahar.org>, Chris Healy <cphealy@gmail.com>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 13, 2016 at 11:08:42PM -0700, Andrew Duggan wrote:
> Signed-off-by: Andrew Duggan <aduggan@synaptics.com>
> ---
> This version includes Nick's suggestion of adding force to the device tree
> parameters so make it obvious that these parameters overwrite the
> default values set in the firware config.

Why do we want to support overwriting firmware behavior in DT instead of
flashing new firmware as needed by the product?

Thanks.

-- 
Dmitry
