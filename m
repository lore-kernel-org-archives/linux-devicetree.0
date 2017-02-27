From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] usb: usb251xb: remove max_{power,current}_{sp,bp}
 properties
Date: Mon, 27 Feb 2017 13:58:40 -0600
Message-ID: <20170227195840.3qygh6leatwazbfu@rob-hp-laptop>
References: <1487667379-2075-1-git-send-email-richard.leitner@skidata.com>
 <1487667379-2075-2-git-send-email-richard.leitner@skidata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1487667379-2075-2-git-send-email-richard.leitner@skidata.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Leitner <richard.leitner@skidata.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, mark.rutland@arm.com, dev@g0hl1n.net
List-Id: devicetree@vger.kernel.org

On Tue, Feb 21, 2017 at 09:56:17AM +0100, Richard Leitner wrote:
> Remove the max_{power,current}_{sp,bp} properties of the usb251xb driver
> from devicetree. This is done to simplify the dt bindings as requested
> by Rob Herring in https://lkml.org/lkml/2017/2/15/1283. If those
> properties are ever needed by somebody they can be enabled again easily.
> 
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> ---
>  Documentation/devicetree/bindings/usb/usb251xb.txt | 20 ------------------
>  drivers/usb/misc/usb251xb.c                        | 24 ++++------------------
>  2 files changed, 4 insertions(+), 40 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
