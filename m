From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 04/14] fsi: master-gpio: Rename and adjust send delay
Date: Thu, 28 Jun 2018 13:40:58 +0930
Message-ID: <CACPK8XfedsD-PYE-7LBrgsJn1a8J0ogN8m+neBuRC1ecXtj6Yw@mail.gmail.com>
References: <20180626232321.12372-1-benh@kernel.crashing.org> <20180626232321.12372-5-benh@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180626232321.12372-5-benh@kernel.crashing.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-aspeed@lists.ozlabs.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>, devicetree <devicetree@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 27 June 2018 at 08:53, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> What the driver called "FSI_GPIO_PRIME_SLAVE_CLOCKS" is what
> the FSI spec calls tSendDelay and should be 16 clocks by
> default.
>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
