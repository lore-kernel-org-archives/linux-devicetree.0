From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 1/7] mhi_bus: core: initial checkin for modem host
 interface bus driver
Date: Mon, 9 Jul 2018 22:50:47 +0200
Message-ID: <20180709205047.GA1202@kroah.com>
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
>  drivers/bus/Kconfig                           |   8 +
>  drivers/bus/Makefile                          |   1 +
>  drivers/bus/mhi/Makefile                      |   6 +
>  drivers/bus/mhi/core/Makefile                 |   1 +
>  drivers/bus/mhi/core/mhi_init.c               | 538 ++++++++++++++++++++++++++
>  drivers/bus/mhi/core/mhi_internal.h           | 238 ++++++++++++
>  drivers/bus/mhi/core/mhi_main.c               | 122 ++++++
>  include/linux/mhi.h                           | 341 ++++++++++++++++
>  include/linux/mod_devicetable.h               |  12 +
>  12 files changed, 1762 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/mhi.txt
>  create mode 100644 Documentation/mhi.txt
>  create mode 100644 drivers/bus/mhi/Makefile
>  create mode 100644 drivers/bus/mhi/core/Makefile
>  create mode 100644 drivers/bus/mhi/core/mhi_init.c
>  create mode 100644 drivers/bus/mhi/core/mhi_internal.h
>  create mode 100644 drivers/bus/mhi/core/mhi_main.c
>  create mode 100644 include/linux/mhi.h

You don't say what changed from v1 here :(

Please do so...
