From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/6] gpio: add lpc18xx gpio driver
Date: Tue, 5 May 2015 17:30:16 +0200
Message-ID: <CACRpkdZa0TeeCagyOOQwsKVLQ6-Ab99wzEznwGV7x8y7YNr=BQ@mail.gmail.com>
References: <1428095767-6286-1-git-send-email-manabian@gmail.com>
 <1428095767-6286-4-git-send-email-manabian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1428095767-6286-4-git-send-email-manabian@gmail.com>
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
Cc: Alexandre Courbot <gnurou@gmail.com>, Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, ariel.dalessandro@gmail.com, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, ezequiel@vanguardiasur.com.ar, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 3, 2015 at 11:16 PM, Joachim Eastwood <manabian@gmail.com> wrote:

> Driver for the GPIO block found on NXP LPC18xx/43xx devices.
>
> The GPIO block is divided into 8 ports which each support up
> to 32 gpios. The which gpios that are available depends on the
> specific device and it's package.
>
> Signed-off-by: Joachim Eastwood <manabian@gmail.com>

Patch applied. Needed some rebasing but whatever.

Yours,
Linus Walleij
