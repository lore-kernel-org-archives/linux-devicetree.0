From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/5] RFC: Mezzanine handling for 96boards
Date: Tue, 26 Jun 2018 10:09:45 +0200
Message-ID: <CACRpkdb1GksbePt6XgePCD6g-z4fxY-LF-gpyRfQVxCrq226fg@mail.gmail.com>
References: <20180618074556.6944-1-linus.walleij@linaro.org>
 <CAK8P3a2KqoX-squhGc8TBuJ==8xxELsuy-H+c1+C7Fu7Z4OjDA@mail.gmail.com>
 <CAKv+Gu-gAkfRsEUOc=iyxi6Twvg9cbvWNqNHRS2HzUDZg8xUhg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAKv+Gu-gAkfRsEUOc=iyxi6Twvg9cbvWNqNHRS2HzUDZg8xUhg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Frank Rowand <frowand.list@gmail.com>, Michal Simek <michal.simek@xilinx.com>, Rob Herring <robh+dt@kernel.org>, dev <dev@lists.96boards.org>, Mark Brown <broonie@kernel.org>, John Stultz <john.stultz@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 18, 2018 at 3:22 PM Ard Biesheuvel
<ard.biesheuvel@linaro.org> wrote:

> We should also consider firmware use of the mezzanines. For instance,
> the Secure96 has a RNG which UEFI may want to use so the early boot
> code can access is for KASLR. It also has a TPM, which should not be
> reset/reinitialized/etc by the OS if we want to make meaningful use of
> it.

This problem: sharing or dedicating a piece of hardware to UEFI or
the TrustZone secure world is a generic problem not related to
mezzanines or plug-in boards specifically.

c.f.
arch/arm64/boot/dts/arm/juno-motherboard.dtsi:

flash@0,00000000 {
        /* 2 * 32MiB NOR Flash memory mounted on CS0 */
        compatible = "arm,vexpress-flash", "cfi-flash";
        linux,part-probe = "afs";
        reg = <0 0x00000000 0x04000000>;
        bank-width = <4>;
        /*
         * Unfortunately, accessing the flash disturbs
         * the CPU idle states (suspend) and CPU
         * hotplug of the platform. For this reason,
         * flash hardware access is disabled by default.
         */
        status = "disabled";
};

What we need for this is something like

status = "secure-world-exclusive";
status = "UEFI-exclusive";

Or something like the same when using device tree.

If people probe this from sysfs (as in my example) they are
obviously not novice users and they know what they are
doing. For a simple user experience, I suspect device tree
is what we want to use to populate defaults.

> So ideally, DTs can be expressed such that older kernels can still use
> those peripherals.

That kind of expressions are possible already, such as
putting the TPM DT node inside a SoC-specific I2C bus
node. The boot loader can do that for example.

Then they can't also probe the same board from userspace,
obviously. No matter whether they use the idea I present
here or device tree overlays or anything else.

Yours,
Linus Walleij
