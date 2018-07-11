From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH RFC 2/3] nvmem: add driver for Raspberry Pi OTP
Date: Wed, 11 Jul 2018 10:45:05 +0100
Message-ID: <7c1f6ee8-9572-463f-ccc8-3d12ffccb8f5@linaro.org>
References: <1520602328-28972-1-git-send-email-stefan.wahren@i2se.com>
 <1520602328-28972-3-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1520602328-28972-3-git-send-email-stefan.wahren@i2se.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stefan Wahren <stefan.wahren@i2se.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eric Anholt <eric@anholt.net>, Phil Elwell <phil@raspberrypi.org>
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Stefan,

On 09/03/18 13:32, Stefan Wahren wrote:
> This patch brings read-only support for the Raspberry Pi Customer OTP.
> The driver accesses the OTP via the mailbox property interface
> provided by the VPU firmware.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
>   drivers/nvmem/Kconfig           |  10 +++
>   drivers/nvmem/Makefile          |   2 +
>   drivers/nvmem/raspberrypi-otp.c | 138 ++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 150 insertions(+)
>   create mode 100644 drivers/nvmem/raspberrypi-otp.c

Looks there are some pending trivial comments, are you planning to 
resend this?

--srini
