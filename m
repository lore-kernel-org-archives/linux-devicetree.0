From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/4] usb: usb251xb: dt: add unit suffix to oc-delay
 and power-on-time
Date: Wed, 15 Mar 2017 15:12:37 -0500
Message-ID: <20170315201237.tgwc2fza7zoza7ix@rob-hp-laptop>
References: <1488788663-21084-1-git-send-email-richard.leitner@skidata.com>
 <1488788663-21084-3-git-send-email-richard.leitner@skidata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1488788663-21084-3-git-send-email-richard.leitner@skidata.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Leitner <richard.leitner@skidata.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, mark.rutland@arm.com, dev@g0hl1n.net
List-Id: devicetree@vger.kernel.org

On Mon, Mar 06, 2017 at 09:24:21AM +0100, Richard Leitner wrote:
> Rename oc-delay-* to oc-delay-us and make it expect a time value.
> Furthermore add -ms suffix to power-on-time. There changes were
> suggested by Rob Herring in https://lkml.org/lkml/2017/2/15/1283.
> 
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> ---
>  Documentation/devicetree/bindings/usb/usb251xb.txt | 10 ++++---

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/usb/misc/usb251xb.c                        | 35 ++++++++++++----------
>  2 files changed, 26 insertions(+), 19 deletions(-)
