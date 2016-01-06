From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] of/unittest: Show broken behaviour in the platform bus
Date: Wed, 6 Jan 2016 17:25:36 -0600
Message-ID: <CAL_JsqLnDT+Eie5LKK2Vecd7=82Ramsg4YyiBqdsABpdZYSMZQ@mail.gmail.com>
References: <1451909614-5519-1-git-send-email-wsa@the-dreams.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1451909614-5519-1-git-send-email-wsa@the-dreams.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 4, 2016 at 6:13 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
> From: Grant Likely <grant.likely@linaro.org>
>
> Add a single resource to the test bus device to exercise the platform
> bus code a little more. This isn't strictly a devicetree test, but it is
> a corner case that the devicetree runs into. Until we've got platform
> device unittests, it can live here. It doesn't need to be an explicit
> text because the kernel will oops when it is wrong.
>
> Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> Signed-off-by: Grant Likely <grant.likely@linaro.org>
> [wsa: added the comment provided by Grant, rebased, and tested]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied, thanks.

Rob
