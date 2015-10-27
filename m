From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v2 02/13] arc: use common make variables for dtb builds
Date: Tue, 27 Oct 2015 12:53:07 +0000
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F44CD60C@IN01WEMBXA.internal.synopsys.com>
References: <1444326827-3565-1-git-send-email-robh@kernel.org>
 <1444326827-3565-3-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Grant Likely <grant.likely@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

On Thursday 08 October 2015 11:24 PM, Rob Herring wrote:

Use dtb-y and always make variables to build dtbs instead of explicit
dtbs rule. This is in preparation to support building all dtbs.

Signed-off-by: Rob Herring <robh@kernel.org><mailto:robh@kernel.org>
Cc: Vineet Gupta <vgupta@synopsys.com><mailto:vgupta@synopsys.com>

Acked-by: Vineet Gupta <vgupta@synopsys.com><mailto:vgupta@synopsys.com>
