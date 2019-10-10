From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v2 3/3] net: ftgmac100: Ungate RCLK for RMII on ASPEED MACs
Date: Thu, 10 Oct 2019 23:44:06 +0000
Message-ID: <CACPK8Xf8rEwCiDe1b+FgHQPscJYXuwKFzfrP1vmFeYde=uawyA@mail.gmail.com>
References: <20191010020756.4198-1-andrew@aj.id.au> <20191010020756.4198-4-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20191010020756.4198-4-andrew@aj.id.au>
Sender: netdev-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Thu, 10 Oct 2019 at 02:07, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> The 50MHz RCLK has to be enabled before the RMII interface will function.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>
