From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 0/2] arm64: renesas: add H3ULCB board
Date: Thu, 11 Aug 2016 11:10:58 +0200
Message-ID: <20160811091058.GI30475@verge.net.au>
References: <1469382353-14847-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1469382353-14847-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Vladimir,

On Sun, Jul 24, 2016 at 08:45:53PM +0300, Vladimir Barinov wrote:
> Hello,
> 
> This adds the folowing:
> - R8A7795 SoC based H3ULCB low cost board initial device tree
> - Document DT bindings

In principle I am happy to with adding the H3ULCB to mainline but I am wondering
if you could make some adjustments to your patches so they fit the scheme
we usually use when adding new boards (and SoCs) to mainline.

Please split up the first patch as follows:

* A first patch which enables a very small subset of features:
  - One CPU, some memory, a serial port, and anything else required
    to boot to a rudimentary user-space.
  - I am happy for you to post this by itself

* Then follow-up patches which one-by one enable SoC features such
  as more CPUs, more memory, and of course more IP blocks (more serial
  ports, SDHI, etc...)

Furthermore, if any of the SoC features you wish to enable are not already
enabled in mainline for the H3/Salvator-x then please arrange so they
appear at the end of the patchset or provided as a follow-up patchset
(possibly later).
