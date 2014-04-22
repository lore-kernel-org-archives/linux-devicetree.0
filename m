From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl/TB10x: Fix signedness bug
Date: Tue, 22 Apr 2014 14:55:40 +0200
Message-ID: <CACRpkdZwG4pdczNLZdMi3V=wFqPOxWpbME8P-Y2m5ypAn7EU=Q@mail.gmail.com>
References: <20140402111358.GA23000@mwanda>
	<1397227564-8698-1-git-send-email-christian.ruppert@abilis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1397227564-8698-1-git-send-email-christian.ruppert@abilis.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Ruppert <christian.ruppert@abilis.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 11, 2014 at 4:46 PM, Christian Ruppert
<christian.ruppert@abilis.com> wrote:

> In the TB10x pin database, a port index of -1 is used to indicate
> unmuxed GPIO pin groups. This bug fixes a 'cast to unsigned' bug of
> this value.
>
> Thanks to Dan Carpenter for highlighting this.
>
> CC: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Christian Ruppert <christian.ruppert@abilis.com>

Patch applied for fixes.

Yours,
Linus Walleij
