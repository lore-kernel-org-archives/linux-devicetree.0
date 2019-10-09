From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 0/3] net: ftgmac100: Ungate RCLK for RMII on ASPEED MACs
Date: Wed, 9 Oct 2019 01:11:33 +0000
Message-ID: <CACPK8XeNvHLqurE=bEzJ3qJubpnzP=KqgQZU_4THCvGa3zHYxg@mail.gmail.com>
References: <20191008115143.14149-1-andrew@aj.id.au> <938706da-d329-c4aa-fcce-2d390a4e98f7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <938706da-d329-c4aa-fcce-2d390a4e98f7@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
List-Id: devicetree@vger.kernel.org

On Wed, 9 Oct 2019 at 00:38, Florian Fainelli <f.fainelli@gmail.com> wrote:
>
>
>
> On 10/8/2019 4:51 AM, Andrew Jeffery wrote:
> > Hello,
> >
> > This series slightly extends the devicetree binding and driver for the
> > FTGMAC100 to describe an optional RMII RCLK gate in the clocks property.
> > Currently it's necessary for the kernel to ungate RCLK on the AST2600 in NCSI
> > configurations as u-boot does not yet support NCSI (which uses the RMII).
>
> RMII as in Reduced MII or Reverse MII in that context?

Reduced MII ( https://en.wikipedia.org/wiki/NC-SI#Hardware_interface )

Cheers,

Joel
