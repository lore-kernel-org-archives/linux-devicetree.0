From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 2/4] dt-bindings: Add root properties for Raspberry Pi
 B and B+
Date: Sat, 17 Jan 2015 20:05:38 -0700
Message-ID: <54BB2302.9070005@wwwdotorg.org>
References: <1421426897-27225-1-git-send-email-stefan.wahren@i2se.com> <1421426897-27225-3-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1421426897-27225-3-git-send-email-stefan.wahren@i2se.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: lee@kernel.org, linux@arm.linux.org.uk, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 01/16/2015 09:48 AM, Stefan Wahren wrote:
> This patch adds root compatible properties for the following boards:
> - Raspberry Pi Model B
> - Raspberry Pi Model B+

We may as well add all the models while at it. I think the following is
a complete list so far:

"model-b-i2c0": early model B with I2C0 rather than I2C1 routed to the
expansion header.

model-b

model-a

model-b-rev2

model-b-plus

compute-module

model-a-plus

FWIW, take a look at the following file to see U-Boot's board
identification code for the various models. Ideally we'll create
matching DT files in the kernel for all of the DT filenames there, sometime.

> http://git.denx.de/?p=u-boot.git;a=blob;f=board/raspberrypi/rpi/rpi.c;h=c18271fce823f7523a8958352701bfe3ea7086c7;hb=HEAD#l82
