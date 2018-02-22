From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] arm64: dts: Remove leading 0x and 0s from bindings
 notation
Date: Thu, 22 Feb 2018 17:38:33 +0100
Message-ID: <CAK8P3a1X3-kZ35aPLSn-rmHhCx2E+nBBj=57jeJtzgR5D6FrPQ@mail.gmail.com>
References: <20171214165352.27902-1-malat@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20171214165352.27902-1-malat@debian.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mathieu Malaterre <malat@debian.org>
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>, Tony Luck <tony.luck@intel.com>, Kees Cook <keescook@chromium.org>, David Brown <david.brown@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-msm@vger.kernel.org, Anton Vorontsov <anton@enomsg.org>, Will Deacon <will.deacon@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Wei Xu <xuwei5@hisilicon.com>, Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, Colin Cross <ccross@android.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-soc@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 14, 2017 at 5:53 PM, Mathieu Malaterre <malat@debian.org> wrote:
> Improve the DTS files by removing all the leading "0x" and zeros to fix the
> following dtc warnings:
>
> Warning (unit_address_format): Node /XXX unit name should not have leading "0x"
>
> and
>
> Warning (unit_address_format): Node /XXX unit name should not have leading 0s
>
> Converted using the following command:
>
> find . -type f \( -iname *.dts -o -iname *.dtsi \) -exec sed -E -i -e "s/@0x([0-9a-fA-F\.]+)\s?\{/@\L\1 \{/g" -e "s/@0+([0-9a-fA-F\.]+)\s?\{/@\L\1 \{/g" {} +
>
> For simplicity, two sed expressions were used to solve each warnings separately.
>
> To make the regex expression more robust a few other issues were resolved,
> namely setting unit-address to lower case, and adding a whitespace before the
> the opening curly brace:
>
> https://elinux.org/Device_Tree_Linux#Linux_conventions
>
> This is a follow up to commit 4c9847b7375a ("dt-bindings: Remove leading 0x from bindings notation")
>
> Reported-by: David Daney <ddaney@caviumnetworks.com>
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Mathieu Malaterre <malat@debian.org>

Applied to fixes, thanks!

       Arnd
