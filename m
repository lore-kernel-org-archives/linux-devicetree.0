From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH V2 0/3] ARM: dts: add Raspberry Pi Compute Module 3 and IO
 board
Date: Fri, 31 Aug 2018 11:35:49 +0200
Message-ID: <3736c210-f136-dbbe-9191-e8c8775eb968@i2se.com>
References: <1535393148-24163-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1535393148-24163-1-git-send-email-stefan.wahren@i2se.com>
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
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Phil Elwell <phil@raspberrypi.org>, Alexander Graf <agraf@suse.de>, Eric Anholt <eric@anholt.net>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


Am 27.08.2018 um 20:05 schrieb Stefan Wahren:
> This patch series add support for Rasberry Pi Compute Module 3 and
> Compute Module 3 Lite.
>
> Changes in V2:
> - add Reviewed-by tag from Rob
> - split arm and arm64 into separate patches
>
> Stefan Wahren (3):
>   dt-bindings: bcm: Add Raspberry Pi CM3 and CM3L
>   ARM: dts: add Raspberry Pi Compute Module 3 and IO board
>   arm64: dts: broadcom: Add reference to Compute Module IO Board V3
>

series applied to bcm2835-dt-next
