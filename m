From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: Re: [PATCH v2 0/8] Add Simple Power-Managed Bus Support
Date: Fri, 9 Jan 2015 11:57:57 +0100
Message-ID: <CAO3366x64phBJ=tHOK03P6Ok_6LxiyLyC9LhjcocuqTx=86cfA@mail.gmail.com>
References: <1418842153-17113-1-git-send-email-geert+renesas@glider.be>
	<CAMuHMdVeEmKiqGTOmevaBDbJ=nBTbSi6d6Xrm0eyvbMTtyU=sA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdVeEmKiqGTOmevaBDbJ=nBTbSi6d6Xrm0eyvbMTtyU=sA@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux PM list <linux-pm@vger.kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 8, 2015 at 8:28 PM, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, Dec 17, 2014 at 7:49 PM, Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
>> The Renesas Bus State Controller (BSC) provides an external bus for
>> connecting multiple external devices to an SoC, driving several chip
>> select lines, for e.g. NOR FLASH, Ethernet and USB.
>> On the kzm9g and ape6evm development boards, an smsc9220 Ethernet
>> controller is connnected to the BSC of an SH-Mobile AG5 (sh73a0) resp.
>> R-Mobile APE6 (r8a73a4) SoC.
>
> [...]
>
>> This was tested on sh73a0/kzm9g-multiplatform. Without this, Ethernet
>> doesn't work, as the ZB clock is disabled by clk_disable_unused().
>> Testing on r8a73a4/ape6evm-multiplatform would be appreciated.
>
> Has anyone tried this on r8a73a4/ape6evm-multiplatform?

Works like a charm.

Tested-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

CU
Uli
