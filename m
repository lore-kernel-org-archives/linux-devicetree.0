From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: rtc: Move trivial RTCs to rtc.txt
Date: Mon, 3 Dec 2018 17:45:58 -0600
Message-ID: <20181203234558.GA10722@bogus>
References: <20181111193114.24307-1-alexandre.belloni@bootlin.com>
 <20181111193114.24307-2-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181111193114.24307-2-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Nov 11, 2018 at 08:31:14PM +0100, Alexandre Belloni wrote:
> Move trivial RTCs to the rtc generic binding documentation as they all also
> support at least 'start-year'.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  Documentation/devicetree/bindings/rtc/rtc.txt | 34 +++++++++++++++++++
>  .../devicetree/bindings/trivial-devices.txt   | 24 -------------
>  2 files changed, 34 insertions(+), 24 deletions(-)

Okay if I take these 2 to avoid conflicts with trivial-devices.txt?

Rob
