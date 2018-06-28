From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 10/14] fsi: Move various master definitions to a common header
Date: Thu, 28 Jun 2018 13:42:13 +0930
Message-ID: <CACPK8XeAg8v-9-PX0wxP7tK5Eb3JrgdPUYaOpRPnzEwtW0BfXA@mail.gmail.com>
References: <20180626232605.13420-1-benh@kernel.crashing.org> <20180626232605.13420-11-benh@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180626232605.13420-11-benh@kernel.crashing.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-aspeed@lists.ozlabs.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>, devicetree <devicetree@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 27 June 2018 at 08:56, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> This moves the definitions for various protocol details
> (message & response codes, delays etc...) out of
> fsi-master-gpio.c to fsi-master.h in order to share them
> with other master implementations.
>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
