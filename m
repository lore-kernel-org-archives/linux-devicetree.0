From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2 1/3] pinctrl: Document "function" + "pins" pinmux binding
Date: Tue, 7 Apr 2015 15:20:33 +0200
Message-ID: <CACRpkdZ=kCyW37z-2C-2aK_Y8HaEwnfGXxfFNfMiUKkJSYpUAg@mail.gmail.com>
References: <1427757416-14491-1-git-send-email-abrestic@chromium.org>
        <1427757416-14491-2-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1427757416-14491-2-git-send-email-abrestic@chromium.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Andrew Bresticker <abrestic@chromium.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux MIPS <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 31, 2015 at 1:16 AM, Andrew Bresticker
<abrestic@chromium.org> wrote:

> Currently the "function" + "groups" combination is the only documented
> format for pinmux nodes, although many drivers use "function" + "pins".
> Update the generic pinctrl binding to include the "function" + "pins"
> combination as well.
>
> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
> Cc: Kumar Gala <galak@codeaurora.org>
> ---
> New for v2.

Patch applied, as it just documents what some drivers are
already doing. Not much to be discussed there.

Yours,
Linus Walleij
