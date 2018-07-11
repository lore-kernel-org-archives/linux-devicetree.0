From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 5/7] mhi_bus: core: add support to get external modem
 time
Date: Wed, 11 Jul 2018 13:32:06 -0600
Message-ID: <20180711193206.GB8659@rob-hp-laptop>
References: <1524795811-21399-1-git-send-email-sdias@codeaurora.org>
 <1531166894-30984-1-git-send-email-sdias@codeaurora.org>
 <1531166894-30984-6-git-send-email-sdias@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1531166894-30984-6-git-send-email-sdias@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sujeev Dias <sdias@codeaurora.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Tony Truong <truong@codeaurora.org>, Siddartha Mohanadoss <smohanad@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 09, 2018 at 01:08:12PM -0700, Sujeev Dias wrote:
> For accurate synchronizations between external modem and
> host processor, mhi host will capture modem time relative
> to host time. Client may use time measurements for adjusting
> any drift between host and modem.
> 
> Signed-off-by: Sujeev Dias <sdias@codeaurora.org>
> Reviewed-by: Tony Truong <truong@codeaurora.org>
> Signed-off-by: Siddartha Mohanadoss <smohanad@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/bus/mhi.txt |   7 +

Put all the binding in one patch.
 
>  Documentation/mhi.txt                         |  41 ++++
>  drivers/bus/mhi/core/mhi_init.c               | 111 +++++++++++
>  drivers/bus/mhi/core/mhi_internal.h           |  57 +++++-
>  drivers/bus/mhi/core/mhi_main.c               | 263 +++++++++++++++++++++++++-
>  drivers/bus/mhi/core/mhi_pm.c                 |   7 +
>  include/linux/mhi.h                           |   7 +
>  7 files changed, 486 insertions(+), 7 deletions(-)
