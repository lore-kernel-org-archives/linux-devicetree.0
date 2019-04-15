From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: Device Description for FPGA Components on x86 system
Date: Mon, 15 Apr 2019 13:55:49 +0200
Message-ID: <08e60e79-8ae3-06ac-779e-d4d99e0ed846@metux.net>
References: <1629227.alSmCsHHUc@pcbe13614> <6563205.xRkLC0driV@pcbe13614>
 <dae0b7ba500cc03fab23956eac85ca79@sw-optimization.com>
 <31100498.IIhqzTXyFT@pcbe13614>
 <CANk1AXSQCFGE94R8ZxVSF2Gp+diCHJhFJPSVSx+iEyWp2URcpw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANk1AXSQCFGE94R8ZxVSF2Gp+diCHJhFJPSVSx+iEyWp2URcpw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Tull <atull@kernel.org>, Federico Vaga <federico.vaga@cern.ch>
Cc: Eric Schwarz <eas@sw-optimization.com>, linux-kernel <linux-kernel@vger.kernel.org>, linux-fpga@vger.kernel.org, linux-pci@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-x86_64@vger.kernel.org, linux-fpga-owner@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10.04.19 16:21, Alan Tull wrote:

> I wish I could point you to a complete solution, but there is a lot of> work to be done in this area.  Most of what is in the kernel is a low>
level in-kernel API [4].  As you correctly state, the hardest part of>
this is doing the enumerating if you are on x86 and aren't using>
devicetree.
ACK. I believe, introducing oftree the right way to go. I've got that
on my 2do list, too, but yet too busy w/ other things. So, if you'd
like to work on that, I'd highly appreciate that.

I'd like to also use oftree overlays for some platform drivers that
essentially just initialize/wire up generic drivers to perform some
board specific function (eg. drivers/platform/x86/pcengines-apuv2.c).


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
