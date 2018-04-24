From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] doc: usb: ci-hdrc-usb2: Add property "mux-controls"
Date: Tue, 24 Apr 2018 08:59:32 -0500
Message-ID: <20180424135932.hsua6kjas5b5drdy@rob-hp-laptop>
References: <1523973206-2165-1-git-send-email-yossim@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1523973206-2165-1-git-send-email-yossim@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Yossi Mansharoff <yossim@codeaurora.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, swboyd@chromium.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 17, 2018 at 04:53:25PM +0300, Yossi Mansharoff wrote:
> The chipidea usb controller may be connected, in some platforms,
> to an external mux to toggle between different usb ports for
> different roles (host and device).
> 
> The mux-controller property, if set, binds the chipidea usb
> controller with a mux for this use.
> 
> Signed-off-by: Yossi Mansharoff <yossim@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
