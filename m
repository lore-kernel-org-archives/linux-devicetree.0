From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 16/25] arm: zx: dts: Remove leading 0x and 0s from
 bindings notation
Date: Thu, 22 Feb 2018 17:39:35 +0100
Message-ID: <CAK8P3a3KCfjDOGGNCYgX5LkAJi0UaaVUWOJVg=y61G-BB=_T=Q@mail.gmail.com>
References: <20171215124649.30692-1-malat@debian.org>
 <20171226080312.GE23070@X250>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20171226080312.GE23070@X250>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>, Mathieu Malaterre <malat@debian.org>, Russell King <linux@armlinux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>, Jun Nie <jun.nie@linaro.org>, Baoyou Xie <baoyou.xie@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 26, 2017 at 9:03 AM, Shawn Guo <shawnguo@kernel.org> wrote:
> On Fri, Dec 15, 2017 at 01:46:48PM +0100, Mathieu Malaterre wrote:
>> Improve the DTS files by removing all the leading "0x" and zeros to fix the
>> following dtc warnings:
>>
>> Warning (unit_address_format): Node /XXX unit name should not have leading "0x"
>>
>> and
>>
>> Warning (unit_address_format): Node /XXX unit name should not have leading 0s
>>
>> Converted using the following command:
>>
>> find . -type f \( -iname *.dts -o -iname *.dtsi \) -exec sed -i -e "s/@\([0-9a-fA-FxX\.;:#]+\)\s*{/@\L\1 {/g" -e "s/@0x\(.*\) {/@\1 {/g" -e "s/@0+\(.*\) {/@\1 {/g" {} +^C
>>
>> For simplicity, two sed expressions were used to solve each warnings separately.
>>
>> To make the regex expression more robust a few other issues were resolved,
>> namely setting unit-address to lower case, and adding a whitespace before the
>> the opening curly brace:
>>
>> https://elinux.org/Device_Tree_Linux#Linux_conventions
>>
>> This will solve as a side effect warning:
>>
>> Warning (simple_bus_reg): Node /XXX@<UPPER> simple-bus unit address format error, expected "<lower>"
>>
>> This is a follow up to commit 4c9847b7375a ("dt-bindings: Remove leading 0x from bindings notation")
>>
>> Reported-by: David Daney <ddaney@caviumnetworks.com>
>> Suggested-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Mathieu Malaterre <malat@debian.org>
>
> Hi Arnd, Olof,
>
> I do not have any other ZTE ZX platform patches to send you.  Is it okay
> to send this one using IMX branch, or can you apply it to arm-soc
> directly?

Applied to fixes now, thanks and sorry for the delay.

      Arnd
