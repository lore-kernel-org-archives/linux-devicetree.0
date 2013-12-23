From: Oliver Hartkopp <socketcan@hartkopp.net>
Subject: Re: [PATCH] can: mcp251x: Add device tree support
Date: Mon, 23 Dec 2013 08:58:52 +0100
Message-ID: <52B7ED3C.8090106@hartkopp.net>
References: <1387602101-27851-1-git-send-email-shc_work@mail.ru> <52B7E2BB.3030103@epfl.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-can-owner@vger.kernel.org>
In-Reply-To: <52B7E2BB.3030103@epfl.ch>
Sender: linux-can-owner@vger.kernel.org
To: florian.vaussard@epfl.ch
Cc: Alexander Shiyan <shc_work@mail.ru>, linux-can@vger.kernel.org, Wolfgang Grandegger <wg@grandegger.com>, Marc Kleine-Budde <mkl@pengutronix.de>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 23.12.2013 08:14, Florian Vaussard wrote:

> I would say that your patch could be split into several patches, as you
> introduce several
> non-DT changes:
> 
> PATCH 1: use devm_clk_get()
> PATCH 2: convert to device tree
> PATCH 3: add frequency sanity check
> 

The patch is already upstream in David Millers net-next tree:

http://git.kernel.org/cgit/linux/kernel/git/davem/net-next.git/commit/?id=66606aafd8cd6cffbefa463b27e1f16e793e40a9

Regards,
Oliver
