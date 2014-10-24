From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v3 1/3] Add HS-USB device tree support for R8A7791/Koelsch/Henninger
 board
Date: Fri, 24 Oct 2014 14:23:56 +0900
Message-ID: <5449E26C.7030602@renesas.com>
References: <1511869.4ca9KHmSFr@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1511869.4ca9KHmSFr@wasted.cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "horms@verge.net.au" <horms@verge.net.au>
Cc: "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Simon-san,

(2014/10/09 2:59), Sergei Shtylyov wrote:
> Hello.
> 
>    Here's the set of 3 patches against Simon Horman's 'renesas.git' repo,
> 'renesas-devel-20141007-v3.17' tag. Here we add the HS-USB device tree support
> on the R8A7791/Koelsch/Henninger reference boards. The patchset requires the
> USB PHY driver (already merged by Kishon and Greg) and the generic PHY support
> patches for the HS-USB driver posted by Yoshihiro Shimoda in order to work...
> 
> [1/3] ARM: shmobile: r8a7791: add HS-USB device node
> [2/3] ARM: shmobile: koelsch: enable HS-USB
> [3/3] ARM: shmobile: henninger: enable HS-USB

I will also rebase this patch set.

Best regards,
Yoshihiro Shimoda

> WBR, Sergei
> 
