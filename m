From: Talel Shenhar <talel@amazon.com>
Subject: Re: [PATCH 1/2] dt-bindings: spi: dw: add cs-override property
Date: Wed, 10 Oct 2018 13:34:17 +0300
Message-ID: <e4c91e84-34f6-2c3f-4e26-62e6bd25a96f@amazon.com>
References: <1539155293-21750-1-git-send-email-talel@amazon.com>
 <20181010101825.GA6294@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181010101825.GA6294@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "ronenk@amazon.com; jonnyc"@amazon.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, ronenk@amazon.com, barakw@amazon.com, David Woodhouse <dwmw@amazon.co.uk>
List-Id: devicetree@vger.kernel.org

> On Wed, Oct 10, 2018 at 10:08:12AM +0300, Talel Shenhar wrote:
>
>> The dw spi controller has an auto-deselect of Chip-Select, in case there is
>> no data inside the Tx FIFO. While working on platforms with Alpine chips,
> Why would we ever want to use this behaviour?  It will be broken for any
> non-trivial SPI message such as those made with multiple transfers
> anyway.  Why not just unconditionally control it manually?
Thank you for your prompt response.

This behavior (auto-deselect of Chip-Select) is the default behavior of dw spi controller hw.
On Alpine chip there is additional behavior added to the dw spi controller hw that allows the sw to disable this behavior.
This patch allows the dw driver to enable this hw workaround and add the needed sw manual control for it.
