From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3] Axi-usb: Add support for 64-bit addressing.
Date: Mon, 30 May 2016 10:16:43 +0200
Message-ID: <5333252.Un7tdhWc5Q@wuerfel>
References: <1464067268-35299-1-git-send-email-navam@xilinx.com> <CAL_Jsq+VL6jjo5QLwnsC8rEfgP4KN5hCSB7QicWWN-uvZU0GHw@mail.gmail.com> <C89496FEAE474D468F30D558A9468D9F26CEEBAB@XAP-PVEXMBX01.xlnx.xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <C89496FEAE474D468F30D558A9468D9F26CEEBAB@XAP-PVEXMBX01.xlnx.xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nava kishore Manne <nava.manne@xilinx.com>
Cc: Rob Herring <robh@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, Michal Simek <michals@xilinx.com>, Soren Brinkmann <sorenb@xilinx.com>, "balbi@ti.com" <balbi@ti.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Hyun Kwon <hyunk@xilinx.com>, Radhey Shyam Pandey <radheys@xilinx.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Monday, May 30, 2016 5:46:21 AM CEST Nava kishore Manne wrote:
> >
> The Axi-usb 5.00 IP is a FPGA based one. This IP needs to support two=
 H/w designs one with 32 bit DMA addressing another one is 64 bit DMA a=
ddressing.
> And also in the software point for view we don=E2=80=99t have any reg=
ister to figure out whether it is supporting 32 bit DMA addressing or 6=
4 bit DMA addressing.
> To support both the designs I kept addrwidth property in the dt. I th=
ink here addrwidth property is make sense to differentiate the h/w conf=
igurations.
> If you want me to changes it to boolean please let me know I will fix=
 it in the next version.

I think boolean would be more logical here, since what is configurable
here is not how many bits are supported, but whether the XUSB_DMA_DSAR_=
ADDR
register is present or not.

	Arnd
