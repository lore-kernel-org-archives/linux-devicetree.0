From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH v4 0/5] BCM2835 PM driver
Date: Thu, 3 Jan 2019 16:56:15 +0100
Message-ID: <7dde45e2-8e26-5051-dea6-da3566bb5e0e@i2se.com>
References: <20181212235150.6491-1-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181212235150.6491-1-eric@anholt.net>
Content-Language: de-DE
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, Lee Jones <lee.jones@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Eric,

Am 13.12.2018 um 00:51 schrieb Eric Anholt:
> v4 adds the system-power-controller node to the binding as requested
> by Stefan.  No driver changes are added to make the power controller
> behavior optional yet, since it's really unrelated to this series.
>
apologize for my late reply. This whole series is

Acked-by: Stefan Wahren <stefan.wahren@i2se.com>

I would take care of the power controller behavior with an incremental 
patch.

Should i also make patches to add the driver to the relevant defconfigs 
(bcm2835, multi_v7, arm64)?

Thanks
Stefan
