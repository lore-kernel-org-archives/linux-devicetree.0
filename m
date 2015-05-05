From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 0/2] pinctrl for NXP LPC18xx family
Date: Tue, 5 May 2015 17:45:17 +0200
Message-ID: <CACRpkda+U=TwtX76G2bL4hEHF0-dhS4NP40TGTXeU6wayarDCA@mail.gmail.com>
References: <1430172849-3147-1-git-send-email-manabian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1430172849-3147-1-git-send-email-manabian@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joachim Eastwood <manabian@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, ariel.dalessandro@gmail.com, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, ezequiel@vanguardiasur.com.ar, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 28, 2015 at 12:14 AM, Joachim Eastwood <manabian@gmail.com> wrote:

> This patch set adds a pinctrl driver for NXP LPC18xx/43xx devices.
>
> The pinctrl driver uses the generic muxing and properties DT bindings as
> described in pinctrl-bindings.txt. There is still two TODOs left in the
> pinctrl driver regarding property control of special usb1 pins but I would
> like it merged regardless of this. Support will be added once I get USB up
> and running on the MCU.
>
> Checkpatch complains a lot about the driver but that's what you get when
> you embedd a large function/pin spec table from the data sheet I guess.
>
> Changes since v1:
>  - minor white space fixes
>  - split pinctrl/gpio patch set
>  - rebase on v4.1-rc1

Saw this v2 version arrived so took that instead of v1.

Applied.

Yours,
Linus Walleij
