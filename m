From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] arc: dts: Remove leading 0x and 0s from bindings notation
Date: Thu, 14 Dec 2017 13:04:11 -0600
Message-ID: <CAL_Jsq+vtq_rhkkyKo=ZntoLbe2vGxVvJ8Hx3xgHjT2GUKTDtQ@mail.gmail.com>
References: <20171214165344.27795-1-malat@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171214165344.27795-1-malat@debian.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Malaterre <malat@debian.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vineet Gupta <vgupta@synopsys.com>, Alexey Brodkin <abrodkin@synopsys.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, arcml <linux-snps-arc@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 14, 2017 at 10:53 AM, Mathieu Malaterre <malat@debian.org> wrote:
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
> ---

For the series,

Reviewed-by: Rob Herring <robh@kernel.org>
