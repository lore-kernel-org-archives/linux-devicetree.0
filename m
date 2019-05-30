From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] ARM: dts: vexpress: set the right partition type for NOR
 flash
Date: Thu, 30 May 2019 12:45:52 +0200
Message-ID: <CACRpkdZi3GPjkzyPAXBx2Ffc7DbgLfVhxpBW2q+iMWV5Rfz_4g@mail.gmail.com>
References: <20190530091156.11693-1-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190530091156.11693-1-sudeep.holla@arm.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 30, 2019 at 11:12 AM Sudeep Holla <sudeep.holla@arm.com> wrote:

> We should set up the partitions in the right way so we will find out
> what is in the flash.
>
> The ARM Firmware Suite now has its own compatible and proper device
> tree bindings to trigger discovery of the flash contents, and Linux
> supports handling the new type of AFS partitions.
>
> Based on commit 7f8e78ca90e2 ("arm64: dts: juno: set the right partition
> type for NOR flash")
>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for fixing this!

Yours,
Linus Walleij
