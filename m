From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 1/7] mhi_bus: core: initial checkin for modem host
 interface bus driver
Date: Mon, 9 Jul 2018 22:52:54 +0200
Message-ID: <20180709205254.GB1202@kroah.com>
References: <1524795811-21399-1-git-send-email-sdias@codeaurora.org>
 <1531166894-30984-1-git-send-email-sdias@codeaurora.org>
 <1531166894-30984-2-git-send-email-sdias@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1531166894-30984-2-git-send-email-sdias@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sujeev Dias <sdias@codeaurora.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Tony Truong <truong@codeaurora.org>, Siddartha Mohanadoss <smohanad@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 09, 2018 at 01:08:08PM -0700, Sujeev Dias wrote:
> This is the initial skeleton driver for mhi bus stack. MHI Host
> Interface is a communication protocol to be used by the host to
> control and communcate with modem over a high speed peripheral bus.
> This module will allow host to communicate with external devices that
> support MHI protocol.
> 
> Signed-off-by: Sujeev Dias <sdias@codeaurora.org>
> Reviewed-by: Tony Truong <truong@codeaurora.org>
> Signed-off-by: Siddartha Mohanadoss <smohanad@codeaurora.org>
> ---
>  Documentation/00-INDEX                        |   2 +
>  Documentation/devicetree/bindings/bus/mhi.txt | 258 ++++++++++++
>  Documentation/mhi.txt                         | 235 +++++++++++

Do not put .txt files in the root of the documentation directory for no
reason.  They should be in .rst and hopefully in the proper location for
where the documentation belongs.

And dt bindings always belong in a separate patch, you all know better
than to mush it into a large one like this...

thanks,

greg k-h
