From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] arm64: dts: juno/rtsm: re-structure motherboard
 includes
Date: Wed, 23 May 2018 09:59:27 +0200
Message-ID: <CACRpkdZgexdti2ko1APDi5Pk6F9yN2Et1v-uO2b72jR2PizEOw@mail.gmail.com>
References: <1525884291-18851-1-git-send-email-sudeep.holla@arm.com>
 <1525884291-18851-3-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1525884291-18851-3-git-send-email-sudeep.holla@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 9, 2018 at 6:44 PM, Sudeep Holla <sudeep.holla@arm.com> wrote:

> It is a bit unorthodox to just include a file in the middle of a another
> DTS file, it breaks the pattern from other device trees and also makes
> it really hard to reference things across the files with phandles.
>
> Restructure the include for the Juno/RTSM motherboards to happen at the
> top of the file, reference the target nodes directly, and indent the
> motherboard .dtsi files to reflect their actual depth in the hierarchy.
>
> This is a purely syntactic change that result in the same DTB files from
> the DTS/DTSI files. This is based on similar patch from Linus Walleij
> for ARM Vexpress platforms.
>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for doing this, it is much more readable for me now.

Sorry for slow review :/

Yours,
Linus Walleij
