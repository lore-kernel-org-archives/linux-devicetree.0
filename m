From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Clarify interrupts-extended usage
Date: Thu, 29 Aug 2019 17:57:40 -0500
Message-ID: <20190829225740.GA22740@bogus>
References: <20190827025511.22166-1-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190827025511.22166-1-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Frank Rowand <frowand.list@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Alexandru M Stan <amstan@chromium.org>
List-Id: devicetree@vger.kernel.org

On Mon, 26 Aug 2019 19:55:11 -0700, Stephen Boyd wrote:
> Reading the description about when to use interrupts-extended leads some
> developers to think that it shouldn't be used unless a device has
> interrupts from more than one interrupt controller. This isn't true. We
> should encourage devicetree writers to use this property in situations
> where it isn't the inherited interrupt-parent so that we have less
> properties in a DT node by virtue of not having to specify an
> interrupt-parent and an interrupts property.
> 
> Reported-by: Alexandru M Stan <amstan@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  .../bindings/interrupt-controller/interrupts.txt          | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Applied, thanks.

Rob
