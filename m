From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH] pinctrl: dove: add PMU functions to pinctrl
Date: Mon, 13 May 2013 16:00:02 -0400
Message-ID: <20130513200002.GY31290@titan.lakedaemon.net>
References: <1367883368-27889-1-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1367883368-27889-1-git-send-email-sebastian.hesselbarth@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Stephen Warren <swarren@wwwdotorg.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Grant Likely <grant.likely@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, May 07, 2013 at 01:36:08AM +0200, Sebastian Hesselbarth wrote:
> Dove power management unit can mux some special functions to mpp0-15.
> This patch adds support to set/get the current PMU function mapped
> to the corresponding mpp pins. The device tree documentation is also
> updated accordingly.
> 
> Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> ---
> Cc: Grant Likely <grant.likely@linaro.org>
> Cc: Rob Herring <rob.herring@calxeda.com>
> Cc: Rob Landley <rob@landley.net>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Stephen Warren <swarren@wwwdotorg.org>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: devicetree-discuss@lists.ozlabs.org
> Cc: linux-doc@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  .../bindings/pinctrl/marvell,dove-pinctrl.txt      |   49 ++--
>  drivers/pinctrl/mvebu/pinctrl-dove.c               |  244 +++++++++++++++++---
>  2 files changed, 249 insertions(+), 44 deletions(-)

Sebastian,

Do you intend to have anything depending on these changes in this merge
window?

thx,

Jason.
